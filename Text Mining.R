# 과제(~8/22)



# Web Scrapping
# 정제 작업
# Word Cloud 



# 월별 검색 현황(그래프)
## BMW 블로그 Title 웹 크롤링
library(rvest) 
library(dplyr) 
library(ggplot2) 

blog_bmw_data <- function(num){ 
  url_bmw <- paste0("https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query=bmw&sm=tab_pge&srchby=all&st=sim&where=post&start=",num) 
  webpage_bmw <- read_html(url_bmw) 
  title_html <- html_nodes(webpage_bmw, "._sp_each_title") 
  title_data <- html_text(title_html) 
  day_html <- html_nodes(webpage_bmw, ".txt_inline") 
  day_data <- html_text(day_html) 
  day_data <- as.character(day_data) 
  blog_bmw <- data.frame(title_data,day_data) 
  return(blog_bmw) 
}

## 반복문 활용해서 각 페이지마다 제목이랑 포스팅 날짜 불러오기 
blog_bmw <- data.frame() 
for(x in seq(1,991,10)){ 
  blog_bmw <- rbind(blog_bmw, blog_bmw_data(x)) 
}
head(blog_bmw)

## 전처리
blog_bmw <- blog_bmw[-grep("전", blog_bmw$day_data),] 
blog_bmw <- blog_bmw[-grep("어제", blog_bmw$day_data),] 
blog_bmw$day_data <- factor(blog_bmw$day_data) 
blog_bmw <- transform(blog_bmw, YYMM = substr(day_data,1,7))

## 월별 BMW 블로그 포스팅 수
data.frame(table(blog_bmw$YYMM))[1:5,] %>% ggplot(aes(x=Var1, y=Freq, group=1)) +  
  geom_line() + 
  geom_point(col="red") +  
  labs(x=NULL, y="포스팅 수", title="다음 블로그 BMW 관련 월별 포스팅 등록 수") + 
  theme_bw() + 
  theme(plot.title=element_text(face="bold", size=20))



####################################################################################################



# 국내 반응 분석(네이버)
library(httr)

allreviewN = c()
urlN = 'https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query=bmw&sm=tab_pge&srchby=all&st=sim&where=post&start='

## 네이버
for(page in 1:1000)
{
  a = (page - 1) * 10 + 1
  urlsN = paste(urlN,a,sep="")
  htxtN = read_html(urlsN)
  commentsN = html_nodes(htxtN,'dd.sh_blog_passage')
  comtextN = html_text(commentsN)
  if(length(comtextN) == 0)
  {
    break
  }
  allreviewN = c(allreviewN,comtextN)
}
head(allreviewN)

## 1. 필요한(추출해야 할) 코드 확인
data <- c()
for (i in 1:100) { 
  url_bmw <- read_html(paste0("https://auto.naver.com/search/blogSearch.nhn?carTotalCount=427&bikeTotalCount=116&postTotalCount=63419&imageTotalCount=16250&blogTotalCount=534564&cafeTotalCount=1711&query=bmw&searchType=&sortType=&filterType=CAR_FILTER_ALL&page=",i))
  data <- c(data, html_nodes(url_bmw, ".thmb_ct") %>% 
              html_attr('href'))
}
length(data)
head(data)
str(url_bmw)
str(data)

## 2. 텍스트 형태로 변수 저장 
txt <- c()
for (i in 1:10){
  url_bmw <- read_html(data[i])
  temp <- html_nodes(url_bmw, ".se_component_wrap.sect_dsc.__se_component_area") %>% 
    html_text()
  txt <- c(txt,temp)
}
length(txt)
head(txt)

###########################################################################################



# 블로그 글 가져오기
## 1. 필요한(추출해야 할) 코드 확인
data <- c()
for (i in 1:100) { 
  url_bmw <- read_html(paste0("https://search.daum.net/search?w=blog&DA=PGD&enc=utf8&q=bmw&page=",i,"&m=board"))
  data <- c(data, html_nodes(url_bmw, ".wrap_tit.mg_tit") %>% 
              html_nodes('a') %>% 
              html_attr('href'))
}
length(data)
head(data)
str(url_bmw)
str(data)

## 2. 텍스트 형태로 변수 저장 
txt <- c()
for (i in 1:length(data)){
  url_bmw <- read_html(data[i])
  temp <- html_nodes(url_bmw, ".article") %>% 
    html_text()
  txt <- c(txt,temp)
}
length(txt)
head(txt)

# 사전 업데이트
library(KoNLP)
useSejongDic()
buildDictionary(ext_dic="sejong", user_dic = data.frame(readLines("C://data/positive-words-ko-v2.txt"),"ncn"),replace_usr_dic = T)
buildDictionary(ext_dic="sejong", user_dic = data.frame(readLines("C://data/negative-words-ko-v2-2.txt"),"ncn"),replace_usr_dic = T)

# 데이터 로드 
posi <- unlist(readLines("C://data/positive-words-ko-v2.txt"))
nega <- unlist(readLines("C://data/negative-words-ko-v2-2.txt"))
txt2 <- SimplePos09(txt)  

# 데이터 정제
txt_replace <- str_replace_all(unlist(txt2), '/.*',"")
head(txt_replace,7)
length(txt_replace)

greptxt <- grep('[가-R]',txt_replace, value=T)
iftxt <- as.vector(na.omit(ifelse(nchar(greptxt)<=2,NA,greptxt)))
iftxt <- as.vector(str_trim(iftxt))

iftxt <- str_replace_all(iftxt,"'$","")
iftxt <- str_replace_all(iftxt,'’$',"")
iftxt <- str_replace_all(iftxt,"는$","")
iftxt <- str_replace_all(iftxt,'를$',"")
iftxt <- str_replace_all(iftxt,'을$',"")
iftxt <- str_replace_all(iftxt,'들$',"")
iftxt <- str_replace_all(iftxt,'에서$',"")
iftxt <- str_replace_all(iftxt,'보다$',"")
iftxt <- str_replace_all(iftxt,'까지$',"")
iftxt <- str_replace_all(iftxt,'으로$',"")
View(iftxt)

tabtxt <- table(iftxt)

# Sentimental Analysis
positxt <- iftxt[iftxt %in% intersect(iftxt, posi)]
tab_positxt <- table(positxt) ; tab_positxt
negatxt <- iftxt[iftxt %in% intersect(iftxt, nega)]
tab_negatxt <- table(negatxt) ; tab_negatxt

# 워드 클라우드
pal <- brewer.pal(8,"Dark2")
windowsFonts(are=windowsFont("맑은 고딕")) 
wordcloud(words = rownames(tabtxt),
          freq = tabtxt,
          min.freq = 10,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(4,1),
          colors = pal, family = "are")

## 긍정적인 단어
pal <- brewer.pal(8,"Paired")
windowsFonts(are=windowsFont("맑은 고딕")) 
wordcloud(words = rownames(tab_positxt),
          freq = tab_positxt,
          min.freq = 1,
          max.words = 30,
          random.order = F,
          rot.per = .1,
          scale = c(6,1),
          colors = pal, family = "are")
wordcloud2(tab_positxt, color = "random-light", backgroundColor = "black", rotateRatio = 0, shape = "diamond")
?wordcloud2

## 부정적인 단어
pal <- brewer.pal(8,"Dark2")
windowsFonts(are=windowsFont("맑은 고딕")) 
wordcloud(words = rownames(tab_negatxt),
          freq = tab_negatxt,
          min.freq = 1,
          max.words = 50,
          random.order = F,
          rot.per = .1,
          scale = c(4,1),
          colors = pal, family = "are")

library(wordcloud2)
wordcloud2(tab_negatxt, color = "random-light", backgroundColor = "black")

# Barplot으로 비교 
library(ggplot2)
df = data.frame(x = head(sort(tab_positxt, decreasing = T),10), x2 = head(sort(tab_negatxt, decreasing = T),10))
df

df %>% ggplot(aes(x=x.positxt, y=x.Freq)) +
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="감정 분석(한국어)")

df %>% ggplot(aes(x=x2.negatxt, y=x2.Freq)) +
  geom_bar(stat = "identity", fill = "pink", colour = "red") +
  scale_x_discrete(limits = rev(df$x2.negatxt)) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="감정 분석(한국어)")

a <- as.data.frame(sort(head(sort(tab_positxt, decreasing = T),10)))
b <- as.data.frame(head(sort(tab_negatxt, decreasing = T),10))
a$color <- 1
b$color <- 2
colnames(b) <- colnames(a)
c <- rbind(a,b)

## 종합 
windowsFonts(are=windowsFont("맑은 고딕"))
c %>% ggplot(aes(x=positxt, y=Freq)) +
  geom_bar(stat = "identity", aes(fill = ifelse(c$color==1,"긍정","부정")), colour = ifelse(c$color==1,"darkblue","red")) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="기업 선호도 분석(한국어)") +
  theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, size = 10)) +
  theme(axis.ticks.y = element_blank(),axis.text.y = element_blank()) +
  theme(plot.title = element_text(size=20, face="bold", margin = margin(10, 0, 10, 0), family = "are")) +
  scale_colour_manual(name='', values=c('skyblue', 'pink'), aesthetics = "fill") +
  theme(legend.title=element_blank()) +
  theme(plot.background=element_rect(fill="azure")) +
  theme(panel.background=element_rect(fill="white", colour = "black")) +
  geom_hline(yintercept = seq(5,25,5), color = "slategrey")

####################################################################################################



# 해외 반응 분석(트위터)
install.packages("twitteR")
install.packages("ROAuth")
install.packages("syuzhet")
install.packages("dbplyr")

library(twitteR)
library(RColorBrewer)
library(KoNLP)
library(RCurl)
library(ROAuth)
library(qdap) 
library(syuzhet)
library(dbplyr)

twitter.oath = read.csv("C:/data/twitter_oath.csv")
setup_twitter_oauth(twitter.oath$Consumer_Key,twitter.oath$Consumer_Secret,twitter.oath$Access_Token,twitter.oath$Access_Secret)

bmw_tweets <- searchTwitter("BMW",n=5000)
head(bmw_tweets)
length(bmw_tweets)

bmw_text <- lapply(bmw_tweets, function(t)t$getText())
bmw_text <- gsub('\\x','',bmw_text)
bmw_text <- bmw_text[-4]
head(bmw_text,4)

bmw_split <- unlist(str_split(bmw_text, ' '))
bmw_grep <- grep('[a-z]',bmw_split, value = T)

bmw_if <- as.vector(na.omit(ifelse(nchar(bmw_grep)<=2,NA,bmw_grep)))
bmw_grep2 <- grep('^*[^[:punct:]]*$',bmw_if,value = T)

bmw_punct <-c()
for (i in bmw_grep2){
  if (!i %in% c('like','liked','follow','following','savings','sin','unknown')){ 
    bmw_punct<-c(bmw_punct,i)
  }
}
bmw_punct

positive.words = scan("C:/data/positive-words.txt",what = "character",comment.char = ";")
negative.words = scan("C:/data/negative-words.txt",what = "character",comment.char = ";")

postxt <- bmw_punct[bmw_punct %in% intersect(bmw_punct, positive.words)]
tab_postxt <- table(postxt) ; tab_postxt
negtxt <- bmw_punct[bmw_punct %in% intersect(bmw_punct, negative.words)]
tab_negtxt <- table(negtxt) ; tab_negtxt

## Positive Words 
pal <- brewer.pal(8,"Paired")
windowsFonts(are=windowsFont("serif")) 
wordcloud(words = rownames(tab_postxt),
          freq = tab_postxt,
          min.freq = 1,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(4,1),
          colors = pal, family = "are")

## Negative Words
pal <- brewer.pal(8,"Dark2")
windowsFonts(are=windowsFont("serif")) 
wordcloud(words = rownames(tab_negtxt),
          freq = tab_negtxt,
          min.freq = 1,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(5,1),
          colors = pal, family = "are")

# Barplot으로 비교 
library(ggplot2)
df2 = data.frame(x = head(sort(tab_postxt, decreasing = T),10), x2 = head(sort(tab_negtxt, decreasing = T),10))
df2

df2 %>% ggplot(aes(x=x.postxt, y=x.Freq)) +
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="감정 분석(영어)")

df2 %>% ggplot(aes(x=x2.negtxt, y=x2.Freq)) +
  geom_bar(stat = "identity", fill = "pink", colour = "red") +
  scale_x_discrete(limits = rev(df2$x2.negtxt)) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="감정 분석(영어)")

e <- as.data.frame(sort(head(sort(tab_postxt, decreasing = T),10)))
f <- as.data.frame(head(sort(tab_negtxt, decreasing = T),10))
e$color <- 1
f$color <- 2
colnames(f) <- colnames(e)
g <- rbind(e,f)

## 종합 
windowsFonts(are=windowsFont("맑은 고딕"))
g %>% ggplot(aes(x=postxt, y=Freq)) +
  geom_bar(stat = "identity", aes(fill = ifelse(g$color==1,"긍정","부정")), colour = ifelse(g$color==1,"darkblue","red")) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="기업 선호도 분석(영어)") +
  theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, size = 10)) +
  theme(axis.ticks.y = element_blank(),axis.text.y = element_blank()) +
  theme(plot.title = element_text(size=20, face="bold", margin = margin(10, 0, 10, 0), family = "are"))  +
  scale_colour_manual(name='', values=c('skyblue', 'pink'), aesthetics = "fill") +
  theme(legend.title=element_blank()) +
  theme(plot.background=element_rect(fill="azure")) +
  theme(panel.background=element_rect(fill="white", colour = "black")) +
  geom_hline(yintercept = seq(5,25,5), color = "slategrey")




####################################################################################################



# 일본 반응 분석(야후져팬)

# udpipe 패키지 이용 
install.packages("udpipe")
library(udpipe)
model <- udpipe_download_model(language = "japanese")
model <- udpipe_load_model(file = model$file_model)
x <- udpipe_annotate(model, x = "やはりテクノロジ???が進化しても、日本語のデ???タ分析は不可能なのか？そこで弊社 ソリュ???ションコンサルティング第一本部 ??????部長 津田 高治を訪ね、テキストマイニング???ソリュ???ションの必要性や???用性などについて話を伺った。")
x <- as.data.frame(x)
x

## 1. 필요한(추출해야 할) 코드 확인
dataj <- c()
for (i in 1:100) {
  webpagej <- read_html(paste0("https://official.ameba.jp/search?q=BMW&type=blog&page=",i))
  dataj <- c(dataj, html_nodes(webpagej, "#talentSrch .resultSearchLi h3") %>% 
    html_nodes('a') %>% 
    html_attr('href'))
}
length(dataj)
head(dataj)

## 2. 텍스트 형태로 변수 저장 
txtj <- c()
for (i in 1:length(dataj)){
  webpagej <- read_html(dataj[i])
  tempj <- html_nodes(webpagej, ".entry .contents") %>% 
    html_text()
  txtj <- c(txtj,tempj)
}
length(txtj)
head(txtj)

x <- udpipe_annotate(model, x = txtj)
x <- as.data.frame(x)
head(x)


str(x)
x[,c("token","upos")]
jtrim0 <- str_trim(x[,c("token")])
jtrim0 <- x[,c("token")]
head(sort(jtrim0, decreasing = T),5)

jtrim0 <- as.vector(na.omit(ifelse(nchar(jtrim0)<=2,NA,jtrim0)))
jtrim <- jtrim0
jtrim <- as.vector(str_trim(jtrim0))

jtrim <- str_replace_all(jtrim,"[　]","")
jtrim <- str_replace_all(jtrim,"[[:punct:]]","")
jtrim <- str_replace_all(jtrim,"[a-z]","")
jtrim <- str_replace_all(jtrim,"[A-Z]","")
jtrim <- str_replace_all(jtrim,"[Ａ-Ｚ]","")
jtrim <- str_replace_all(jtrim,"[ａ-ｚ]","")
jtrim <- str_replace_all(jtrim,"[[:digit:]]","")
jtrim <- str_replace_all(jtrim,"[[:digit:]]$","")
jtrim <- str_replace_all(jtrim,"^[[:digit:]]","")
jtrim <- str_replace_all(jtrim,"━","")
jtrim <- grep("[[:alpha:]]",jtrim,value = T)

jtrim2 <-c()
for (i in jtrim){
  if (!i %in% c('アクセス','ブログ','受け取れ','リブログ','コメント','ツイ???ト','という',
                'した人一???','なろう','シェア','こんな','しまっ','ニュ???ス','アカウント',
                'でしょ','人一???','ござい','ですね','しまっ','ところ','とても','人一???ツイ???ト')){ 
    jtrim2<-c(jtrim2,i)
  }
}
jtrim2
jtrim <- jtrim2
View(jtrim)

pos_j <- unlist(readLines("C://data/positive-words-jp-v1.txt"))
neg_j <- unlist(readLines("C://data/negative-words-jp-v1.txt"))

Encoding(pos_j) <- "UTF-8"
Encoding(neg_j) <- "UTF-8"

postxt_j <- jtrim[jtrim %in% intersect(jtrim, pos_j)]
tab_postxt_j <- table(postxt_j) ; tab_postxt_j
negtxt_j <- jtrim[jtrim %in% intersect(jtrim, neg_j)]
tab_negtxt_j <- table(negtxt_j) ; tab_negtxt_j
sort(tab_negtxt_j, decreasing = T)

jtable <- table(jtrim)
jsort <- head(sort(jtable, decreasing = T),50)

# Wordcloud
## 종합 
pal <- brewer.pal(8,"Dark2")
wordcloud(words = rownames(jtable),
          freq = jtable,
          min.freq = 1,
          max.words = 30,
          random.order = F,
          rot.per = .1,
          scale = c(30,1),
          colors = pal, family = "are")

## 긍정적인 단어
pal <- brewer.pal(8,"Dark2")
wordcloud(words = rownames(tab_postxt_j),
          freq = tab_postxt_j,
          min.freq = 1,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(5,1),
          colors = pal, family = "are")

## 부정적인 단어 
pal <- brewer.pal(8,"Dark2")
wordcloud(words = rownames(tab_negtxt_j),
          freq = tab_negtxt_j,
          min.freq = 1,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(6,2),
          colors = pal, family = "are")

# Barplot으로 비교 
library(ggplot2)
df3 = data.frame(x = head(sort(tab_postxt_j, decreasing = T),10), x2 = head(sort(tab_negtxt_j, decreasing = T),10))
df3

df3 %>% ggplot(aes(x=x.postxt_j, y=x.Freq)) +
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="감성 분석(일본어)")

df3 %>% ggplot(aes(x=x2.negtxt_j, y=x2.Freq)) +
  geom_bar(stat = "identity", fill = "pink", colour = "red") +
  scale_x_discrete(limits = rev(df3$x2.negtxt_j)) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="감성 분석(일본어)")

h <- as.data.frame(sort(head(sort(tab_postxt_j, decreasing = T),10)))
i <- as.data.frame(head(sort(tab_negtxt_j, decreasing = T),10))
h$color <- 1
i$color <- 2
colnames(i) <- colnames(h)
j <- rbind(h,i)

## 종합
windowsFonts(are=windowsFont("맑은 고딕"))
j %>% ggplot(aes(x=postxt_j, y=Freq)) +
  geom_bar(stat = "identity", aes(fill = ifelse(j$color==1,"긍정","부정")), colour = ifelse(j$color==1,"darkblue","red")) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="단어", y="빈도수", title="기업 선호도 분석(일본어)") +
  theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, size = 10)) +
  theme(axis.ticks.y = element_blank(),axis.text.y = element_blank()) +
  theme(plot.title = element_text(size=20, face="bold", margin = margin(10, 0, 10, 0), family="are"))  +
  scale_colour_manual(name='', values=c('skyblue', 'pink'), aesthetics = "fill") +
  theme(legend.title=element_blank()) +
  theme(plot.background=element_rect(fill="azure")) +
  theme(panel.background=element_rect(fill="white", colour = "black")) +
  geom_hline(yintercept = seq(5,25,5), color = "slategrey", lty=2)


tab_postxt_j

install.packages("standardize")
library(standardize)
log_postst_j <- log(tab_postxt_j)
??standardize

wordcloud(words = rownames(log_postst_j),
          freq = log_postst_j ,
          min.freq = 1,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(2,.1),
          colors = pal, family = "are")
library(wordcloud2)
install.packages("wordcloud2")
wordcloud2(log_postst_j)
