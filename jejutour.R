
# 사전 업데이트
library(KoLNP)
useSejongDic()
buildDictionary(ext_dic="sejong", user_dic = data.frame(readLines("C://data/제주도관광지2.txt"),"ncn"),replace_usr_dic = T)

# 데이터 로드 
jeju <- readLines("C://data/jeju.txt")
tour <- unlist(readLines("C://data/제주도관광지2.txt"))
jeju2 <- extractNoun(jeju)

# 데이터 정제
j_noun2 <- unlist(j_noun2)
j_noun2 <- str_split(j_noun2,' ')
j_noun2 <- str_split(j_noun2,'-')

## 유사 단어들을 단일화 
j_noun2<-gsub('성산 일출봉','성산일출봉',j_noun2)
j_noun2<-gsub('천지연 폭포','천지연폭포',j_noun2)
j_noun2<-gsub('대장금 촬영지','대장금촬영지',j_noun2)
j_noun2<-gsub('믿거나말거나 박물관','믿거나말거나박물관',j_noun2)
j_noun2<-gsub('협재해변','협재해수욕장',j_noun2)
j_noun2<-gsub('협재 해수욕장','협재해수욕장',j_noun2)
j_noun2<-gsub('중문 해수욕장','중문해수욕장',j_noun2) 
j_noun2<-gsub('월정리 해수욕장','월정리해수욕장',j_noun2)
j_noun2<-gsub('용머리 해안','용머리해안',j_noun2)
j_noun2<-gsub('중문단지','중문',j_noun2)
j_noun2<-gsub('중문랜드','중문',j_noun2)
j_noun2<-gsub('중문관광단지','중문',j_noun2)
j_noun2<-gsub('송악산전망대','송악산',j_noun2)
j_noun2<-gsub('오설록','오설록',j_noun2)
j_noun2<-gsub('오설록박물관','오설록',j_noun2)
j_noun2<-gsub('여미지','여미지식물원',j_noun2)
j_noun2<-gsub('1100고지','천백고지',j_noun2)
j_noun2<-gsub('1100도로','천백도로',j_noun2)
j_noun2<-gsub('도깨비','도깨비도로',j_noun2)
j_noun2<-gsub('애월해안도로','애월',j_noun2)
j_noun2<-gsub('천제연 폭포','천제연폭포',j_noun2)
j_noun2<-gsub('삼나무길','비자림',j_noun2)
j_noun2<-gsub('올레코스','올레길',j_noun2)
j_noun2<-gsub('올레길','올레길',j_noun2)

j_noun2<-gsub('[[:punct:]]',' ', j_noun2)
j_noun2<-gsub('→',' ',j_noun2)
j_noun2<-gsub('[[:digit:]]',' ',j_noun2)
j_noun2<-gsub('천백고지','1100고지',j_noun2)
j_noun2<-gsub('천백도로','1100도로',j_noun2)
j_noun2<-gsub('중문','중문단지',j_noun2)



data1 <- readLines("c:/data/jeju.txt") ; data1 ## 여기서 값 찾아서(정방폭포=4개) -> 정방폭포로 바꾸는 작업 후에 문자열 추출해야함
table(unlist(str_extract_all(data1,'[[:alpha:]]{0,}[" "]{0,}폭포[[:alpha:]]{0,}')))
unlist(str_extract_all(data1,'정방[" "]{0,}폭포[[:alpha:]]{0,}'))

# 1번 경우: gsub 사용
a <- unlist(str_extract_all(data1,'정방[" "]{0,}폭포[[:alpha:]]{0,}'))
data1 <- gsub(a,'정방폭포',data1)
unlist(str_extract_all(data1,'정방[" "]{0,}폭포[[:alpha:]]{0,}'))

# 2번 경우: str_replace_all 사용
a <- unlist(str_extract_all(data1,'정방[" "]{0,}폭포[[:alpha:]]{0,}'))
data1 <- str_replace_all(data1, a, '정방폭포')
unlist(str_extract_all(data1,'정방[" "]{0,}폭포[[:alpha:]]{0,}'))



## 중복 단어들 정리 
for (i in 1:length(j_noun2)){
  j_noun2[[i]] <- unique(j_noun2[[i]])
}
j_noun2 <- unlist(j_noun2)

# 제주도 여행지 이름 추출 및 빈도 수 파악
j_noun3 <- j_noun2[j_noun2 %in% intersect(j_noun2, tour)]
j_noun_t <- table(j_noun3) ; j_noun_t
head(sort(j_noun_t, decreasing = T),10) 

# 지명 앞뒤로 어떤 단어, 표현이 들어가 있는 지 확인 
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}우도[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}송악산[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}용머리해안[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}주상절리[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}산방산[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}섭지코지[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}에코랜드[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}용두암[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}성산일출봉[[:alpha:]]{0,}"))
unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}산굼부리[[:alpha:]]{0,}"))

# 워드 클라우드
pal <- brewer.pal(8,"Dark2")
windowsFonts(are=windowsFont("맑은 고딕")) 
wordcloud(words = rownames(j_noun_t),
          freq = j_noun_t,
          min.freq = 3,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(4,1),
          colors = pal, family = "are")

head(sort(j_noun_t, decreasing = T),5)

# Google Map
j_td <- sort(j_noun_t, decreasing = T)
j_name <- str_trim(names(j_td))
matrix(j_td)
names[8] <- "제주도 용두암"

names <- head(str_trim(j_name), 10)
gc <- geocode(enc2utf8(names)) ; gc
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat, pref = head(matrix(j_td),10)) ; df
df2 <- head(df,5)
df3 <- rbind(df[8,],df2[5,],df2[3,],df2[2,],df2[4,],df2[1,], df[8,]) ; str(df3)
cen <- c(mean(df$lon)-.038, mean(df$lat)) ; cen

map <- get_googlemap(center = cen, zoom = 10, maptype = "roadmap", markers = gc)
ggmap(map) + labs(title = "제주도 여행지 선호도 분석")

map <- get_googlemap(center = cen, zoom = 10, maptype = "roadmap")
ggmap(map) + geom_point(data = df, aes(x=df$lon, y=df$lat, fill=names), 
                        size=df$pref/sum(df$pref)*100, 
                        alpha = 1, color="gold", pch=21) +
  scale_fill_manual(values = setNames(brewer.pal(10, "Set3"), levels(names))) +
  guides(fill = guide_legend(ncol = 1)) +
  geom_path(data=troute,aes(x=troute$LON, y=troute$LAT),size=1,linetype=2,col="blue") + ### geom_path 함수를 써서 경로를 선으로 연결해서 표시합니다.
  geom_text(data=df2, aes(x=df2$lon, y=df2$lat, label=df2$name),size=3)

troute <- read.csv("C://data/제주도여행코스.csv")
str(troute) ; troute

ggsave("c:/data/jeju.png",dpi=300)

# 결론1
## 인기 여행지는 바다에 인접한 지역에 주로 분포 -> 여행객들은 산보다 바다를 더 선호
## 기존의 인기 지역이던 서부(애월읍)보다, 우도(동부)나 남부 지역이 더 선호되는 것으로 파악 -> 한적하고 섬 본연의 모습을 선호하는 것이 최근 트렌드  
## 상위 여행 지역들의 다수가 드라마 촬영지 -> 제주도 관광 홍보 효과는 대부분 드라마에 의존

# 결론2
## 추천 여행 루트 
## 1일차: 제주공항 -> 산방산 -> 용머리 해안
## 2일차: 송악산 -> 주상절리
## 3일차: 우도 투어
## 4일차: 제주시 및 용두암 관광

# 보완점1
## 해당 단어의 앞뒤에 어떤 글자가 오는 지 파악해서, 그 단어가 가지는 의미가 긍정적인지, 부정적인지 파악!
## 좋은 의미의 데이터만 분석하지 말고, 나쁜 의미를 가진 데이터도 따로 분석해놓을 것! 
jeju3 <- SimplePos09(jeju)
j_word <- str_replace_all(unlist(jeju3),'/.*','')

nega <- unlist(readLines("C://data/negative.txt"))
j_noun4 <- j_word[j_word %in% intersect(j_word, nega)]
j_noun_t2 <- table(j_noun4) ; j_noun_t2
head(sort(j_noun_t, decreasing = T),10) 

unlist(str_extract_all(jeju,"[[:alpha:]]{0,}[' ']{0,}싫[[:alpha:]]{0,}"))
grep("싫",jeju)
grep("나쁘",jeju)
grep("실망",jeju)
jeju[459]
jeju[720:750]

# 보완점2
## "예쁜 펜션" 하면 어느 지역과 몇 퍼센트 정도 연관이 있는 지까지 파악해볼 것! 
jeju[grep("펜션",jeju)]





## Another solution
library(KoNLP)
library(wordcloud)
library(wordcloud2)
library(RColorBrewer)

data<-readLines('c:/data/jeju.txt')
data
useSejongDic()
buildDictionary(ext_dic="sejong",user_dic=data.frame(readLines("c:/data/제주도관광지.txt"), "ncn"), replace_usr_dic = T)

# buildDictionary(ext_dic="sejong",
#                 user_dic=data.frame(c("월정리해수욕장","용머리해안","러브랜드","성산일출봉","세계자동차박물관"),c
#                                     ("ncn")),replace_usr_dic=T)

word<-gsub('성산 일출봉','성산일출봉',data)
word<-gsub('천지연 폭포','천지연폭포',word)
word<-gsub('대장금 촬영지','대장금촬영지',word)
word<-gsub('믿거나말거나 박물관','믿거나말거나박물관',word)
word<-gsub('협재해변','협재해수욕장',word)
word<-gsub('협재 해수욕장','협재해수욕장',word)
word<-gsub('중문 해수욕장','중문해수욕장',word) 
word<-gsub('월정리 해수욕장','월정리해수욕장',word)
word<-gsub('용머리 해안','용머리해안',word)
word<-gsub('중문단지','중문',word)
word<-gsub('중문랜드','중문',word)
word<-gsub('중문관광단지','중문',word)
word<-gsub('송악산전망대','송악산',word)
word<-gsub('오설록','오설록',word)
word<-gsub('오설록박물관','오설록',word)
word<-gsub('여미지','여미지식물원',word)
word<-gsub('1100고지','천백고지',word)
word<-gsub('1100도로','천백도로',word)
word<-gsub('도깨비','도깨비도로',word)
word<-gsub('애월해안도로','애월',word)

word<-gsub('[[:punct:]]',' ', word)
word<-gsub('→',' ',word)
word<-gsub('[[:digit:]]',' ',word)
word<-gsub('천백고지','1100고지',word)
word<-gsub('천백도로','1100도로',word)
word<-gsub('중문','중문단지',word)
word1<-extractNoun(word)  

for (i in 1:length(word1)){
  word1[[i]] <- unique(word1[[i]])
}

word1
word1<-unlist(word1)
word1<-gsub('.ㅎ','',word1)
word1<-gsub('.ㅇ','',word1)
word1
word1<-Filter(function(x){nchar(x)>=2}, word1)
word2<-c()
for (i in word1){
  if (!i %in% c('점심','할인','다양','산책','중간','첫날','체험','항공','근처','하게','제주')){ ### 불용어(필요 없는 단어들) 제외 작업 <- gsub 대신 for문 쓰면 보다 편하게 작업 수행 
    word2<-c(word2,i)
  }
}
word2

tab_word<-table(word2)
tab_word
res<-head(sort(tab_word,decreasing = T),100)
res
wordcloud(names(res),res,
          colors=brewer.pal(8,'Dark2') ,
          scale=c(3,0.5),
          random.order=F,random.color=F)

wordcloud2(res,rainbow(180),size=0.4,shape='circle')
