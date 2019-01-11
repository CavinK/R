# °úÁ¦(~8/22)



# Web Scrapping
# Á¤Á¦ ÀÛ¾÷
# Word Cloud 



# ¿ùº° °Ë»ö ÇöÈ²(±×·¡ÇÁ)
## BMW ºí·Î±× Title À¥ Å©·Ñ¸µ
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

## ¹Ýº¹¹® È°¿ëÇØ¼­ °¢ ÆäÀÌÁö¸¶´Ù Á¦¸ñÀÌ¶û Æ÷½ºÆÃ ³¯Â¥ ºÒ·¯¿À±â 
blog_bmw <- data.frame() 
for(x in seq(1,991,10)){ 
  blog_bmw <- rbind(blog_bmw, blog_bmw_data(x)) 
}
head(blog_bmw)

## ÀüÃ³¸®
blog_bmw <- blog_bmw[-grep("Àü", blog_bmw$day_data),] 
blog_bmw <- blog_bmw[-grep("¾îÁ¦", blog_bmw$day_data),] 
blog_bmw$day_data <- factor(blog_bmw$day_data) 
blog_bmw <- transform(blog_bmw, YYMM = substr(day_data,1,7))

## ¿ùº° BMW ºí·Î±× Æ÷½ºÆÃ ¼ö
data.frame(table(blog_bmw$YYMM))[1:5,] %>% ggplot(aes(x=Var1, y=Freq, group=1)) +  
  geom_line() + 
  geom_point(col="red") +  
  labs(x=NULL, y="Æ÷½ºÆÃ ¼ö", title="´ÙÀ½ ºí·Î±× BMW °ü·Ã ¿ùº° Æ÷½ºÆÃ µî·Ï ¼ö") + 
  theme_bw() + 
  theme(plot.title=element_text(face="bold", size=20))



####################################################################################################



# ±¹³» ¹ÝÀÀ ºÐ¼®(³×ÀÌ¹ö)
library(httr)

allreviewN = c()
urlN = 'https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query=bmw&sm=tab_pge&srchby=all&st=sim&where=post&start='

## ³×ÀÌ¹ö
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

## 1. ÇÊ¿äÇÑ(ÃßÃâÇØ¾ß ÇÒ) ÄÚµå È®ÀÎ
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

## 2. ÅØ½ºÆ® ÇüÅÂ·Î º¯¼ö ÀúÀå 
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



# ºí·Î±× ±Û °¡Á®¿À±â
## 1. ÇÊ¿äÇÑ(ÃßÃâÇØ¾ß ÇÒ) ÄÚµå È®ÀÎ
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

## 2. ÅØ½ºÆ® ÇüÅÂ·Î º¯¼ö ÀúÀå 
txt <- c()
for (i in 1:length(data)){
  url_bmw <- read_html(data[i])
  temp <- html_nodes(url_bmw, ".article") %>% 
    html_text()
  txt <- c(txt,temp)
}
length(txt)
head(txt)

# »çÀü ¾÷µ¥ÀÌÆ®
library(KoNLP)
useSejongDic()
buildDictionary(ext_dic="sejong", user_dic = data.frame(readLines("C://data/positive-words-ko-v2.txt"),"ncn"),replace_usr_dic = T)
buildDictionary(ext_dic="sejong", user_dic = data.frame(readLines("C://data/negative-words-ko-v2-2.txt"),"ncn"),replace_usr_dic = T)

# µ¥ÀÌÅÍ ·Îµå 
posi <- unlist(readLines("C://data/positive-words-ko-v2.txt"))
nega <- unlist(readLines("C://data/negative-words-ko-v2-2.txt"))
txt2 <- SimplePos09(txt)  

# µ¥ÀÌÅÍ Á¤Á¦
txt_replace <- str_replace_all(unlist(txt2), '/.*',"")
head(txt_replace,7)
length(txt_replace)

greptxt <- grep('[°¡-ÆR]',txt_replace, value=T)
iftxt <- as.vector(na.omit(ifelse(nchar(greptxt)<=2,NA,greptxt)))
iftxt <- as.vector(str_trim(iftxt))

iftxt <- str_replace_all(iftxt,"'$","")
iftxt <- str_replace_all(iftxt,'¡¯$',"")
iftxt <- str_replace_all(iftxt,"´Â$","")
iftxt <- str_replace_all(iftxt,'¸¦$',"")
iftxt <- str_replace_all(iftxt,'À»$',"")
iftxt <- str_replace_all(iftxt,'µé$',"")
iftxt <- str_replace_all(iftxt,'¿¡¼­$',"")
iftxt <- str_replace_all(iftxt,'º¸´Ù$',"")
iftxt <- str_replace_all(iftxt,'±îÁö$',"")
iftxt <- str_replace_all(iftxt,'À¸·Î$',"")
View(iftxt)

tabtxt <- table(iftxt)

# Sentimental Analysis
positxt <- iftxt[iftxt %in% intersect(iftxt, posi)]
tab_positxt <- table(positxt) ; tab_positxt
negatxt <- iftxt[iftxt %in% intersect(iftxt, nega)]
tab_negatxt <- table(negatxt) ; tab_negatxt

# ¿öµå Å¬¶ó¿ìµå
pal <- brewer.pal(8,"Dark2")
windowsFonts(are=windowsFont("¸¼Àº °íµñ")) 
wordcloud(words = rownames(tabtxt),
          freq = tabtxt,
          min.freq = 10,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(4,1),
          colors = pal, family = "are")

## ±àÁ¤ÀûÀÎ ´Ü¾î
pal <- brewer.pal(8,"Paired")
windowsFonts(are=windowsFont("¸¼Àº °íµñ")) 
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

## ºÎÁ¤ÀûÀÎ ´Ü¾î
pal <- brewer.pal(8,"Dark2")
windowsFonts(are=windowsFont("¸¼Àº °íµñ")) 
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

# BarplotÀ¸·Î ºñ±³ 
library(ggplot2)
df = data.frame(x = head(sort(tab_positxt, decreasing = T),10), x2 = head(sort(tab_negatxt, decreasing = T),10))
df

df %>% ggplot(aes(x=x.positxt, y=x.Freq)) +
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="°¨Á¤ ºÐ¼®(ÇÑ±¹¾î)")

df %>% ggplot(aes(x=x2.negatxt, y=x2.Freq)) +
  geom_bar(stat = "identity", fill = "pink", colour = "red") +
  scale_x_discrete(limits = rev(df$x2.negatxt)) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="°¨Á¤ ºÐ¼®(ÇÑ±¹¾î)")

a <- as.data.frame(sort(head(sort(tab_positxt, decreasing = T),10)))
b <- as.data.frame(head(sort(tab_negatxt, decreasing = T),10))
a$color <- 1
b$color <- 2
colnames(b) <- colnames(a)
c <- rbind(a,b)

## Á¾ÇÕ 
windowsFonts(are=windowsFont("¸¼Àº °íµñ"))
c %>% ggplot(aes(x=positxt, y=Freq)) +
  geom_bar(stat = "identity", aes(fill = ifelse(c$color==1,"±àÁ¤","ºÎÁ¤")), colour = ifelse(c$color==1,"darkblue","red")) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="±â¾÷ ¼±È£µµ ºÐ¼®(ÇÑ±¹¾î)") +
  theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, size = 10)) +
  theme(axis.ticks.y = element_blank(),axis.text.y = element_blank()) +
  theme(plot.title = element_text(size=20, face="bold", margin = margin(10, 0, 10, 0), family = "are")) +
  scale_colour_manual(name='', values=c('skyblue', 'pink'), aesthetics = "fill") +
  theme(legend.title=element_blank()) +
  theme(plot.background=element_rect(fill="azure")) +
  theme(panel.background=element_rect(fill="white", colour = "black")) +
  geom_hline(yintercept = seq(5,25,5), color = "slategrey")

####################################################################################################



# ÇØ¿Ü ¹ÝÀÀ ºÐ¼®(Æ®À§ÅÍ)
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

# BarplotÀ¸·Î ºñ±³ 
library(ggplot2)
df2 = data.frame(x = head(sort(tab_postxt, decreasing = T),10), x2 = head(sort(tab_negtxt, decreasing = T),10))
df2

df2 %>% ggplot(aes(x=x.postxt, y=x.Freq)) +
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="°¨Á¤ ºÐ¼®(¿µ¾î)")

df2 %>% ggplot(aes(x=x2.negtxt, y=x2.Freq)) +
  geom_bar(stat = "identity", fill = "pink", colour = "red") +
  scale_x_discrete(limits = rev(df2$x2.negtxt)) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="°¨Á¤ ºÐ¼®(¿µ¾î)")

e <- as.data.frame(sort(head(sort(tab_postxt, decreasing = T),10)))
f <- as.data.frame(head(sort(tab_negtxt, decreasing = T),10))
e$color <- 1
f$color <- 2
colnames(f) <- colnames(e)
g <- rbind(e,f)

## Á¾ÇÕ 
windowsFonts(are=windowsFont("¸¼Àº °íµñ"))
g %>% ggplot(aes(x=postxt, y=Freq)) +
  geom_bar(stat = "identity", aes(fill = ifelse(g$color==1,"±àÁ¤","ºÎÁ¤")), colour = ifelse(g$color==1,"darkblue","red")) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="±â¾÷ ¼±È£µµ ºÐ¼®(¿µ¾î)") +
  theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, size = 10)) +
  theme(axis.ticks.y = element_blank(),axis.text.y = element_blank()) +
  theme(plot.title = element_text(size=20, face="bold", margin = margin(10, 0, 10, 0), family = "are"))  +
  scale_colour_manual(name='', values=c('skyblue', 'pink'), aesthetics = "fill") +
  theme(legend.title=element_blank()) +
  theme(plot.background=element_rect(fill="azure")) +
  theme(panel.background=element_rect(fill="white", colour = "black")) +
  geom_hline(yintercept = seq(5,25,5), color = "slategrey")




####################################################################################################



# ÀÏº» ¹ÝÀÀ ºÐ¼®(¾ßÈÄÁ®ÆÒ)

# udpipe ÆÐÅ°Áö ÀÌ¿ë 
install.packages("udpipe")
library(udpipe)
model <- udpipe_download_model(language = "japanese")
model <- udpipe_load_model(file = model$file_model)
x <- udpipe_annotate(model, x = "ªäªÏªê«Æ«¯«Î«í«¸???ª¬òäûùª·ªÆªâ¡¢ìíÜâåÞªÎ«Ç???«¿ÝÂà°ªÏÜôÊ¦ÒöªÊªÎª«£¿ª½ª³ªÇøÉÞä «½«ê«å???«·«ç«ó«³«ó«µ«ë«Æ«£«ó«°ð¯ìéÜâÝ» ??????Ý»íþ òÐï£ ÍÔö½ªòÛ¾ªÍ¡¢«Æ«­«¹«È«Þ«¤«Ë«ó«°???«½«ê«å???«·«ç«óªÎù±é©àõªä???éÄàõªÊªÉªËªÄª¤ªÆü¥ªòÞÃªÃª¿¡£")
x <- as.data.frame(x)
x

## 1. ÇÊ¿äÇÑ(ÃßÃâÇØ¾ß ÇÒ) ÄÚµå È®ÀÎ
dataj <- c()
for (i in 1:100) {
  webpagej <- read_html(paste0("https://official.ameba.jp/search?q=BMW&type=blog&page=",i))
  dataj <- c(dataj, html_nodes(webpagej, "#talentSrch .resultSearchLi h3") %>% 
    html_nodes('a') %>% 
    html_attr('href'))
}
length(dataj)
head(dataj)

## 2. ÅØ½ºÆ® ÇüÅÂ·Î º¯¼ö ÀúÀå 
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

jtrim <- str_replace_all(jtrim,"[¡¡]","")
jtrim <- str_replace_all(jtrim,"[[:punct:]]","")
jtrim <- str_replace_all(jtrim,"[a-z]","")
jtrim <- str_replace_all(jtrim,"[A-Z]","")
jtrim <- str_replace_all(jtrim,"[£Á-£Ú]","")
jtrim <- str_replace_all(jtrim,"[£á-£ú]","")
jtrim <- str_replace_all(jtrim,"[[:digit:]]","")
jtrim <- str_replace_all(jtrim,"[[:digit:]]$","")
jtrim <- str_replace_all(jtrim,"^[[:digit:]]","")
jtrim <- str_replace_all(jtrim,"¦¬","")
jtrim <- grep("[[:alpha:]]",jtrim,value = T)

jtrim2 <-c()
for (i in jtrim){
  if (!i %in% c('«¢«¯«»«¹','«Ö«í«°','áôª±ö¢ªì','«ê«Ö«í«°','«³«á«ó«È','«Ä«¤???«È','ªÈª¤ª¦',
                'ª·ª¿ìÑìé???','ªÊªíª¦','«·«§«¢','ª³ªóªÊ','ª·ªÞªÃ','«Ë«å???«¹','«¢«««¦«ó«È',
                'ªÇª·ªç','ìÑìé???','ª´ª¶ª¤','ªÇª¹ªÍ','ª·ªÞªÃ','ªÈª³ªí','ªÈªÆªâ','ìÑìé???«Ä«¤???«È')){ 
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
## Á¾ÇÕ 
pal <- brewer.pal(8,"Dark2")
wordcloud(words = rownames(jtable),
          freq = jtable,
          min.freq = 1,
          max.words = 30,
          random.order = F,
          rot.per = .1,
          scale = c(30,1),
          colors = pal, family = "are")

## ±àÁ¤ÀûÀÎ ´Ü¾î
pal <- brewer.pal(8,"Dark2")
wordcloud(words = rownames(tab_postxt_j),
          freq = tab_postxt_j,
          min.freq = 1,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(5,1),
          colors = pal, family = "are")

## ºÎÁ¤ÀûÀÎ ´Ü¾î 
pal <- brewer.pal(8,"Dark2")
wordcloud(words = rownames(tab_negtxt_j),
          freq = tab_negtxt_j,
          min.freq = 1,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(6,2),
          colors = pal, family = "are")

# BarplotÀ¸·Î ºñ±³ 
library(ggplot2)
df3 = data.frame(x = head(sort(tab_postxt_j, decreasing = T),10), x2 = head(sort(tab_negtxt_j, decreasing = T),10))
df3

df3 %>% ggplot(aes(x=x.postxt_j, y=x.Freq)) +
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="°¨¼º ºÐ¼®(ÀÏº»¾î)")

df3 %>% ggplot(aes(x=x2.negtxt_j, y=x2.Freq)) +
  geom_bar(stat = "identity", fill = "pink", colour = "red") +
  scale_x_discrete(limits = rev(df3$x2.negtxt_j)) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="°¨¼º ºÐ¼®(ÀÏº»¾î)")

h <- as.data.frame(sort(head(sort(tab_postxt_j, decreasing = T),10)))
i <- as.data.frame(head(sort(tab_negtxt_j, decreasing = T),10))
h$color <- 1
i$color <- 2
colnames(i) <- colnames(h)
j <- rbind(h,i)

## Á¾ÇÕ
windowsFonts(are=windowsFont("¸¼Àº °íµñ"))
j %>% ggplot(aes(x=postxt_j, y=Freq)) +
  geom_bar(stat = "identity", aes(fill = ifelse(j$color==1,"±àÁ¤","ºÎÁ¤")), colour = ifelse(j$color==1,"darkblue","red")) +
  coord_cartesian(ylim=c(0,25)) +
  labs(x="´Ü¾î", y="ºóµµ¼ö", title="±â¾÷ ¼±È£µµ ºÐ¼®(ÀÏº»¾î)") +
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
