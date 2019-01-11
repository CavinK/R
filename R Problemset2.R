# [¹®Á¦165] itwill ÀÚµ¿Â÷ ¼ö¸®Á¡ ºÎÇ° ºñ¿ë ÀÚ·á ÀÔ´Ï´Ù. ºÐ¼®ÇÏ¼¼¿ä.
## Fake data
auto <- scan()
91 78 93 57 75 52 99 80 97 62
71 69 72 89 66 75 79 75 72 76
104 74 62 68 97 105 77 65 80 109
85 97 88 68 83 68 71 69 67 74
62 82 98 101 79 105 79 69 62 73
auto
## My code
factora <- factor(cut(auto, breaks=nclass.Sturges(auto))) ; factora ### cut()ÀÇ Ã¹¹øÂ° ÀÎÀÚ´Â numeric Å¸ÀÔÀ¸·Î! 
## Tabulate and turn into data.frame
aout <- as.data.frame(table(factora)) 
## Add cumFreq and proportions
acout <- transform(aout, cumFreq = cumsum(Freq), relative = prop.table(Freq)) ; acout

hist(auto, breaks = seq(50,110,10), right = FALSE, col = rainbow(7), xlab = "Price of Auto Parts", ylim = c(0,20))

## Density 
hist(auto, breaks = seq(50,110,10), right = FALSE, col = rainbow(7), xlab = "Price of Auto Parts", ylim = c(0,0.04), probability = T)
lines(density(auto), col="blue")

stem(auto)

## °á·Ð1: ÇöÀç ¼ö¸®Á¡ ºÎÇ° ºñ¿ëÀº 60~80¸¸¿ø ´ë¿¡ ¸¹ÀÌ ºÐÆ÷ÇØ ÀÖ´Ù. 
## °á·Ð2: °í°¡¿Í Àú°¡ÀÇ Á¦Ç°±ºÀ» ±âÁ¸º¸´Ù ¸¹ÀÌ ±¸ºñÇÔÀ¸·Î¼­ º¸´Ù ´Ù¾çÇÑ °í°´ÃþÀ» È®º¸ÇÏ·Á´Â ³ë·ÂÀÌ ÇÊ¿äÇÏ´Ù. 

?barplot

title(xlab="Price of Auto Parts", mgp=c(2,0,0), family="Calibri Light", cex.lab=1.2) ### xlabÀÇ À§Ä¡ ÁöÁ¤! 

## Æ¯Á¤ ±¸°£¸¸ ºÐ¼®ÇÏ´Â ¹æ¹ý
### 50ºÎÅÍ 80±îÁö¸¸ »Ì¾Æ³»¼­ µµ¼öºÐÆ÷Ç¥ ÀÛ¼º
cost_cut <- cut(auto, breaks = seq(50,80,by=10), right=FALSE, labels = c("50~60","60~70","70~80"))
table(cost_cut)

# [¹®Á¦166] ÇÐ»ýµéÀÇ ¸ö¹«°Ô ÀÚ·á¸¦ ÀÌ¿ëÇØ¼­ µµ¼öºÐÆ÷Ç¥,±×·¡ÇÁ¸¦ »ý¼ºÇÏ¼¼¿ä.
weight <- read.table("c:/data/weight.txt") ### ¸¶Áö¸· ÁÙÀ» ºó °É·Î ¸¸µé¾î¾ß ¿À·ù ¾È ³²! 

## Fake data
w <- as.matrix(weight) 
matrix(w)
## Your code
factorw <- factor(cut(w, breaks=nclass.Sturges(w)))
## Tabulate and turn into data.frame
wout <- as.data.frame(table(factorw)) ; wout
## Add cumFreq and proportions
wcout <- transform(wout, cumFreq = cumsum(Freq), relative = prop.table(Freq)) ; wcout

hist(w, breaks = seq(50,100,10), right = FALSE, col = rainbow(7), xlab = "Weight", ylim = c(0,30))

## Density 
hist(w, breaks = seq(50,100,10), right = FALSE, col = rainbow(7), xlab = "Weight", ylim = c(0,0.05), probability = T)
lines(density(w, adjust = 1), col="blue")

stem(w)

# [¹®Á¦167] 2016³â_¼­¿ï_ÁÖ¿ä±¸º°_º´¿øÇöÈ².csv fileÀ» ÀÐ¾î µéÀÎÈÄ ±¸º°·Î Áø·á°ú¸ñº° º´¿øÇöÈ²À» ±×·ì¸·´ëÇü ±×·¡ÇÁ·Î ¸¸µå¼¼¿ä.
hospital <- read.csv("C://data/2016³â_¼­¿ï_ÁÖ¿ä±¸º°_º´¿øÇöÈ².csv")
View(hospital)

graphics.off()
par(mfrow = c(1,1))

hos <- hospital[,2:11]
hos2 <- as.matrix(hos)
hospital[,1]
barplot(hos2, main="±¸º° Áø·á°ú¸ñº° º´¿øÇöÈ²",
        xlab="¼­¿ï Áö¿ª(±¸)", col=c(rainbow(9)),
        legend = hospital[,1], ylim=c(0,350), beside = TRUE, cex.names = .7)
### cex.axis vs. cex.names vs. cex.main

# [¹®Á¦168] °­³²±¸ °ú¸ñº° º´¿ø¼ö¸¸ ¸·´ëÇü ±×·¡ÇÁ¸¦ »ý¼ºÇÏ¼¼¿ä.(´Ü 10°³ 1°³·Î Ç¥ÇöÇÏ¼¼¿ä.)
hospital[,c("°­³²±¸")]
hosp <- hospital[,2]
hospt <- t(hosp) ; hospt
colnames(hospt) <- c("³»°ú", "¿Ü°ú", "Á¤Çü¿Ü°ú", "¼ºÇü¿Ü°ú", "»êºÎÀÎ°ú", "¼Ò¾ÆÃ»¼Ò³â°ú", "¾È°ú", "ÀÌºñÀÎÈÄ°ú", "ÇÇºÎ°ú")
hospt
bp <- barplot(round(hospt/10), main="°­³²±¸ Áø·á°ú¸ñº° º´¿øÇöÈ²",
        xlab="Áø·á°ú¸ñ", col=c(rainbow(9)),
        legend = hospital[,1], ylim=c(0,35), beside = TRUE, cex.names = .7, ylab = "º´¿ø ¼ö(10°³)")
text(x=bp,y=round(hospt/10)+.5,labels=round(hospt/10),pos=3)

# [¹®Á¦169] 2016³â_¼­¿ï_ÁÖ¿ä±¸º°_º´¿øÇöÈ².csv fileÀ» ÀÐ¾î µéÀÎÈÄ ±¸º° Áø·á°ú¸ñ¿¡ ÇØ´çÇÏ´Â º´¿ø¼ö¸¦ ¸·´ëÇü ±×·¡ÇÁ·Î ¸¸µå¼¼¿ä. 
# ´Ü ¸·´ë³ôÀÌ´Â 10°³´ç 1°³·Î ¸¸µå½Ã°í ¸·´ë±×·¡ÇÁ ÇÁ·Î±×·¥Àº ÇÑ°³¸¦ °¡Áö°í ¸ðµç ±¸º° ¸·´ë±×·¡ÇÁ°¡ »ý¼ºµÇµµ·Ï ¸¸µå¼¼¿ä.
## programming!!! 
graphics.off()
par(mfrow = c(2,5))

medical <- function(x) {
  hosp <- hospital[,as.character(x)]
  hospt <- t(hosp) ; hospt
  colnames(hospt) <- c("³»°ú", "¿Ü°ú", "Á¤Çü¿Ü°ú", "¼ºÇü¿Ü°ú", "»êºÎÀÎ°ú", "¼Ò¾ÆÃ»¼Ò³â°ú", "¾È°ú", "ÀÌºñÀÎÈÄ°ú", "ÇÇºÎ°ú")
  hospt
  if (as.character(x)=="°­³²±¸"){
  bp <- barplot(round(hospt/10), main=paste(x,"º´¿øÇöÈ²"),
              xlab="", col=c(rainbow(9)),
              ylim=c(0,35), beside = TRUE, cex.names = .8, ylab = "º´¿ø ¼ö(10°³)", cex.main = 1, las = 2)
  abline(h=seq(5,35,5),col='blue',lty=2)
  } else {
    bp <- barplot(round(hospt/10), main=paste(x,"º´¿øÇöÈ²"),
                  xlab="", col=c(rainbow(9)),
                  ylim=c(0,10), beside = TRUE, cex.names = .8, ylab = "º´¿ø ¼ö(10°³)", cex.main = 1, las = 2)
    abline(h=seq(2,10,2),col='blue',lty=2)
  }
}

col <- colnames(hospital[,2:11])
for (i in 1:length(col)){
  name <- col[i]
  medical(name)
}

## Another solution
data1 <- read.csv("c:/data/2016³â_¼­¿ï_ÁÖ¿ä±¸º°_º´¿øÇöÈ².csv" , header=T)
gu <- colnames(data1[2:11])
par(mfrow=c(2,5))
for(i in 1:10){
  barplot(data1[1:9,i+1] * 0.1 ,
          main=paste(gu[i],"º´¿øÇöÈ²"),
          axes=F,
          ylab="º´¿ø¼ö(´ÜÀ§:10°³)",
          xlab="", 
          cex.names=0.85,
          las=2,
          ylim=c(0,40), 
          col=rainbow(8), 
          border="white",
          names.arg=data1$Ç¥½Ã°ú¸ñ)
  
  axis(2,ylim=seq(0,40,10))
  abline(h=seq(0,40,5),lty=2)
}



# º»ÀÎ Áö¿ªÀÇ ÀÇ¿ø ÇöÈ² Á¶»ç
hospital <- read.csv("c:/data/2016³â_¿ëÀÎ_ÁÖ¿ä±¸º°_º´¿øÇöÈ².csv" , header=T, stringsAsFactors = F)
View(hospital)
hos <- hospital[c(-2),c(-1:-3)] ; hos

df <- data.frame(hos[2,]) 
df <- as.numeric(df) ; df
df2 <- t(as.matrix(df)) ; df2

colnames(df2) <- as.vector(hos[1,]) ; df2
sort(df2)

barplot(round(df2/10), main="°æ±âµµ ¿ëÀÎ½Ã ¼öÁö±¸ Áø·á°ú¸ñº° º´¿øÇöÈ²",
              xlab="", col=c(rainbow(ncol(df2))),
              ylim=c(0,4), beside = TRUE, cex.names = .7, ylab = "º´¿ø ¼ö(10°³)", las=2)
pie(df2, labels = colnames(df2), main = "Áø·á°ú¸ñº° º´¿øÇöÈ²", 
    col = rainbow(ncol(df2)), cex = .5, radius = 1, init.angle = 45, las = 2)

# ´Ù¸¥ ±¸¿ªµµ Æ÷ÇÔ 
hospital2 <- read.csv("c:/data/2016³â_¿ëÀÎ_ÁÖ¿ä±¸º°_º´¿øÇöÈ²2.csv" , header=T, stringsAsFactors = F)
View(hospital2)
df <- hospital2[c(2:5),] ; df
colnames(df) <- hospital2[1,]
df <- df[-1,c(-1,-2,-3)]
rownames(df) <- hospital2[c(-1,-2),2]
View(df)
str(df)

df2 <- as.matrix(df) ; df2
mode(df2) <- "numeric" ; df2 ### matrix Å¸ÀÔ º¯È¯! 

barplot(df2, main="°æ±âµµ ¿ëÀÎ½Ã Áø·á°ú¸ñº° º´¿øÇöÈ²",
        xlab="", col=c("skyblue","darkblue","violet"),
        ylim=c(0,40), beside = TRUE, cex.names = .7, ylab = "º´¿ø ¼ö", las=2,
        legend = rownames(df))



?read.csv
## skip: csv ÆÄÀÏÀÇ ¸î ¹øÂ° ÁÙÀº skipÇÏ´Â ±â´É
hospital3 <- read.csv("c:/data/½Ã±º±¸º°_Ç¥½Ã°ú¸ñº°_ÀÇ¿øÇöÈ²_20180813100616.csv" , 
                     header=T, stringsAsFactors = F, skip = 1)
View(hospital3)
str(hospital3)
head(hospital3)
data1 <- hospital3[-1,] ; head(data1)
datat <- t(data1)
str(datat)

## ÆÄÀÏÀ» OS¿¡ º°µµ ÀúÀå(csvÆÄÀÏ·Î ÀúÀå)
write.csv(datat, "C://data/¼­¿ï½Ã_Ç¥½Ã°ú¸ñº°_ÀÇ¿øÇöÈ².csv", quote = F) ### quote = F <- csv ÆÄÀÏ¿¡ "" Á¦¿Ü! 

data2 <- read.csv("C://data/¼­¿ï½Ã_Ç¥½Ã°ú¸ñº°_ÀÇ¿øÇöÈ².csv", header = T, skip = 2, stringsAsFactors = F)
View(data2)
barplot(data2[,3],beside=T)

# [¹®Á¦170] ¸ð ±â¾÷ÀÇ ¿µ¾÷ÆÀÀº "AÆÀ", "BÆÀ", "CÆÀ", "DÆÀ", "EÆÀ" µîÀÌ ÀÖ½À´Ï´Ù. 
# ¿µ¾÷ÆÀº° ¿µ¾÷ ¸ÅÃâ¾×Àº 90, 45, 70, 67, 85 µîÀ¸·Î µÇ¾î ÀÖ½À´Ï´Ù. 
# ÀÌ ÀÚ·á¸¦ ÀÌ¿ëÇØ¼­ barplot, pie, pie3D ±×·¡ÇÁ¸¦ »ý¼ºÇÏ¼¼¿ä. 
graphics.off()
par(mfrow = c(3,1))

team <- c("AÆÀ", "BÆÀ", "CÆÀ", "DÆÀ", "EÆÀ")
money <- c(90, 45, 70, 67, 85)

## 1. Make graphs
barplot(money, main="¿µ¾÷ÆÀº° ¿µ¾÷ ¸ÅÃâ¾×",
        xlab="", col=c("skyblue","darkblue","violet", "orange", "blue"),
        ylim=c(0,120), beside = TRUE, cex.names = .7, ylab = "º´¿ø ¼ö", las=2,
        legend = team)
pie(money, labels = paste0(team,'\n',money,"¾ï¿ø"), main="¿µ¾÷ÆÀº° ¿µ¾÷ ¸ÅÃâ¾×", 
    col = c("skyblue","darkblue","violet", "orange", "blue"), clockwise = F, init.angle = 90)
pie3D(money,labels=paste0(team,'\n',money,"¾ï¿ø"),explode=0.1,main="¿µ¾÷ÆÀº° ¿µ¾÷ ¸ÅÃâ¾×", 
      col = c("skyblue","darkblue","violet", "orange", "blue"), labelcex = 0.7)

## 2. Save files
library(jpeg)

jpeg('C://data/ex170_1.jpeg', width = 400, height = 300, pointsize = 12) ### ÀÌ°Å ½ÇÇàÇÏ°í À§ÀÇ plot ½ÇÇàÇÏ¸é ÆÄÀÏ ÀúÀåµÊ! 
dev.off() ### save Á¾·á 
jpeg('C://data/ex170_2.jpeg', width = 400, height = 300, pointsize = 12) 
pie(money, labels = paste0(team,'\n',money,"¾ï¿ø"), main="¿µ¾÷ÆÀº° ¿µ¾÷ ¸ÅÃâ¾×", 
    col = c("skyblue","darkblue","violet", "orange", "blue"), clockwise = F, init.angle = 90)
dev.off()
jpeg('C://data/ex170_3.jpeg', width = 400, height = 300, pointsize = 12) 
pie3D(money,labels=paste0(team,'\n',money,"¾ï¿ø"),explode=0.1,main="¿µ¾÷ÆÀº° ¿µ¾÷ ¸ÅÃâ¾×", 
      col = c("skyblue","darkblue","violet", "orange", "blue"), labelcex = 0.7)
dev.off()

## 3. Load and animate files 
for (i in 1:3){
  img <- paste("c://data/ex170_",i,".jpeg",sep = "")
  img <- readJPEG(img)
  
  plot.new()
  rect(0,0,1,1,col="white",border = "white") ### ±×·¡ÇÈ ÇÁ·¹ÀÓ ¿µ¿ª ÁöÁ¤ 
  rasterImage(img,0,0,1,1) ### È­¸é¿¡ ÀÌ¹ÌÁö Ãâ·ÂÇÏ´Â ÇÔ¼ö 
  ani.pause() ### Àá±ñ ´ë±âÇÑ ÈÄ È­¸é Áö¿ì°í ´Ù½Ã Ãâ·Â <- ´ë±â ½Ã°£ Á÷Á¢ ÀÔ·ÂÇÒ ¼ö ÀÖÀ½ 
}

for (i in 1:3){
  img <- paste("c://data/ex170_",i,".jpeg",sep = "")
  img <- readJPEG(img)
  
  plot.new()
  rect(0,0,1,1,col="white",border = "white")
  rasterImage(img,0,0,1,1) 
  ani.pause(10) ### ´ë±â ½Ã°£ Á÷Á¢ ÀÔ·ÂÇÒ ¼ö ÀÖÀ½ 
}

## rasterImage(): È­¸é¿¡ ÀÌ¹ÌÁö Ãâ·ÂÇÏ´Â ÇÔ¼ö 
## rasterImage(image, xleft, ybottom, xright, ytop)
### image: Ãâ·ÂÇÒ ÀÌ¹ÌÁö ÆÄÀÏ ÀÌ¸§ 
### xleft: ÀÌ¹ÌÁö Ãâ·Â À§Ä¡(xÃà ¿ÞÂÊ)
### ybottom: ÀÌ¹ÌÁö Ãâ·Â À§Ä¡(yÃà ÇÏ´Ü)
### xright: ÀÌ¹ÌÁö Ãâ·Â À§Ä¡(xÃà ¿À¸¥ÂÊ)
### ytop: ÀÌ¹ÌÁö Ãâ·Â À§Ä¡(yÃà »ó´Ü)

# [¹®Á¦171] ¹®Á¦169¹øÀ» ¼öÇàÇÏ¸é¼­ ±¸ÀÌ¸§.jpgÇü½ÄÀ¸·Î ÆÄÀÏÀÌ »ý¼ºÇÏµµ·Ï ÇÑÈÄ
# ±¸ÀÌ¸§.jpg¸¦ ÀÌ¿ëÇØ¼­ ¾Ö´Ï¸ÞÀÌ¼ÇÀ» ¼öÇàÇÏ¼¼¿ä.
for (i in 1:length(col)){
  name <- col[i]
  jpeg(paste0('c://data/',name,'.jpeg'), width = 400, height = 300, pointsize = 12) 
  medical(name)
  dev.off()
}

for (i in 1:length(col)){
  name <- col[i]
  img <- paste0("c://data/",name,".jpeg")
  img <- readJPEG(img)
  
  plot.new()
  rect(0,0,1,1,col="white",border = "white")
  rasterImage(img,0,0,1,1) 
  ani.pause()
}

col <- as.factor(col)
levels(col)[1]
mode(col)
Sys.getlocale()
Sys.setlocale()

## Another Solution
library(jpeg)

data1 <- read.csv("c:/data/2016³â_¼­¿ï_ÁÖ¿ä±¸º°_º´¿øÇöÈ².csv" , header=T)
gu <- colnames(data1[2:11])

for(i in 1:10){
  jpeg(paste('c:/data/',gu[i],'.jpg',sep=""),width=400,height=300,pointsize=12)
  barplot(data1[1:9,i+1] * 0.1 ,
          main=paste(gu[i],"º´¿øÇöÈ²"),
          axes=F,
          ylab="º´¿ø¼ö(´ÜÀ§:10°³)",
          xlab="", 
          cex.names=0.85,
          las=2,
          ylim=c(0,40), 
          col=rainbow(length(data1$Ç¥½Ã°ú¸ñ)), 
          border="white",
          names.arg=data1$Ç¥½Ã°ú¸ñ)
  
  axis(2,ylim=seq(0,40,10))
  abline(h=seq(0,40,5),lty=2)
  dev.off()
}

library(animation)

for (i in gu) {
  img <- paste("c:/data/",i,".jpg",sep="")
  img <- readJPEG(img)
  plot.new()
  rasterImage(img,0,0,1,1)
  ani.pause()
}

# [¹®Á¦172] R¿¡¼­ ¿À¶óÅ¬ Á¢¼ÓÇÑ ÈÄ ºÎ¼­º° ÀÎ¿ø¼ö¿¡ ´ëÇÑ ¸·´ë±×·¡ÇÁ ±×¸®¼¼¿ä.
jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="C:/data/ojdbc6.jar")
conn <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@localhost:1521/xe", "hr",  "hr")  ### SID: instance name

emp <- dbGetQuery(conn, "select * from employees")

dept <- dbGetQuery(conn, "select * from departments")

class(emp)
View(emp)

empdept <- merge(emp,dept,by="DEPARTMENT_ID", all.x = T)

ta <- tapply(emp$EMPLOYEE_ID, emp$DEPARTMENT_ID, length)
rownames(ta)
barplot(ta, main="ºÎ¼­º° ÀÎ¿ø¼ö",
        xlab="ºÎ¼­", col=c(rainbow(length(ta))),
        ylim=c(0,50), cex.names = .7, ylab = "ÀÎ¿ø ¼ö", las=2,
        legend = rownames(ta))

ta2 <- tapply(empdept$EMPLOYEE_ID, empdept$DEPARTMENT_NAME, length)
rownames(ta2)
barplot(ta2, main="ºÎ¼­º° ÀÎ¿ø¼ö",
        xlab="ºÎ¼­", col=c(rainbow(length(ta2))),
        ylim=c(0,50), cex.names = .7, ylab = "ÀÎ¿ø ¼ö", las=2)

## ºÎ¼­°¡ ¾ø´Â »ç¿øµéµµ Æ÷ÇÔ(aggregate, ifelse)
dept_cn <- aggregate(EMPLOYEE_ID ~ ifelse(is.na(DEPARTMENT_ID),"ºÎ¼­¾øÀ½",DEPARTMENT_ID), emp, length)
names(dept_cn) <- c('dept_id','cn') ; dept_cn
bp2 <- barplot(dept_cn$cn, names.arg = dept_cn$dept_id, main = "ºÎ¼­º° ÀÎ¿ø¼ö",
               xlab = "ºÎ¼­", col = rainbow(length(dept_cn$dept_id)),
               cex.name = .7, axes = F, ylim = c(0,60))
label <- paste(dept_cn$cn,'¸í',sep="")
text(x = bp2, y = dept_cn$cn, labels = label, cex = .9, pos = 3)

## Á¤·Ä
dcn <- dept_cn %>% arrange(cn, decreasing = T) ; dcn
bp2 <- barplot(dcn$cn, names.arg = dcn$dept_id, main = "ºÎ¼­º° ÀÎ¿ø¼ö",
               xlab = "ºÎ¼­", col = rainbow(length(dcn$dept_id)),
               cex.name = .7, axes = F, ylim = c(0,60))
label <- paste(dcn$cn,'¸í',sep="")
text(x = bp2, y = dcn$cn, labels = label, cex = .9, pos = 3)

# [¹®Á¦173] ¾Æ·¡¿Í °°Àº °á°ú¸¦ Ãâ·ÂÇÏµµ·Ï SQL¹®À» ÀÛ¼ºÇÏ¼¼¿ä.
'''
Job                     Dept 10    Dept 20    Dept 30    Dept 40    Dept 50    Dept 60    Dept 70    Dept 80    Dept 90   Dept 100
-------------------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------
  AC_MGR
AC_ACCOUNT
IT_PROG                                                                          28800
ST_MAN                                                                36400
AD_ASST                       0
PU_MAN                                          11000
SH_CLERK                                                              64300
AD_VP                                                                                                     35700
FI_ACCOUNT                                                                                                           39600
MK_MAN                               13000
PR_REP                                                                                      10000
FI_MGR                                                                                                               12008
PU_CLERK                                        13900
SA_MAN                                                                                                 61000
MK_REP                                6000
AD_PRES                                                                                                   26400
SA_REP                                                                                                243500
HR_REP                                                      6500
ST_CLERK                                                              55700
'''
table(list(emp$JOB_ID, emp$DEPARTMENT_ID))
rou <- round(xtabs(SALARY~JOB_ID+DEPARTMENT_ID,emp))
colnames(rou) <- paste("Dept",colnames(rou)) ; rou

## tapply? 

sqldf("
select JOB_ID as 'Job',
      sum(case when DEPARTMENT_ID =10 then round(total) else 0 end) 'Dept 10',
      sum(case when DEPARTMENT_ID =20 then round(total) else 0 end) 'Dept 20',
      sum(case when DEPARTMENT_ID =30 then round(total) else 0 end) 'Dept 30',
      sum(case when DEPARTMENT_ID =40 then round(total) else 0 end) 'Dept 40',
      sum(case when DEPARTMENT_ID =50 then round(total) else 0 end) 'Dept 50',
      sum(case when DEPARTMENT_ID =60 then round(total) else 0 end) 'Dept 60',
      sum(case when DEPARTMENT_ID =70 then round(total) else 0 end) 'Dept 70',
      sum(case when DEPARTMENT_ID =80 then round(total) else 0 end) 'Dept 80',
      sum(case when DEPARTMENT_ID =90 then round(total) else 0 end) 'Dept 90',
      sum(case when DEPARTMENT_ID =100 then round(total) else 0 end) 'Dept 100'
      from
      (
      select sum(SALARY) total,
      JOB_ID,
      DEPARTMENT_ID
      from emp e
      group by job_id
      ) d
      group by JOB_ID, total
")

## other solutions 
'''
SELECT job_id "Job",
SUM(DECODE(department_id , 10, salary)) "Dept 10",
SUM(DECODE(department_id , 20, salary)) "Dept 20",
SUM(DECODE(department_id , 30, salary)) "Dept 30",
SUM(DECODE(department_id , 40, salary)) "Dept 40",
SUM(DECODE(department_id , 50, salary)) "Dept 50",
SUM(DECODE(department_id , 60, salary)) "Dept 60",
SUM(DECODE(department_id , 70, salary)) "Dept 70",
SUM(DECODE(department_id , 80, salary)) "Dept 80",
SUM(DECODE(department_id , 90, salary)) "Dept 90",
SUM(DECODE(department_id , 100, salary)) "Dept 100"
FROM employees
GROUP BY job_id;

SELECT *
  FROM   (SELECT department_id, job_id, salary
          FROM   employees)
PIVOT (SUM(salary)  FOR department_id  IN  (10,20,30,40,50,60,70,80,90,100,110));

SELECT *
  FROM   (SELECT nvl(department_id,0) dept_id, job_id, salary
          FROM   employees)
PIVOT (SUM(salary)  FOR dept_id  IN  (10,20,30,40,50,60,70,80,90,100,110,0));
'''

# [¹®Á¦174] ¹®Á¦ 173¹ø¿¡¼­ ¸¸µç SQL¹®À» R¿¡¼­ ¿À¶óÅ¬·Î Á¢¼ÓÇÏ¼Å¼­ ¼öÇàÇÏ¼¼¿ä. 
emp_pivot <- dbGetQuery(conn,'SELECT *
  FROM   (SELECT nvl(department_id,0) dept_id, job_id, salary
                        FROM   employees)
                        PIVOT (SUM(salary)  FOR dept_id  IN  (10,20,30,40,50,60,70,80,90,100,110,0))')

emp_pivot <- dbGetQuery(conn,'SELECT job_id "Job",
                        SUM(DECODE(department_id , 10, salary)) "Dept 10",
                        SUM(DECODE(department_id , 20, salary)) "Dept 20",
                        SUM(DECODE(department_id , 30, salary)) "Dept 30",
                        SUM(DECODE(department_id , 40, salary)) "Dept 40",
                        SUM(DECODE(department_id , 50, salary)) "Dept 50",
                        SUM(DECODE(department_id , 60, salary)) "Dept 60",
                        SUM(DECODE(department_id , 70, salary)) "Dept 70",
                        SUM(DECODE(department_id , 80, salary)) "Dept 80",
                        SUM(DECODE(department_id , 90, salary)) "Dept 90",
                        SUM(DECODE(department_id , 100, salary)) "Dept 100"
                        FROM employees
                        GROUP BY job_id')
emp_pivot
str(emp_pivot) ### 'data.frame':	19 obs. of  11 variables

## RÀ» ÀÌ¿ëÇØ Á÷Á¢ create table ½ÇÇà! 
dbWriteTable(conn, "emp_pivot", emp_pivot)
dbReadTable(conn, "emp_pivot")
dbSendUpdate(conn, "drop table emp_pivot")

# [¹®Á¦175] R¿¡¼­ ¿À¶óÅ¬¿¡ ÀÖ´Â EMPLOYEES Å×ÀÌºíÀ» ÀÐ¾î µéÀÎ ÈÄ RÇÔ¼ö¸¦ ÀÌ¿ëÇÏ¼Å¼­ ¹®Á¦ 173¹ø°ú µ¿ÀÏÇÑ °á°ú¸¦ Ãâ·ÂÇÏ¼¼¿ä. 
table(list(emp$JOB_ID, emp$DEPARTMENT_ID))
rou <- round(xtabs(SALARY~JOB_ID+DEPARTMENT_ID,emp))
colnames(rou) <- paste("Dept",colnames(rou)) ; rou

## another solution
empdf <- dbReadTable(conn, "EMPLOYEES")

tapply(empdf$SALARY, list(empdf$JOB_ID, empdf$DEPARTMENT_ID), sum)
tapply(empdf$SALARY, list(empdf$JOB_ID, empdf$DEPARTMENT_ID), sum, default = 0)

# [¹®Á¦176] ºÎ¼­ ÀÎ¿ø¼ö¸¦ ggplot¸¦ ÀÌ¿ëÇØ¼­ ¸·´ë±×·¡ÇÁ¸¦ Ãâ·ÂÇÏ¼¼¿ä.
x <- aggregate(EMPLOYEE_ID ~ ifelse(is.na(DEPARTMENT_ID),0,DEPARTMENT_ID), emp, length) ; x
x <- x %>% arrange(as.numeric(`ifelse(is.na(DEPARTMENT_ID), 0, DEPARTMENT_ID)`))

colnames(x) <- c("dept_id", "cn") ; x
ggplot(x, aes(x=dept_id, y=cn)) + 
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, colour = "blue", size = 10))

## another solution
emp <- dbGetQuery(conn, "select nvl(department_id,0) dept_id, count(*) cn from employees group by nvl(department_id,0) order by cn desc")
emp

ggplot(emp, aes(x=factor(DEPT_ID),y=CN))+
  geom_bar(stat="identity", fill= rainbow(12))+
  geom_text(aes(label=CN),vjust=-0.1,size=5)+
  labs(title='ºÎ¼­º° ÀÎ¿ø ÇöÈ²', x='ºÎ¼­¹øÈ£', y='ÀÎ¿ø¼ö(¸í)')+
  theme(plot.title=element_text(face='bold', color='darkblue', hjust=0.5))+
  theme(axis.title.x=element_text(face='bold.italic', color='brown',size=6))+
  theme(axis.title.y=element_text(face='bold.italic', color='brown'))

# [¹®Á¦177] ³âµµº° ÀÔ»çÇÑ ¼ö¸¦ ggplot¸¦ ÀÌ¿ëÇØ¼­ ¸·´ë±×·¡ÇÁ¸¦ Ãâ·ÂÇÏ¼¼¿ä.
y <- emp[,c("EMPLOYEE_ID","HIRE_DATE")] ; y
y$HIRE_DATE <- substr(y$HIRE_DATE,1,4)
y2 <- aggregate(EMPLOYEE_ID ~ HIRE_DATE, y, length) ; y2
colnames(y2) <- c("year","cn")

ggplot(y2, aes(x=year, y=cn)) + 
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, colour = "blue", size = 10))

## another solution
library(RJDBC)
library(ggplot2)
library(lubridate)
library(plyr)

emp <- dbGetQuery(conn, "select * from employees")

ggplot(emp,aes(x=year(HIRE_DATE)))+
  geom_bar()

ggplot(emp, aes(x=factor(year(HIRE_DATE)), fill=factor(year(HIRE_DATE))))+
  geom_bar()+
  labs(title = "³âµµº° ÀÔ»çÇöÈ²", x="³âµµ", y="ÀÎ¿ø¼ö", fill="³âµµ")+
  theme(plot.title=element_text(face='bold', color='darkblue', hjust=0.5))+
  theme(axis.title.x=element_text(face='bold', color='darkblue'))+
  theme(axis.title.y=element_text(face='bold', color='darkblue'))+
  theme(legend.title.align=0.5, legend.box.background = element_rect(),
        legend.box.margin = margin(t=0.1,r=0.1, b=0.1, l=0.1,unit='cm'))

year_cn <- count(emp,"year(HIRE_DATE)") ### count::plyr 
colnames(year_cn) <- c("year","cn")
year_cn

ggplot(year_cn,aes(x=year,y=cn,fill=factor(year)))+
  geom_bar(stat="identity")+ ### stat="identity": the heights of the bars to represent values in the data
  geom_text(aes(label=cn))+
  ggtitle("³âµµº° ÀÔ»çÇöÈ²",subtitle="½ÅÀÔ»ç¿ø")+
  theme(plot.title = element_text(lineheight=.8, face="bold",color="darkblue",hjust=0.5))+
  theme(plot.subtitle = element_text(lineheight=.8, face="bold",color="darkblue",hjust=0.5))+
  labs(caption = "2001³â ~ 2008³â")+
  labs(x="³âµµ",y="ÀÎ¿ø¼ö")+
  guides(fill=guide_legend(title="³âµµ"))+ ### ¹ü·Ê¿¡ ´ëÇÑ ºÎºÐ 
  theme(legend.title.align=0.5, legend.box.background = element_rect(),
        legend.box.margin = margin(t=0.1,r=0.1, b=0.1, l=0.1,unit='cm'))

hire_cn <- dbGetQuery(conn, "select to_char(hire_date,'yyyy') year,count(*) cn from employees group by to_char(hire_date,'yyyy')")
hire_cn
ggplot(hire_cn,aes(x=YEAR,y=CN,fill=YEAR))+
  geom_bar(stat="identity")+
  geom_text(aes(label=CN))+
  labs(title = "³âµµº° ÀÔ»çÇöÈ²", x="³âµµ", y="ÀÎ¿ø¼ö", fill="³âµµ")+
  theme(plot.title=element_text(face='bold', color='darkblue', hjust=0.5))+
  theme(axis.title.x=element_text(face='bold', color='darkblue'))+
  theme(axis.title.y=element_text(face='bold', color='darkblue'))+
  theme(legend.title.align=0.5, legend.box.background = element_rect(),
        legend.box.margin = margin(t=0.1,r=0.1, b=0.1, l=0.1,unit='cm'))

# [¹®Á¦178] ÇÐ»ýµéÀÇ °ú¸ñ Á¡¼ö¸¦ °¢°¢À¸·Î ¸·´ë±×·¡ÇÁ¸¦ ±×¸®¼¼¿ä.
df <- read.csv("c:/data/exam.csv", header=TRUE, stringsAsFactors=F)
df

ggplot(df, aes(x=name, y=grade))+
  geom_bar(stat="identity",fill="red")+
  theme(axis.text.x = element_blank())+
  facet_wrap(~ name+subject) ### °¢ÀÚÀÇ Â÷Æ®¸¦ Ç¥ÇöÇÏ´Â ¸Þ¼Òµå! 

ggplot(df, aes(x=subject, y=grade, group=name))+
  geom_col(aes(fill=subject))+
  theme(axis.text.x = element_blank())+
  facet_wrap(~ name)

## https://blog.naver.com/ehdsnck/221332786323

# [¹®Á¦179] 'Mata','Young' ÇÐ»ýÀÇ °ú¸ñÁ¡¼ö¸¦ ¼±°úÁ¡ ±×·¡ÇÁ·Î »ý¼ºÇÏ¼¼¿ä.
df2 <- df[df$name %in% c("Mata","Young"),] ; df2

ggplot(df2, aes(x = subject, y = grade, group = name, color = name)) +  
  geom_line() +
  geom_point()

# [¹®Á¦180] seoul.txt ÆÄÀÏÀ» ´Ü¾îº° ºóµµ¼ö¸¦ È®ÀÎ ÇÏ½Ã°í wordcloud¸¦ ±×¸®¼¼¿ä.
seoul <- readLines("C://data/seoul.txt")
seoul2 <- SimplePos09(seoul)
unlist(seoul2[grep("N", seoul2)])
seouls <- str_replace_all(unlist(seoul2[grep("N", seoul2)]), '/.*', '') ; seouls
seoult <- table(grep('([A-Z°¡-ÆR])',seouls,value = T)) ; seoult

str(seoult)
seouldf <- as.data.frame(seoult)
seouldf %>% arrange(seouldf$Var1)

pal <- brewer.pal(8,"Dark2") 
set.seed(1234) 
wordcloud(words = rownames(seoult),
          freq = seoult,
          min.freq = 3,
          max.words = 900,
          random.order = F,
          rot.per = .1,
          scale = c(5,.5),
          colors = pal)

s_noun <- str_match(seoul2, '([A-Z°¡-ÆR]+/N)')
na.omit(s_noun[,2]) 
as.vector(na.omit(s_noun[,2])) 

seoult2 <- table(str_replace_all(as.vector(na.omit(s_noun[,2])),'/N.*',''))
wordcloud(words = rownames(seoult2),
          freq = seoult2,
          min.freq = 2,
          max.words = 900,
          random.order = F,
          rot.per = .1,
          scale = c(4.5,.5),
          colors = pal)

# Another solution
library(KoNLP)  
library(wordcloud)

data1 <- readLines("c:/r/seoul.txt") 

useSejongDic()

buildDictionary(ext_dic="sejong",
                user_dic=data.frame(c("ÃÊµîÇÐ±³","½ÃÀå´Ô","¾î¸°ÀÌÁý"),c("ncn")),replace_usr_dic=T)
buildDictionary(ext_dic="sejong",
                user_dic=data.frame(c("¹ö½º±â»ç","ÅÃ½Ã±â»ç"),c("ncn")),replace_usr_dic=T)

help("buildDictionary")
data2 <- extractNoun(data1)
data2

head(unlist(data2), 30) 
data3 <- unlist(data2) 
data3 <- Filter(function(x) {nchar(x) >= 2} ,data3) ### filter()¿Í functionÀ» ÀÌ¿ëÇØ¼­ 2±ÛÀÚ ÀÌ»óÀÇ µ¥ÀÌÅÍ¸¸ ÃßÃâ! 
data3
data3 <- gsub("\\d+","", data3) ### ¼ýÀÚ¸¦ ÀüºÎ Ã£¾Æ³»¼­ ¾ø¾Ú! 
data3 <- gsub("¼­¿ï½Ã","", data3) ### ºÒÇÊ¿äÇÑ ´Ü¾îµé ¸ðµÎ Ã£¾Æ³»¼­ ÀÏÀÏÈ÷ ¾ø¾Ú! 
data3 <- gsub("¼­¿ï","", data3)  
data3 <- gsub("¿äÃ»","", data3)  
data3 <- gsub("Á¦¾È","", data3) 
data3 <- gsub(" ","", data3)
data3 <- gsub("-","",data3)
data3 <- gsub("O+","",data3)
data3

write(unlist(data3),"c:/r/seoul_2.txt") 
data4 <- read.table("c:/r/seoul_2.txt")
data4

nrow(data4) 
wordcount <- table(data4) 
wordcount

head(sort(wordcount, decreasing=T),50)

library(RColorBrewer) 
palete <- brewer.pal(9,"Set3") 
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(2,0.5),
          random.order=F,
          random.color=T,
          colors=palete)

library(wordcloud2)
wordcloud2(wordcount)

display.brewer.all() ### ¾î¶² ÆÈ·¹Æ®¸¦ ¾µ Áö, ÀÌ°Å º¸¸é¼­ ¼±ÅÃ! 

# [¹®Á¦181] jeju.txt ºÐ¼®ÇÏ¼¼¿ä. (¸¹ÀÌ ³ª¿Â Áö¸í)
jeju <- readLines("C://data/jeju.txt")
head(jeju)

useSejongDic()
buildDictionary(ext_dic="sejong", user_dic = data.frame(readLines("C://data/Á¦ÁÖµµ°ü±¤Áö.txt"),"ncn"),replace_usr_dic = T) ### Á¦ÁÖµµ°ü±¤Áö ÀÌ¸§À» »çÀü¿¡ ³ÖÀ½! 
jeju2 <- gsub("[1100]","Ãµ¹é",jeju2)

jeju2 <- SimplePos09(jeju) 
unlist(seoul2[grep("N", seoul2)])
j_noun <- str_match(jeju2, '([0-9A-Z°¡-ÆR]+/N)') ; j_noun
j_noun <- Filter(function(x) {nchar(x) >= 2} ,j_noun) ; j_noun
na.omit(j_noun[,2]) 
as.vector(na.omit(s_noun[,2])) 

jejut <- table(str_replace_all(j_noun,'/N.*','')) ; jejut
wordcloud(words = rownames(jejut),
          freq = jejut,
          min.freq = 3,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(4,.5),
          colors = pal)



tour <- unlist(readLines("C://data/Á¦ÁÖµµ°ü±¤Áö.txt"))
jeju2 <- extractNoun(jeju) ; jeju2
j_noun2 <- unlist(jeju2) ; j_noun2 <- unlist(str_split(j_noun2,'-')) ### hyphen ºÐ¸® 

###################################################################
j_noun2 <- str_split(j_noun2,'-') ; j_noun2
j_noun2[[969]]
unique(j_noun2[[969]])
for (i in 1:length(j_noun2)){
  j_noun2[[i]] <- unique(j_noun2[[i]])
}
j_noun2
###################################################################

j_noun3 <- j_noun2[j_noun2 %in% intersect(j_noun2, tour)]
j_noun_t <- table(j_noun3)
pal <- brewer.pal(8,"Dark2")
wordcloud(words = rownames(j_noun_t),
          freq = j_noun_t,
          min.freq = 3,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(4,.5),
          colors = pal)
wordcloud2(j_noun_t, shape="pentagon", size = .5)
wordcloud2(j_noun_t, shape="star", size = .5)
?wordcloud2
head(sort(j_noun_t, decreasing = T),10)
## ¿ìµµ, ¼Û¾Ç»ê, ¿ë¸Ó¸®ÇØ¾È, ¼º»êÀÏÃâºÀ, ¼·ÁöÄÚÁö -> µå¶ó¸¶ ÃÔ¿µÁö 



extractNoun(paste(unlist(jeju2),collapse = ""))

jeju2 <- str_replace_all(jeju2,'¿ë¸Ó¸® ÇØ¾È','¿ë¸Ó¸®ÇØ¾È')
jeju2 <- str_replace_all(jeju2,'ÃµÁö¿¬ ÆøÆ÷','ÃµÁö¿¬ÆøÆ÷')
jeju2 <- str_replace_all(jeju2,'ÃµÁ¦¿¬ ÆøÆ÷','ÃµÁ¦¿¬ÆøÆ÷')
jeju2 <- str_replace_all(jeju2,'ÃµÁö¿¬','ÃµÁö¿¬ÆøÆ÷')
jeju2 <- str_replace_all(jeju2,'ÃµÁ¦¿¬','ÃµÁ¦¿¬ÆøÆ÷')

## »óÀ§ Áö¸íµé »Ì¾Æ¼­ Áöµµ¿¡ Âï¾îº½! -> google map
names <- c("¿ìµµ","¼·ÁöÄÚÁö","¼Û¾Ç»ê","ÁÖ»óÀý¸®","¼º»êÀÏÃâºÀ")
addr <- c("Á¦ÁÖÆ¯º°ÀÚÄ¡µµ Á¦ÁÖ½Ã ÇÑ¸²À¾ ÇùÀç¸® 2497-1","Á¦ÁÖÆ¯º°ÀÚÄ¡µµ Á¦ÁÖ½Ã Á¶ÃµÀ¾ ÇÔ´ö¸® 1008")
gc <- geocode(enc2utf8(names)) ; gc
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat) ; df
cen <- c(mean(df$lon), mean(df$lat)) ; cen

map <- get_googlemap(center = cen, zoom = 10, maptype = "roadmap", markers = gc)
ggmap(map) 



# [¹®Á¦] ÇÏ³ª ÀÌ»óÀÇ ¿¬ÀÌ¾î ÀÖ´Â ¼ýÀÚ¸¦ Ã£±â 
data<-readLines('c:/data/jeju.txt')
data

gr <- grep('[[:digit:]]{1,}',data,value=T) ### ¼ýÀÚ°¡ µé¾î ÀÖ´Â ¹®Àå 
str_extract_all(data,'[[:digit:]]{1,}') ### ÇØ´ç ¶óÀÎ¿¡ ¼ýÀÚ¸¸ ÃßÃâ 
unlist(str_extract_all(data,'[[:digit:]]{1,}'))
table(unlist(str_extract_all(data,'.[[:digit:]]{1,}.'))) ### ¼ýÀÚ ÀüÈÄÁÂ¿ì¿¡ ¹¹°¡ ÀÖ´Â Áö ÆÄ¾Ç 

# [¹®Á¦] ¼ýÀÚ ¾Õ µÚ¿¡ ¹®ÀÚ°¡ ÀÖ°Å³ª ¾ø´Â °æ¿ì
unlist(str_extract_all(data,'.[[:digit:]]{1,}.'))

## ÅØ½ºÆ® ¸¶ÀÌ´× Á¤±Ô½Ä 
table(unlist(str_extract_all(data,'[[:alpha:]]{0,}[[:digit:]]{1,}[[:alpha:]]{0,}'))) ### grep() ´õ °øºÎ!!!

unlist(str_extract_all(data,'[[:alpha:]]{0,}¿ìµµ[[:alpha:]]{0,}')) ### ¿ìµµ ¾ÕµÚ¿¡ ´Ù¸¥ ´Ü¾î°¡ ºÙ¾î ÀÖ´Â °æ¿ìµµ È®ÀÎ! 
unlist(str_extract_all(data,'[[:punct:]]{0,}Áß¹®[[:punct:]]{0,}'))
unlist(str_extract_all(data,'[[:punct:]]{0,}Áß¹®[[:punct:]]{0,}[[:alpha:]]{0,}')) ### Áß¹® µÚ¿¡ Æ¯¼ö ¹®ÀÚ ¶Ç´Â ¹®ÀÚ
unlist(str_extract_all(data,'[[:punct:]]{0,}Áß¹®[[:punct:]]{0,}[[:alpha:]]{0,}[[:punct:]]{0,}')) 

unlist(str_extract_all(data,"[[:alpha:]]{0,}[' ']{0,}ÆøÆ÷[[:alpha:]]{0,}")) ### [' ']{0,}: °ø¹é¹®ÀÚ Æ÷ÇÔµÈ °Íµéµµ ÃßÃâ <- ÃµÁö¿¬ÆøÆ÷ + ÃµÁö¿¬ ÆøÆ÷

# [¹®Á¦182] noise.txt µ¥ÀÌÅÍ¸¦ ½Ã°¢È­ ÇÏ¼¼¿ä.
## My Data
noise <- readLines("C://data/noise.txt")
noise <- str_split(noise,' ')
noise <- unlist(noise)

noise <- scan()
55.9 63.8 57.2 59.8 65.7 62.7 60.8 51.3 61.8 56.0
66.9 56.8 66.2 64.6 76.5 63.1 60.6 62.0 59.4 67.2
63.6 60.5 66.8 61.8 64.8 55.8 55.7 77.1 62.1 61.0
44.0 60.0 66.9 61.7 60.3 51.5 67.0 60.2 56.2 59.4
67.9 45.9 55.7 61.4 62.6 56.4 56.4 69.4 57.6 63.8

## Factor my code 
noise_ft <- factor(cut(noise, breaks=nclass.Sturges(noise)))

## Tabulate and turn into data.frame
noise_df <- as.data.frame(table(noise_ft)) 

## Add cumFreq and proportions
noise_freq <- transform(noise_df, cumFreq = cumsum(Freq), relative = prop.table(Freq)) ; noise_freq

hist(noise, breaks = seq(40,80,5), right = FALSE, col = rainbow(8), xlab = "Noise", ylim = c(0,50))

## Density 
hist(noise, breaks = seq(40,80,5), right = FALSE, col = rainbow(8), xlab = "Noise", ylim = c(0,.11), probability = T)
lines(density(noise), col="blue")

stem(noise)

# [¹®Á¦183] noise.txt µ¥ÀÌÅÍ¿¡¼­ 25%ÀÇ ±âÁØ µ¥ÀÌÅÍ 75%ÀÇ ±âÁØ µ¥ÀÌÅÍ¸¦ Ã£À¸¼¼¿ä.
noise_qt <- quantile(noise)
noise_qt[c(2,4)]
noise_qt2 <- quantile(noise, type=2) ### "type = 2" ²À ³Ö¾îÁÙ °Í! 
noise_qt2[c(2,4)]

noise_st <- sort(noise)
noise_qt <- noise_st[c(round(length(noise)*.25), round(length(noise)*.75))] ### ¹Ý¿Ã¸²(wrong)
noise_qt <- noise_st[c(ceiling(length(noise)*.25), ceiling(length(noise)*.75))] ### ¿Ã¸²(right) 
names(noise_qt) <- c("25%","75%")
noise_qt

boxplot(noise, col="red") ### check out outliers 

## median °è»ê 
median_cavin <- function(x){
  x_st <- sort(x)
  ifelse(length(x)%%2!=0, x_st[ceiling(length(x)*.50)], (x_st[length(x)*.50]+x_st[1+length(x)*.50])*.50)
}
median_cavin(noise)
median(noise)

# [¹®Á¦184] food.csv µ¥ÀÌÅÍ¸¦ ±âÁØÀ¸·Î Åä¸¶ÅäÀÇ sweetnessÀº 6,  crunchinessÀº 4 ÀÔ´Ï´Ù. ºÐ·ù¸¦ ÇÏ¼¼¿ä.
food <- read.csv("C://data/food.csv")
head(food)
test <- data.frame(sweetness = 6, crunchiness = 4)
train <- food[,-c(1,4)]
clusters <- food[,4]

knn(train, test, clusters, k=3)

## ggplot2 ÀÌ¿ëÇØ¼­ ÁÂÇ¥¸¦ Ç¥ÇöÇØº¼ °Í! 
tomato <- data.frame(ingredient = "tomato",sweetness = 6, crunchiness = 4) 
test<- tomato[,2:3]
train <- food[,2:3]
train_level <- food[,4]
knn(train , test , train_level , k=3 , prob=TRUE) 
library(ggplot2)
ggplot(data=food,aes(x=sweetness,y=crunchiness))+
  labs(title="What is tomato class?")+
  geom_point(aes(color=class, shape=class),size=6)+
  geom_text(aes(label=ingredient), vjust=-1, size = 5)+
  geom_point(data = tomato, colour = "black", size=6)+
  geom_text(data=tomato,aes(label=ingredient),vjust = -2,size=5,fontface = "bold")

data.frame(ingredient=food[,1],distinct = sqrt((food[,2] - tomato[,2])^2 + (food[,3] - tomato[,3])^2))

# [¹®Á¦185]  ³ªÀÌ, ¿ù¼öÀÔ, »óÇ°±¸¸Å¿©ºÎ¸¦ °®´Â µ¥ÀÌÅÍ°¡ ÀÖ´Ù.
# ÀÌ µ¥ÀÌÅÍ¸¦ ÀÌ¿ëÇØ¼­ ³ªÀÌ°¡ 44 ÀÌ°í ¿ù±ÞÀÌ 400 ¸¸¿øÀÎ »ç¶÷ÀÌ
# »óÇ°À» ±¸¸ÅÇÒÁö ºñ±¸¸ÅÇÒÁö¸¦ knn ºÐ·ù ¾Ë°í¸®ÁòÀ¸·Î ºÐ¼®ÇÏ¼¼¿ä.

## ³ªÀÌ¿Í ¿ù¼öÀÔÀÇ "´ÜÀ§"¸¦ ½Å°æ½áÁà¾ß ÇÔ! 
## º¯¼öµéÀÌ µ¿ÀÏÇÑ ¼öÄ¡°¡ ¾Æ´Ô -> Á¦´ë·Î µÈ ºñ±³, ºÐ¼® ºÒ°¡´É! 

buy <- read.csv("C://data/buy.csv")
head(buy)
man <- data.frame(³ªÀÌ = 44, ¿ù¼öÀÔ = 400)
train <- buy[,-3]
t_label <- buy[,3]
train[,1]
m1 <- mean(train[,1])
s1 <- sd(train[,1])
train[,2]
m2 <- mean(train[,2])
s2 <- sd(train[,2])

(man[1]-m1)/s1
(man[2]-m2)/s2
test <- data.frame(³ªÀÌ = (man[1]-m1)/s1, ¿ù¼öÀÔ = (man[2]-m2)/s2) 
### ÀÌ »ç¶÷(observation)Àº ¾ö¹ÐÈ÷ ¸»ÇÏÀÚ¸é, train set¿¡´Â Æ÷ÇÔµÇÁö ¾ÊÁö¸¸, 
### standardisationÇÒ ¶§ train setÀÇ mean°ú sd¸¦ ÀÌ¿ëÇØµµ µÊ -> Degree of FreedomÀÇ °³³ä È®ÀÎ! 
(train[,1]-m1)/s1
(train[,2]-m2)/s2
train2 <- data.frame(³ªÀÌ = (train[,1]-m1)/s1, ¿ù¼öÀÔ = (train[,2]-m2)/s2)

knn(train2, test, t_label,  k=round(sqrt(nrow(train2)))) ### Standardisation 
### »óÇ° ±¸¸ÅÇÒ °ÍÀ¸·Î ¿¹Ãø!(k°ªÀ» 1·Î ÇÏ¸é, ºñ±¸¸Å ³ª¿È!)

f <- ggplot(buy, aes(³ªÀÌ, ¿ù¼öÀÔ)) 
f + geom_point() + geom_point(aes(x=44, y=400), colour="red") +
  geom_text(data=buy,aes(label=»óÇ°±¸¸Å¿©ºÎ),vjust = -2,size=3,fontface = "bold")

## Other solutions 
buy <- read.csv("c:/data/buy.csv" , stringsAsFactors = F , header = T)

### Á¤±ÔÈ­¸¦ ¼öÇàÇÏ´Â ¸Þ¼Òµå »ý¼º 
normalize <- function(x) {
  (x-mean(x))/sd(x)
}

### lapply »ç¿ë
buy$age <-unlist(lapply(buy[1],normalize))
buy$pay <-unlist(lapply(buy[2],normalize))
buy

test <- data.frame(age=44 , pay=400)
test

train <- buy[,c(4,5)]
labels <- buy[,3]

test$age <- (test$age - mean(buy$³ªÀÌ)) / sd(buy$³ªÀÌ)
test$pay<- (test$pay - mean(buy$¿ù¼öÀÔ)) / sd(buy$¿ù¼öÀÔ)

library(class)
knn(train , test , labels , k=1)
knn(train , test , labels , k=1 , prob=TRUE) 
knn(train , test , labels , k=3 , prob=TRUE) 

#################

buy <- read.csv("c:/data/buy.csv" , stringsAsFactors = F , header = T)

### scale »ç¿ë(ÀÌ°É·Î Z°ª ±¸ÇÒ ¼ö ÀÖÀ½!)
buy$age <- scale(buy$³ªÀÌ)
buy$pay <- scale(buy$¿ù¼öÀÔ)

buy

test <- data.frame(age=44 , pay=400)
test

train <- buy[,c(4,5)]
labels <- buy[,3]

test$age <- (test$age - mean(buy$³ªÀÌ)) / sd(buy$³ªÀÌ)
test$pay <- (test$pay - mean(buy$¿ù¼öÀÔ)) / sd(buy$¿ù¼öÀÔ)

library(class)
knn(train , test , labels , k=1)
knn(train , test , labels , k=1 , prob=TRUE) 
knn(train , test , labels , k=3 , prob=TRUE) 

##############

buy <- read.csv("c:/data/buy.csv" , stringsAsFactors = F , header = T)

buy[22,]<-c(44,400,NA) ### train dataµµ test set¿¡ ³Ö¾îÁÜ! 

new_buy <- data.frame(age=scale(buy$³ªÀÌ), income=scale(buy$¿ù¼öÀÔ), status=buy$»óÇ°±¸¸Å¿©ºÎ) ### ÇÑ ¹ø¿¡ Á¤±ÔºÐÆ÷ °è»ê!! 

test<-new_buy[22,-3]
train<-new_buy[-22,-3]

knn(train, test, new_buy[-22,3], k = 5, prob=TRUE) 

## 0°ú 1 »çÀÌÀÇ °ªÀ¸·Î standardise 
range01 <- function(x){(x-min(x))/(max(x)-min(x))}
new_buy01 <- data.frame(age=range01(buy$³ªÀÌ), income=range01(buy$¿ù¼öÀÔ), status=buy$»óÇ°±¸¸Å¿©ºÎ)
test<-new_buy01[22,-3]
train<-new_buy01[-22,-3]
knn(train, test, new_buy01[-22,3],  k=round(sqrt(nrow(train))))

# [¹®Á¦186] zoo.csv µ¥ÀÌÅÍ ÁýÇÕÀº µ¿¹°ÀÇ Æ¯Â¡°ú ºÎ·ù Á¤º¸°¡ ÀÖ½À´Ï´Ù. 
# Æ¯Á¤ µ¥ÀÌÅÍ µ¿¹° Á¤º¸°¡ ¾î´À ºÎ·ù¿¡ ¼ÓÇÏ´Â Áö¸¦ knn ¾Ë°í¸®ÁòÀ» ÀÌ¿ëÇØ¼­ ºÐ¼®ÇÏ¼¼¿ä.

## wren ºÎºÐÀº µ¥ÀÌÅÍ°¡ ´©¶ôµÈ ºÎºÐÀÌ ÀÖÀ½ -> ±×·¡µµ ºÐ·ù ÇÊ¿ä! -> knn ÇÔ¼ö¸¦ ÀÌ¿ëÇØ¼­ ¿¹Ãø!! 
'''
[º¯¼ö Á¤º¸]

1. animal name:      Unique for each instance
2. hair		Boolean
3. feathers		Boolean
4. eggs		Boolean
5. milk		Boolean
6. airborne		Boolean
7. aquatic		Boolean
8. predator		Boolean
9. toothed		Boolean
10. backbone		Boolean
11. breathes		Boolean
12. venomous		Boolean
13. fins		Boolean
14. legs		Numeric (set of values: {0,2,4,5,6,8})
15. tail		Boolean
16. domestic		Boolean
17. catsize		Boolean
18. type		Numeric (integer values in range [1,7])

[18. type]
1 : Æ÷À¯·ù
2 : Á¶·ù
3 : ÆÄÃæ·ù
4 : ¾î·ù
5 : ¾ç¼­·ù 
6 : °ïÃæ
7 : °©°¢·ù 
'''
zoo <- read.csv("C://data/zoo.csv", stringsAsFactors = F, header = F)
tail(zoo)

range01 <- function(x){(x-min(x))/(max(x)-min(x))} 

zoo_sc <- scale(zoo[,c(-1,-18)])
zoo_01 <- range01(zoo[,c(-1,-18)])

zoo[-101,c(-1,-18)]
knn(zoo_sc[-101,c(-1,-18)], zoo_sc[101,c(-1,-18)], zoo[-101,18], k = round(sqrt(nrow(zoo)))-1) 
### Á¶·ù! 
knn(zoo_01[-101,c(-1,-18)], zoo_01[101,c(-1,-18)], zoo[-101,18], k = round(sqrt(nrow(zoo)))-1) 
### Á¶·ù! 

# [¹®Á¦187] À¯¹æ¾Ï µ¥ÀÌÅÍ ÀÔ´Ï´Ù. kNN¾Ë°í¸®ÁòÀ» ÀÌ¿ëÇØ¼­ ÈÆ·Ãµ¥ÀÌÅÍ¼Â,Å×½ºÆ®µ¥ÀÌÅÍ¼ÂÀ» ÀÌ¿ëÇØ¼­ ºÐ·ù°¡ ÀßµÇ´ÂÁö È®ÀÎÇÏ¼¼¿ä.
## ID´Â ÇÊ¿ä ¾øÀ½
## ¼ºº°, diagnosis´Â ¹üÁÖÇü(¼ýÀÚ)À¸·Î ¹Ù²ãÁà¾ß! 
## Diagnosis°¡ °á°ú°ª(label)! 
'''
- À§½ºÄÜ½Å´ëÇÐÀÇ ¿¬±¸¿øµéÀÇ ÀÚ·á
- À¯¹æ Á¾¾çÀÇ ¹Ì¼¼Ä§ ÈíÀÎ¹° µðÁöÅÐ ÀÌ¹ÌÁö¿¡¼­ ÃøÁ¤ÇÑ °ª ÀÌ¸ç ÀÌ °ªÀº µðÁöÅÐ ÀÌ¹ÌÁö¿¡ ³ªÅ¸³­ ¼¼Æ÷ ÇÙÀÇ Æ¯Â¡ÀÌ´Ù.
- ¾ÏÁ¶Á÷ °Ë»ç¿¡ ´ëÇÑ °üÃø°ªÀº 569°³, º¯¼ö(¼Ó¼º) 32
- ½Äº°¼ýÀÚ, ¾ÏÁø´Ü ¿©ºÎ(¾Ç¼º(Malignant),¾ç¼º(Benign)), 30°³ ¼öÄ¡ ÃøÁ¤Ä¡
- ¼¼Æ÷ÇÙÀÇ ¸ð¾ç°ú Å©±â°ü·ÃµÈ 10°³ Æ¯¼º
* radius(¹ÝÁö¸§)
* texture(Áú°¨)
* perimeter(µÑ·¹)
* area(³ÐÀÌ)
* smoothness(¸Å²ô·¯¿ò)
* compactness(Á¶¹Ð¼º)
* concavity(¿À¸ñÇÔ)
* concave points(¿À¸ñÁ¡)
* symmetry(´ëÄª¼º)
* fractal dimension(ÇÁ·¢Å» Â÷¿ø)
'''
tumor <- read.csv("C://data/wisc_bc_data.csv", stringsAsFactors = F, header = T)
head(tumor)
str(tumor)
nrow(tumor)

standardise <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

tumor_n <- as.data.frame(lapply(tumor[c(-1,-2)], standardise))

summary(tumor_n)
table(tumor$diagnosis)
set.seed(1234)

tumor_sample_n <- sample(2,nrow(tumor_n), replace=TRUE,prob = c(0.67,0.33)) 
tumor_training_n <- tumor_n[tumor_sample_n == 1, c(-1,-2)] 
tumor_training_n
tumor_train_label <- tumor[tumor_sample_n == 1, 2]
tumor_train_label
str(tumor_train_label)

tumor_test_n <- tumor_n[tumor_sample_n == 2, c(-1,-2)] 
tumor_test_n
tumor_test_label <- tumor[tumor_sample_n == 2, 2]
tumor_test_label

tumor_model_n <- knn(tumor_training_n,tumor_test_n,tumor_train_label, k=3)
tumor_model_n

CrossTable(x = tumor_test_label, y = tumor_model_n, prop.chisq=FALSE)

## Another Solution
## 1 ´Ü°è : µ¥ÀÌÅÍ ¼öÁý
'''
- À§½ºÄÜ½Å´ëÇÐÀÇ ¿¬±¸¿øµéÀÇ ÀÚ·á
- À¯¹æ Á¾¾çÀÇ ¹Ì¼¼Ä§ ÈíÀÎ¹° µðÁöÅÐ ÀÌ¹ÌÁö¿¡¼­ ÃøÁ¤ÇÑ °ª ÀÌ¸ç ÀÌ °ªÀº µðÁöÅÐ 
ÀÌ¹ÌÁö¿¡ ³ªÅ¸³­ ¼¼Æ÷ ÇÙÀÇ Æ¯Â¡ÀÌ´Ù.
- ¾ÏÁ¶Á÷ °Ë»ç¿¡ ´ëÇÑ °üÃø°ªÀº 569°³, º¯¼ö(¼Ó¼º) 32
- ½Äº°¼ýÀÚ, ¾ÏÁø´Ü ¿©ºÎ(¾Ç¼º(Malignant),¾ç¼º(Benign)), 30°³ ¼öÄ¡ ÃøÁ¤Ä¡
- ¼¼Æ÷ÇÙÀÇ ¸ð¾ç°ú Å©±â°ü·ÃµÈ 10°³ Æ¯¼º
* radius(¹ÝÁö¸§)
* texture(Áú°¨)
* perimeter(µÑ·¹)
* area(³ÐÀÌ)
* smoothness(¸Å²ô·¯¿ò)
* compactness(Á¶¹Ð¼º)
* concavity(¿À¸ñÇÔ)
* concave points(¿À¸ñÁ¡)
* symmetry(´ëÄª¼º)
* fractal dimension(ÇÁ·¢Å» Â÷¿ø)
'''

## 2 ´Ü°è  : µ¥ÀÌÅÍ ÁØºñ
wbcd <- read.csv("c:/data/wisc_bc_data.csv", stringsAsFactors = FALSE)

str(wbcd)
head(wbcd)

### id ¼Ó¼º Á¦°Å
wbcd <- wbcd[-1]

### diagnosis º¯¼ö °á°ú ¾Ç¼º212 ¾ç¼º 357
table(wbcd$diagnosis)

### ÆÑÅÍ·Î¼­ Áø´Ü º¯¼ö º¯È¯
wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"), labels = c
                         ("Benign", "Malignant"))
head(wbcd)

### Áø´Ü º¯¼öÀÇ ºñÀ²
round(prop.table(table(wbcd$diagnosis)) * 100) ### ÇÑÂÊ Ä«Å×°í¸®¿¡ ºñÀ²ÀÌ Áö³ªÄ¡°Ô ³·À¸¸é µ¥ÀÌÅÍ¿¡ ¹®Á¦°¡ ÀÖ´Â °Í! 
'''
Benign Malignant 
62.7      37.3 
'''

### ¼¼ ¼Ó¼º¿¡ ´ëÇÑ ¿ä¾à
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])

### Á¤±ÔÈ­ ÇÔ¼ö
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

### wbcd µ¥ÀÌÅÍ Á¤±ÔÈ­
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

head(wbcd)
head(wbcd_n)

### Á¤±ÔÈ­°¡ Àß µÇ¾ú´ÂÁö È®ÀÎ 
summary(wbcd_n$area_mean)
summary(wbcd_n$concavity_worst)

### ÈÆ·Ã µ¥ÀÌÅÍ¿Í Å×½ºÆ® µ¥ÀÌÅÍ »ý¼º 
n <- sample(1:569,400)
wbcd_train <- wbcd_n[n,]
wbcd_test <- wbcd_n[-n,] 

### ÈÆ·Ã µ¥ÀÌÅÍ¿Í Å×½ºÆ® µ¥ÀÌÅÍ¿¡ ´ëÇÑ ¶óº§ »ý¼º
wbcd_train_labels <- wbcd[n, 1]
wbcd_test_labels <- wbcd[-n, 1]

round(prop.table(table(wbcd_train_labels)) * 100)
round(prop.table(table(wbcd_test_labels)) * 100)

## 3´Ü°è : µ¥ÀÌÅÍ·Î ¸ðµ¨ ÈÆ·Ã 
library(class)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = 
                        wbcd_train_labels, k=21)

## 4 ´Ü°è : ¸ðµ¨ ¼º´É Æò°¡ 
library(gmodels)

### ¿¹Ãø°ª°ú ½ÇÁ¦°ªÀÇ ±³Â÷Ç¥ »ý¼º
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)
'''
ÇÑ°èÈ®·ü, °áÇÕÈ®·ü, Á¶°ÇºÎÈ®·ü 

                   | wbcd_test_pred 
  wbcd_test_labels |    Benign | Malignant | Row Total | 
  -----------------|-----------|-----------|-----------|
            Benign |       102 |         2 |       104 | 
                   |     0.981 |     0.019 |     0.615 | <- 0.981: ¾ç¼ºÀ¸·Î ÆÇº°µÈ µ¥ÀÌÅÍ°¡ ¾ç¼ºÀÏ È®·ü(Á¶°ÇºÎ È®·ü) // 0.019: ¾ç¼ºÀ¸·Î ÆÇº°µÈ µ¥ÀÌÅÍ°¡ ½ÇÁ¦·Î´Â ¾Ç¼ºÀÏ È®·ü // 0.615: ÇÑ°èÈ®·ü(104/169)
                   |     0.971 |     0.031 |           | 
                   |     0.604 |     0.012 |           | <- 0.604: 102/169
  -----------------|-----------|-----------|-----------|
         Malignant |         3 |        62 |        65 | <- ½ÇÁ¦·Î´Â ¾Ç¼ºÀÎµ¥, ¾ç¼ºÀÌ¶ó°í Áø´ÜÇÑ °æ¿ì => ½É°¢!(°¡Àå ¸ÕÀú °³¼±ÇØ¾ß!)
                   |     0.046 |     0.954 |     0.385 | 
                   |     0.029 |     0.969 |           | 
                   |     0.018 |     0.367 |           | <- 0.367: 62/169 <- 0.604+0.367ÀÌ 1ÀÌ¸é ¿¹Ãø°ª°ú ½ÇÁ¦°ªÀÌ Àß ¸Â´Â °Å! 
  -----------------|-----------|-----------|-----------|
      Column Total |       105 |        64 |       169 | 
                   |     0.621 |     0.379 |           | 
  -----------------|-----------|-----------|-----------|
'''  

### ºÐ·ù Á¤È®µµ °è»êÇÏ±â
sum(wbcd_test_pred == wbcd_test_labels ) / length(wbcd_test_labels)
### [1] 0.9704142

## 5 ´Ü°è : ¸ðµ¨ ¼º´É Çâ»ó 

### µ¥ÀÌÅÍ ÇÁ·¹ÀÓ¸¦ z-score Ç¥ÁØÈ­ÇÏ±â À§ÇØ scale() ÇÔ¼ö »ç¿ë
wbcd_z <- as.data.frame(scale(wbcd[-1]))

### º¯È¯ÀÌ Á¤È®ÇÏ°Ô Àû¿ëµÇ¾ú´ÂÁö È®ÀÎ
summary(wbcd_z$area_mean)

### ÈÆ·Ã°ú Å×½ºÆ® µ¥ÀÌÅÍ¼Â »ý¼º
n <- sample(1:569,400) ### 569 Áß¿¡ 400°³ÀÇ ¼ýÀÚ¸¦ ·£´ýÇÏ°Ô ÃßÃâ 

wbcd_train <- wbcd_z[n,]
wbcd_test <- wbcd_z[-n,] 

### ÈÆ·Ã µ¥ÀÌÅÍ¿Í Å×½ºÆ® µ¥ÀÌÅÍ¿¡ ´ëÇÑ ¶óº§ »ý¼º
wbcd_train_labels <- wbcd[n, 1]
wbcd_test_labels <- wbcd[-n, 1]

### º¯°æÇÑ µ¥ÀÌÅÍ·Î ºÐ·ù 
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = 
                        wbcd_train_labels, k=21)

### ¿¹Ãø°ª°ú ½ÇÁ¦°ªÀÇ ±³Â÷Ç¥ »ý¼º
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

### ´Ù¸¥ k °ªÀ¸·Î ºÐ·ù
### k°ª¸¶´Ù È®·üÀ» È®ÀÎÇØ¼­, °¡Àå ÀûÀýÇÑ °É ¼±ÅÃ! 
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = 
                        wbcd_train_labels, k=1)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = 
                        wbcd_train_labels, k=5)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = 
                        wbcd_train_labels, k=11)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl = 
                        wbcd_train_labels, k=15)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq=FALSE)

### ºÐ·ù Á¤È®µµ °è»êÇÏ±â
sum(wbcd_test_pred == wbcd_test_labels ) / length(wbcd_test_labels )

# [¹®Á¦188] »õÈ¯ÀÚÀÇ ÃÊÀ½ÆÄ °á°ú¸¦ º¸°í Á¾¾çÀÌ ¾ç¼ºÀÎÁö ¾Ç¼ºÀÎÁö¸¦ ºÐ¼®ÇØ ÁÖ¼¼¿ä
patient <- read.csv("C://data/patient.csv", stringsAsFactors = F, header = T)
head(patient)
tumor_patient <- patient[,c(-1,-2)]
head(tumor_patient)
tumor_st <- as.data.frame(lapply(tumor[c(-1,-2)], standardise))
tumor_patient_st <- as.data.frame(standardise(tumor_patient))

knn(tumor_st, tumor_patient_st, tumor[,2], k=sqrt(nrow(tumor)))
### ¾ç¼º! 

# [¹®Á¦189] JOB_ID º°·Î ¿ù±ÞÀÇ Â÷ÀÌ°¡ Á¸ÀçÇÏ´ÂÁö crosstable·Î ºÐ¼®ÇÏ·Á°í ÇÕ´Ï´Ù.
# ¿ù±Þ 10000À» ±âÁØÀ¸·Î JOB_ID º°·Î °¢°¢ 10000 ÀÌ»óÀÎ »ç¿ø°ú ÀÌÇÏÀÎ »ç¿øµéÀÇ ÀÎ¿ø¼ö°¡ Ãâ·ÂÇÏ¼¼¿ä. 
emp <- read.csv("C://data/emp.csv", stringsAsFactors = F, header = T)
head(emp)

aggregate(SALARY ~ JOB_ID, emp_ab, var)
emp_ab <- orderBy(~JOB_ID, emp_ab)
emp_ab$analysis <- ifelse(emp$SALARY>10000, "ÀÌ»ó", "ÀÌÇÏ")

CrossTable(x = emp_ab$JOB_ID, y = emp_ab$analysis, prop.chisq=FALSE)

# [¹®Á¦190] ¼ö°­»ýÀÌ ´Ù¸¥ ¼¼ ¹ÝÀÇ Æò±ÕÀº? 
'''
¹Ý      ¼ö°­»ý      ¹ÝÆò±Õ
-----------------------------
1¹Ý     40          70
2¹Ý     35          75
3¹Ý     25          80
'''
(70*40+75*35+80*25)/(40+35+25) ### °¡ÁßÆò±Õ!

# [¹®Á¦191] È«ÇÏµç, ¹ÚÄ¿¸® µÎ ÇÐ»ýÀÌ È®·üÅë°è(3ÇÐÁ¡), ÄÄÇ»ÅÍ½Ã½ºÅÛ(2ÇÐÁ¡)À» ¼ö°­ÇÑ °á°ú, 
# È«ÇÏµçÀº È®·üÅë°è¿¡¼­ AÇÐÁ¡, ÄÄÇ»ÅÍ½Ã½ºÅÛ¿¡¼­ BÇÐÁ¡À» ¹Þ¾Ò°í
# ¹ÚÄ¿¸®´Â È®·üÅë°è¿¡¼­ BÇÐÁ¡, ÄÄÇ»ÅÍ½Ã½ºÅÛ¿¡¼­ AÇÐÁ¡À» ¹Þ¾Ò´Ù. 
# AÇÐÁ¡ÀÇ ÆòÁ¡Àº 4, BÇÐÁ¡ÀÇ ÆòÁ¡Àº 3ÀÏ ¶§, 
(3*4+2*3)/5
(3*3+2*4)/5

# [¹®Á¦192] Àü³âµµ ´ëºñ Áõ°¡À²À» ±¸ÇÏ¼¼¿ä.
'''
³âµµ      ¼öÀÍ      Áõ°¡À²
2013      635       
2014      998       57%
2015      1265      27%
2016      1701      34%
2017      2363      39%
'''
(998-635)/635
(1265-998)/998
(1701-1265)/1265
(2363-1701)/1701

# [¹®Á¦193] 5³â µ¿¾È ¿¬Æò±Õ º¯È­À²Àº? 
## Geometric mean 
((998)/635*(1265)/998*(1701)/1265*(2363)/1701)^(1/4) - 1
(2363/635)^(1/4) - 1

# [¹®Á¦194] ¼­¿ï°ú ºÎ»ê(400km)¸¦ ¿Õº¹ÇÏ´Âµ¥ ¼­¿ï¿¡¼­ ºÎ»êÀ¸·Î °¡´Âµ¥ 
# ½Ã¼Ó 150km/h·Î °¡°í ¿À´Âµ¥ ½Ã¼Ó 100km/h·Î ¿Ô´Ù¸é, 
# ¿Õº¹ÇÏ´Âµ¥ °É¸° Æò±Õ ½Ã¼ÓÀº?
400/150
400/100
800/(400/150+400/100)

# [¹®Á¦195] °¡±¸´ç ÀÚ³à¼ö
p <- c(2,3,0,2,1,0,3,0,1,4)
mean(p)
sd(p)
## mean°ú ÇÔ²² ¡¾sdµµ Ç¥ÇöÇØÁà¾ß ÇÔ! 

# [¹®Á¦196] º´¿ø Áø·á ½Ã°£ ¾î´À º´¿øÀ¸·Î °¡¸é ÁÁÀ»±î¿ä? 
'''
A º´¿ø 10 15 17 17 23 20 
B º´¿ø 17 32 5 19 20 9
'''
a <- c(10, 15, 17, 17, 23, 20)
b <- c(17, 32, 5, 19, 20, 9)
mean(a)
mean(b)
sd(a)
sd(b)
## meanÀº °°Áö¸¸, sd°¡ ´Ù¸§
## z statistic <- Ç¥ÁØ µî±ÞÀ» ¸Å±æ ¶§ ¾²´Â °ø½Ä 

# [¹®Á¦197] °üÃø µ¥ÀÌÅÍ°ªµéÀ» È®ÀÎÇÑ ÈÄ NA°ªÀÌ ÀÖÀ» °æ¿ì »ê¼úÆò±ÕÀ¸·Î ³Ö¾îÁÖ¼¼¿ä. 
c <- c(1,3,4,NA,10,NA,8,2)
mean(c, na.rm = T)
c[is.na(c)] <- mean(c, na.rm = T)
as.integer(c)

# [¹®Á¦198] °üÃø µ¥ÀÌÅÍ°ªµéÀ» È®ÀÎÇÑ ÈÄ NA°ªÀÌ ÀÖÀ» °æ¿ì ³»°¡ ¸¸µç ÇÔ¼ö¸¦ ÅëÇØ »ê¼úÆò±ÕÀ¸·Î ³Ö¾îÁÖ¼¼¿ä. 
mean_cavin <- function(x){
  round(ifelse(is.na(x)==T, mean(x, na.rm = T), x))
}
mean_cavin(c)
c[is.na(c)] <- mean_cavin(c)
as.integer(c)

# [¹®Á¦199] sample ÇÔ¼ö¸¦ ÅëÇØ¼­ 1ºÎÅÍ 100±îÁöÀÇ ¼ýÀÚµé Áß¿¡ 60°³¸¸ ·£´ýÇÏ°Ô ÃßÃâÇØ¼­ matrix¸¦ »ý¼ºÇÏ¼¼¿ä. 
# ÇàÀº 6ÇàÀ¸·Î ¸¸µå¼¼¿ä.
# »ý¼ºÇÑ Çà·ÄÀÇ °ª Áß¿¡ 3Çà 2¿­¿¡ NA°ª, 5Çà 4¿­¿¡ NA°ªÀ¸·Î ¼öÁ¤ÇÏ¼¼¿ä. 
# 198¿¡¼­ ¸¸µç ÇÔ¼ö¸¦ ÀÌ¿ëÇØ¼­ NA°ªÀº ¿­À» ±âÁØÀ¸·Î ÇÏ´Â Æò±Õ°ªÀ¸·Î ¼öÁ¤ÇÏ¼¼¿ä. 
set.seed(0)
sample(c(1:100), 60)
set.seed(0)
mat <- matrix(sample(c(1:100), 60), nrow = 6)
mat[3,2] <- NA ; mat[5,4] <- NA

for (i in 1:ncol(mat)){
  mat[,i] <- mean_cavin(mat[,i])
}
mat

# [¹®Á¦200]A¹Ý B ¹ÝÀÇ ¼öÇÐÁ¡¼ö¸¦ ºñ±³ÇÏ¼¼¿ä.
'''
A¹Ý 35,55,60,70,100
B¹Ý 55,60,65,65,75
'''
a <- c(35,55,60,70,100)
b <- c(55,60,65,65,75)
mean(a)
mean(b)
sd(a)
sd(b)
## Æò±ÕÀº °°Áö¸¸, a¹Ý ÇÐ»ýµé °£ÀÇ ¼ºÀû ÆíÂ÷°¡ ½ÉÇÔ 

# [¹®Á¦201] ¼ºÀû.csv ÆÄÀÏ¿¡ °ú¸ñº° Æò±Õ°ª, ºÐ»ê°ª, Ç¥ÁØÆíÂ÷°ªÀ» ÇàÀ¸·Î Ãß°¡ÇÏ½Ã¿À.
grade <- read.csv("C://data/¼ºÀû.csv", stringsAsFactors = F, header = T)
head(grade)
with(grade, mean(sql))
with(grade, mean(r))
with(grade, var(sql))
with(grade, var(r))
with(grade, sd(sql))
with(grade, sd(r))
mean1 <- list("mean", with(grade, mean(sql)), with(grade, mean(r)))
var1 <- list("variance", with(grade, var(sql)), with(grade, var(r)))
sd1 <- list("st dev", with(grade, sd(sql)), with(grade, sd(r)))
grade_add <- rbind(grade, mean1, var1, sd1)
grade_add[,c("sql","r")] <- round(grade_add[,c("sql","r")]) ; grade_add

# [¹®Á¦202] carrickÀÇ sql=90Á¡°ú pogbaÀÇ r=90 µÑÁß ¾î´À »ç¶÷ÀÌ ´õ ÀßÇÑ °ÍÀÎ°¡?
orderBy(~-sql, grade[,c("name", "sql")])
orderBy(~-r, grade[,c("name", "r")])
## Pogba°¡ ´õ ÀßÇÔ(°ú¸ñ topÀÌ±â ¶§¹®)
head(grade)
grade$sql_st <- standardise(grade$sql)
grade$r_st <- standardise(grade$r)
grade[c(1,2),]

# Ç¥ÁØÁ¡¼ö(tÁ¡¼ö)
## Ç¥ÁØ°ª * 10 + 50 <- 10: Ç¥ÁØÆíÂ÷ // 50: Æò±Õ 

# [¹®Á¦203] Áö³­´ÞÀ» ±âÁØÀ¸·Î a »ç¿øÀº ¿µ¾÷ ¸ÅÃâÀÌ ¿ù Æò±Õ 1000¸¸¿ø, Ç¥ÁØÆíÂ÷°¡ 200¸¸¿øÀÎ  ´ë¸®Á¡À» ´ã´çÇÏ°íÀÖ°í,
# b »ç¿øÀº ¿µ¾÷ ¸ÅÃâÀÌ ¿ù Æò±Õ 100¸¸¿ø, Ç¥ÁØÆíÂ÷°¡ 10¸¸¿øÀÎ ´ë¸®Á¡À» ´ã´çÇÏ°í ÀÖ´Ù.
# ÀÌ¹ø´Þ a »ç¿øÀÌ ´ã´çÇÏ´Â ´ë¸®Á¡ÀÇ ¸ÅÃâÀÌ 1200¸¸¿øÀ¸·Î ´Ã¾ú°í, b »ç¿øÀÌ ´ã´çÇÏ´Â ´ë¸®Á¡Àº 120¸¸¿ø ´Ã¾ú´Ù.
# Æò±Õ ¸ÅÃâ ´ëºñ 20% »ó½ÂÇß´Ù. ´©°¡ ÀßÇÑ°ÅÁÒ?
a <- c(1000, 200)
b <- c(100, 10)
sale <- data.frame(mean = c(1000,100), sd = c(200, 10))
rownames(sale) <- c("a","b")
sale
standardise(sale)
c <- c(1200, 120)
sale <- cbind(sale, c)
colnames(sale)[3] <- "profit"
sale
(sale["a","profit"]-sale["a","mean"])/sale["a","sd"]
(sale["b","profit"]-sale["b","mean"])/sale["b","sd"]
## b°¡ ´õ ÀßÇÔ 

# [¹®Á¦204] ¼¼°÷ÀÇ Ã¤¼Ò³ó¿øÀ¸·ÎºÎÅÍ 10ÀÏ µ¿¾È ÃøÁ¤ÇÑ pphm ´ÜÀ§ÀÇ ¿ÀÁ¸ ³óµµ¸¦ º¸°í ¹Þ¾Ò´Ù. ¿ÀÁ¸ ³óµµ¸¦ ºÐ¼®ÇÏ¼¼¿ä.
gardens <- read.csv("C://data/gardens.csv")
head(gardens)
summary(gardens)

mean(gardens$gardenA)
mean(gardens$gardenB)
mean(gardens$gardenC)
sd(gardens$gardenA)
sd(gardens$gardenB)
sd(gardens$gardenC)

gardens2 <- standardise(gardens)

str(gardens)
gardens$days <- factor(paste0(c(1:10),"ÀÏ"), levels = c(paste0(c(1:10),"ÀÏ")))

boxplot(gardens[,c(1:3)], col = "red")

ggplot(gardens, aes(days, group = 1)) + 
  geom_line(aes(y = gardenA, colour = "red")) + 
  geom_line(aes(y = gardenB, colour = "green")) +
  geom_line(aes(y = gardenC, colour = "black")) +
  labs(x="ÀÏÀÚ", y="¿ÀÁ¸ ³óµµ", title="¼¼°÷ÀÇ ¿ÀÁ¸ ³óµµ ÇöÈ²") +
  theme(legend.title=element_blank()) +
  scale_color_manual(values=c("red", "green", "black"), labels = c("Ã¤¼Ò³ó¿øA","Ã¤¼Ò³ó¿øB","Ã¤¼Ò³ó¿øC"))
  
## Ã¤¼Ò³ó¿ø A´Â Æò±Õ ³óµµµµ °¡Àå ³·°í, ÀÏ°£ ÆíÂ÷µµ ÀÛÀ½
## Ã¤¼Ò³ó¿ø B´Â Æò±Õ ³óµµ°¡ ³ôÀº ÆíÀÎµ¥, ÀÏ°£ ÆíÂ÷°¡ ÀÛÀ½
## Ã¤¼Ò³ó¿ø C´Â Æò±Õ ³óµµµµ ³ô°í, ÀÏ°£ ÆíÂ÷µµ Å­
## Ã¤¼Ò³ó¿ø C¿¡¼­ ÀÛ¾÷ÇÒ ¶§´Â Æò±Õ ³óµµµµ ³ô°í, ÀÏ°£ ÆíÂ÷µµ ½ÉÇÏ´Ï, ÁÖÀÇ°¡ ÇÊ¿äÇÔ 

# [¹®Á¦205] RÀÇ Á¡¼öÀÔ´Ï´Ù. ¾Æ·¡¿Í °°Àº ¼ºÀû ºÐ·ùÇ¥¸¦ ÀÌ¿ëÇØ¼­ ÇÐ»ýµéÀÇ ÇÐÁ¡¿¡  °ú¶ô, °ú¶ô¾Æ´Ô ¿©ºÎ ÇöÈ² ÆÄ¾ÇÀ» ¸·´ë±×·¡ÇÁ·Î Ç¥ÇöÇÏ¼¼¿ä.
'''
¹üÁÖ   ºÐ·ù ±âÁØ     						   °ú¶ô¿©ºÎ
---   --------------------------------------------------------    -----------   
  A     Á¡¼ö > Æò±Õ + 1.5 * Ç¥ÁØÆíÂ÷		  		    °ú¶ô¾Æ´Ô
B     Æò±Õ + 0.5 * Ç¥ÁØÆíÂ÷ < Á¡¼ö <= Æò±Õ + 1.5 * Ç¥ÁØÆíÂ÷	    °ú¶ô¾Æ´Ô
C     Æò±Õ - 0.5 * Ç¥ÁØÆíÂ÷ < Á¡¼ö <= Æò±Õ + 0.5 * Ç¥ÁØÆíÂ÷	    °ú¶ô¾Æ´Ô
D     Æò±Õ - 1.5 * Ç¥ÁØÆíÂ÷ < Á¡¼ö <= Æò±Õ - 0.5 * Ç¥ÁØÆíÂ÷	    °ú¶ô
F     Á¡¼ö <= Æò±Õ - 1.5 * Ç¥ÁØÆíÂ÷			            °ú¶ô
'''
rscore <- read.csv("C://data/rÁ¡¼ö.csv", stringsAsFactors = F, header = F)
head(rscore)
colnames(rscore) <- "score"
str(rscore)
rmean <- mean(rscore$score)
rsd <- sd(rscore$score)
rub <- rmean + 1.5*rsd
rub_h <- rmean + 0.5*rsd
rlb_h <- rmean - 0.5*rsd
rlb <- rmean - 1.5*rsd

rscore$"ºÐ·ù" <- ifelse(rscore$score > rub, "A",
                       ifelse(rscore$score > rub_h & rscore$score <= rub, "B",
                              ifelse(rscore$score > rlb_h & rscore$score <= rub_h, "C",
                                     ifelse(rscore$score > rlb & rscore$score <= rlb_h, "D", "F"))))
rscore$"°ú¶ô¿©ºÎ" <- ifelse(rscore$`ºÐ·ù` %in% c("A","B","C"), "°ú¶ô¾Æ´Ô", "°ú¶ô")
rscore

table(rscore$ºÐ·ù)
bp <- barplot(table(rscore$ºÐ·ù), ylim=c(0,30), col = c("skyblue","skyblue","skyblue","pink","pink")) ; bp
text(x=bp ,y=table(rscore$ºÐ·ù),labels=c("°ú¶ô¾Æ´Ô","°ú¶ô¾Æ´Ô","°ú¶ô¾Æ´Ô","°ú¶ô","°ú¶ô"),pos=3)
legend("topright", c("°ú¶ô¾Æ´Ô - 35¸í", "°ú¶ô - 15¸í"), fill = c("skyblue","pink"))

table(rscore$°ú¶ô¿©ºÎ)
barplot(table(rscore$°ú¶ô¿©ºÎ), ylim=c(0,40))
text(x=barplot(table(rscore$°ú¶ô¿©ºÎ), ylim=c(0,40)),y=table(rscore$°ú¶ô¿©ºÎ),labels=table(rscore$°ú¶ô¿©ºÎ),pos=3) 

## Another solution
### cut() »ç¿ë! 
### ifelse()º¸´Ù ´õ ³ªÀ½! 
avg <- mean(rscore[,1])
std <- sd(rscore[,1])
breaks <- c(0, avg-1.5*std, avg-.5*std, avg+.5*std, avg+1.5*std, 100)
lab <- c("F","D","C","B","A")
r_cut <- cut(rscore[,1], breaks=breaks, right=T, labels=lab)
r_spec <- as.data.frame(table(r_cut))
names(r_spec) <- c("¹üÁÖ","ºóµµ¼ö")
r_spec <- r_spec[sort(r_spec$¹üÁÖ, decreasing = T),]
r_spec <- cbind(r_spec, °ú¶ô¿©ºÎ = ifelse(r_spec$¹üÁÖ %in% c("A","B","C"), "°ú¶ô¾Æ´Ô","°ú¶ô"))
r_spec

# [¹®Á¦206] survey_new.csv µ¥ÀÌÅÍ¸¦ ¾Æ·¡¿Í °°ÀÌ »ý¼ºÇÏ¼¼¿ä.
'''
          ¸¸Á·  º¸Åë ºÒ¸¸Á· ÇàÀÇÇÕ ÇÑ°èÈ®·ü
³²        2.0  1.0    1.0      4      0.4
¿©        0.0  4.0    2.0      6      0.6
¿­ÀÇÇÕ    2.0  5.0    3.0     10      1.0
ÇÑ°èÈ®·ü  0.2  0.5    0.3      1      0.1
'''
survey_new <- read.csv("C://data/survey_new.csv", header = F)
survey_new
survey_table <- table(survey_new)
survey_row <- rowSums(survey_table)
survey_col <- colSums(survey_table)
survey2 <- rbind(survey_table, survey_col)
survey3 <- cbind(survey2, c(survey_row,sum(colSums(survey_table))))
survey3
rownames(survey3) <- c("³²","¿©","¿­ÀÇÇÕ")
colnames(survey3) <- c("¸¸Á·","º¸Åë","ºÒ¸¸Á·","ÇàÀÇÇÕ")
survey3[3,4]
a <- survey3[,4]/survey3[3,4]
b <- survey3[3,]/survey3[3,4]
survey4 <- rbind(survey3, b)
survey5 <- cbind(survey4, c(a,1/colSums(survey_table)))
survey_final <- round(survey5,1)
rownames(survey_final) <- c("³²","¿©","¿­ÀÇÇÕ", "ÇÑ°èÈ®·ü")
colnames(survey_final) <- c("¸¸Á·","º¸Åë","ºÒ¸¸Á·","ÇàÀÇÇÕ", "ÇÑ°èÈ®·ü")
survey_final

# [¹®Á¦206-1] 3¸í Áß ´ëÇ¥ 2¸íÀ» ¼±ÃâÇÏ¿© ¹ÝÀå, ºÎ¹ÝÀåÀ¸·Î ÀÓ¸íÇÒ ¼ö ÀÖ´Â °æ¿ìÀÇ ¼ö? 
perm <- function(n, r){
  return(factorial(n)/factorial(n - r))
}
perm(3,2)

# [¹®Á¦206-2] 3¸í Áß °øµ¿´ëÇ¥ 2¸íÀ» ¼±ÃâÇÏ´Â °æ¿ìÀÇ ¼ö? 
comb <- function(n, r){
  return(factorial(n)/(factorial(r)*factorial(n - r)))
}
comb(3,2)

# [¹®Á¦ 207] ÁÖ»çÀ§ 1°³¸¦ ´øÁ³À» ¶§ A¸¦ 4ÀÌÇÏÀÇ ´«ÀÌ ³ª¿À´Â »ç°Ç,
# B¸¦ Â¦¼öÀÇ ´«ÀÌ ³ª¿À´Â »ç°ÇÀÌ¶ó°í ÇÒ ¶§ 
# »ç°ÇA°¡ ÀÏ¾î³¯ È®·ü?
# »ç°ÇB°¡ ÀÏ¾î³¯ È®·ü?
a <- 1-(1/3)
b <- 1/2
  
# [¹®Á¦ 208] ÁÖ»çÀ§ 1°³¸¦ ´øÁ³À» ¶§ A¸¦ 4ÀÌÇÏÀÇ ´«ÀÌ ³ª¿À´Â »ç°Ç,
# B¸¦ Â¦¼öÀÇ ´«ÀÌ ³ª¿À´Â »ç°ÇÀÌ¶ó°í ÇÒ ¶§ »ç°ÇA¿Í »ç°ÇB°¡ µ¿½Ã¿¡ ÀÏ¾î³¯ È®·üÀº? <- °áÇÕÈ®·ü
a*b
  
# [¹®Á¦ 209] ÁÖ»çÀ§ 1°³¸¦ ´øÁ³À» ¶§ A¸¦ 4 ÀÌÇÏÀÇ ´«ÀÌ ³ª¿À´Â »ç°Ç, B¸¦ Â¦¼öÀÇ ´«ÀÌ ³ª¿À´Â »ç°ÇÀÌ¶ó°í ÇÒ¶§, 
# »ç°Ç A°¡ ÀÏ¾î³µÀ» ¶§ B´Â Â¦¼öÀÇ ´«ÀÌ ³ª¿À´Â »ç°ÇÀÇ È®·üÀº? <- Á¶°ÇºÎÈ®·ü 
a*b/a
a*b/b ### P(A|B)

# [¹®Á¦ 210]  ³²¼ºÀÌ¶ó´Â ÀüÁ¦ Á¶°ÇÇÏ¿¡ ¾È°æÀ» ¾´ È®·üÀº?
## Á¶°ÇºÎÈ®·üÀÏ ¶§, Ç¥º»°ø°£(½ÃÇàÀÇ ÇÕ)°ú ÀÏ¾î³¯ È®·ü(Ç¥º»°ø°£ÀÇ ºÎºÐÁýÇÕ) 
'''
  ¾È°æ(O)		¾È°æ(X)
--------------------------------
  ³²	  5 		  6
  ¿©	  6		    4
'''
5/11

# [¹®Á¦211] 20´ë ³²¼ºÀÌ¸é¼­ Á÷¾÷Àº ITÀÌ°í °áÈ¥ÇÏÁö ¾Ê°í ÀÌ¼ºÄ£±¸´Â ÀÖ´Â »ç¶÷ÀÇ ¿µÈ­ Àå¸£´Â?
## predict()¿¡ ÇØ´ç °ª¸¸ Áý¾î³ÖÀ¸¸é µÊ!!

# Naive Bayes ¸Þ¼Òµå 
install.packages("e1071")
library(e1071)

movie <- read.csv("C://data/movie.csv", header = T)
head(movie)
str(movie)

## 1. naiveBayes(»çÀüÈ®·ü(ºÐ¸ð), )
### laplace=0 ÃßÁ¤±â <- È®·ü°ªÀÌ 0ÀÌ µÇ´Â °ÍÀ» ¹æÁö 
### ¸Þ¼Òµå°¡ ¾Ë¾Æ¼­ ºÐ·ùÇØÁÜ! 
model <- naiveBayes(movie[1:5], movie$Àå¸£, laplace=0) 
model

## 2. predict() <- Àß ºÐ·ùµÇ¾ú´Â Áö È®ÀÎ
male <- data.frame(³ªÀÌ="20´ë", ¼ºº°="³²", Á÷¾÷="IT", °áÈ¥¿©ºÎ="NO", ÀÌ¼ºÄ£±¸="YES")
result <- predict(model, male)
result

# [¹®Á¦212] spam.csv ³ªÀÌºêº£ÀÌÁî¸¦ ÀÌ¿ëÇØ¼­ ºÐ·ù¸¦ ÇØº¸¼¼¿ä.
spam <- read.csv("C://data/spam.csv", header = T)
head(spam)
spam[is.na(spam)] <- 0

## 1. naiveBayes(»çÀüÈ®·ü(ºÐ¸ð), )
model <- naiveBayes(spam[2:13], spam$¸ÞÀÏÁ¾·ù, laplace=0) 
model

## 2. predict() <- Àß ºÐ·ùµÇ¾ú´Â Áö È®ÀÎ
result <- predict(model, spam[2:13])
result

CrossTable(x = result, y = spam$¸ÞÀÏÁ¾·ù, prop.chisq=FALSE)

# [¹®Á¦213] ÀÏ¹Ý¹ö¼¸(½Ä¿ë¹ö¼¸(edible)) °ú µ¶¹ö¼¸ ºÐ·ù(¸ÔÀ»¼ö¾ø´Â¹ö¼¸(poisonous)) ºÐ·ù 
# ÀÌ ÁÖ¼Ò¿¡ °¡¼Å¼­ mushroom µ¥ÀÌÅÍ ¼ÂÀÇ Á¤º¸¸¦ ºÐ¼®ÇÑ ÈÄ º¯¼öµé¿¡ ¾î¶² ÀÇ¹Ì°¡ µé¾î ÀÖ´ÂÁö¸¦ È®ÀÎ ÇÏ¼¼¿ä.
# https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data
# https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.names <- ÄÃ·³µé¿¡ ´ëÇÑ Á¤º¸ 
mushroom <- read.csv("C://data/mushroom.csv", header = F)
mushroom2 <- read.csv("C://data/mushroom.csv", stringsAsFactors = F, header = F)
tail(mushroom2,20)
colnames(mushroom)[1] <- c("class")
colnames(mushroom2)[1] <- c("class")
mushroom2[mushroom=="?"] <- 0

## 1. naiveBayes(»çÀüÈ®·ü(ºÐ¸ð), )
model <- naiveBayes(mushroom2[2:23], mushroom$class, laplace=0) 
model

## 2. predict() <- Àß ºÐ·ùµÇ¾ú´Â Áö È®ÀÎ
### e: edible // p: poisonous 
result <- predict(model, mushroom2[2:23])
result

CrossTable(x = result, y = mushroom$class, prop.chisq=FALSE)

## Another Solution  
## 0. ÀÌ ÁÖ¼Ò¿¡ °¡¼Å¼­ mushroom µ¥ÀÌÅÍ ¼ÂÀÇ Á¤º¸¸¦ ºÐ¼®ÇÑ ÈÄ º¯¼öµé¿¡ ¾î¶² ÀÇ¹Ì°¡ µé¾î ÀÖ´ÂÁö¸¦ È®ÀÎ ÇÏ¼¼¿ä.
## https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.names

## 1. ¹ö¼¸ µ¥ÀÌÅÍ¸¦ ·Îµå ÇÑ´Ù.
mushroom <- read.csv("c:/data/mushroom_new.csv", header=F, stringsAsFactors=F)
str(mushroom)

## 2. 12¹øÂ° ¿­¿¡ ? Ç¥½ÃÀÇ µ¥ÀÌÅÍÀÖ´ÂÁö¸¦ È®ÀÎÇÑ ÈÄ ÀÖÀ¸¸é  NA ·Î º¯°æÇÏ¼¼¿ä.
length(mushroom[which(mushroom$V12=='?'), 12])
mushroom[which(mushroom$V12=='?'), 12] <- NA 
grep('[[:punct:]]',mushroom$V12,value=T ) # ? 
length(mushroom$V12[is.na(mushroom$V12)]) # º¯°æ È®ÀÎ

## 3. mushroom ÀüÃ¼ µ¥ÀÌÅÍ¸¦ factor ·Î º¯È¯ÇÏ¼¼¿ä.
dim(mushroom)
for ( i in 1:23) {
  mushroom[,i] <- factor(mushroom[,i])  
}
str(mushroom)

## 4. mushroom µ¥ÀÌÅÍ¸¦ ÈÆ·Ã µ¥ÀÌÅÍ¿Í Å×½ºÆ® µ¥ÀÌÅÍ·Î ³ª´«´Ù ( 75% ´Â ÈÆ·Ã µ¥ÀÌÅÍ, 25% ´Â Å×½ºÆ® µ¥ÀÌÅÍ)
table(mushroom$V1)
'''
e    p 
4208 3916 
'''
train_cnt <- round(0.75*dim(mushroom)[1]) # 6093
train_index <- sample(1:dim(mushroom)[1],train_cnt, replace=F)

mushroom_train <- mushroom[train_index,] 
mushroom_test  <- mushroom[-train_index,]

NROW(mushroom_train) # 6093
NROW(mushroom_test) # 2031

table(mushroom_train$V1)
'''
e    p 
3158 2935 
'''
table(mushroom_test$V1)
'''
e    p 
1050  981 
'''

## 5. ÁöµµÇÐ½À ¸Ó½Å·¯´× ³ªÀÌºê º£ÀÌÁî¸¦ ÀÌ¿ëÇÏ¿© µ¶¹ö¼¸°ú ÀÏ¹Ý ¹ö¼¸À» ºÐ·ùÇÏ´Â ¸ðµ¨À» »ý¼ºÇÑ´Ù.
library(e1071)
model1 <- naiveBayes(mushroom_train[,-1],mushroom_train[,1])
model1

## 6. À§¿¡¼­ ¸¸µç ¸ðµ¨·Î Å×½ºÆ® µ¥ÀÌÅÍ¸¦ °¡Áö°í  µ¶¹ö¼¸ÀÎÁö ÀÏ¹Ý¹ö¼¸ÀÎÁö¸¦ ¿¹ÃøÇØº»´Ù.
result1 <- predict(model1, mushroom_test[ ,-1] )
library(data.table)
data.table( mushroom_test[ , 1], result1)

## 7. ÀÌ¿ø±³Â÷Ç¥·Î ¸ðµ¨°ú ½ÇÁ¦ µ¥ÀÌÅÍÀÇ Â÷ÀÌ¸¦ ºñ±³ÇÑ´Ù.
library(gmodels)
CrossTable(result1, mushroom_test[ , 1] )

## 8. ¶óÇÃ¶ó½º °ª 0.1 ¼³Á¤ÇÑ ÈÄ ¸ðµ¨À» ¸¸µçÈÄ È®ÀÎÇÏ¼¼¿ä.
model2 <- naiveBayes(mushroom_train[,-1],mushroom_train[,1], laplace=0.2)
result2 <- predict(model2, mushroom_test[ ,-1] )
CrossTable(result2, mushroom_test[ , 1] )
