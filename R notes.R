# R
## ´ºÁú·£µå ¿ÀÅ¬·£µå ´ëÇĞ ross lhaka, robert clifford gentleman
## 1995³â¿¡ °³¹ßÇÑ ¼ÒÇÁÆ®¿ş¾îÀÌ°í µ¥ÀÌÅÍ ºĞ¼®À» À§ÇÑ Åë°è ¹× ±×·¡ÇÈ½º¸¦ Áö¿øÇÏ´Â ¹«·á ¼ÒÇÁÆ®¿ş¾îÀÌ´Ù. <- »ó¿ë ÇÃ·§Æû! ¸¹Àº ±â¾÷µéÀÌ R·Î ÀüÈ¯!

# RÀ» »ç¿ëÇØ¾ß ÇÏ´Â ÀÌÀ¯
## 1. RÀº free
## 2. µ¥ÀÌÅÍ ºĞ¼®À» À§ÇØ¼­ °¡Àå ¸¹ÀÌ ¾²´Â Åë°è ÇÃ·§ÆûÀÌ´Ù.
## 3. º¹ÀâÇÑ µ¥ÀÌÅÍ¸¦ ´Ù¾çÇÑ ±×·¡ÇÁ·Î Ç¥ÇöÇÒ ¼ö°¡ ÀÖ´Ù. <- Visualisation
## 4. ºĞ¼®À» À§ÇÑ µ¥ÀÌÅÍ¸¦ ½±°Ô ÀúÀåÇÏ°í Á¶ÀÛÇÒ ¼ö ÀÖ´Ù. <- º¯¼ö Ã³¸® ¿ëÀÌ(scalar µ¥ÀÌÅÍ Å¸ÀÔ, ·¹ÄÚµå, ¹è¿­) <- c(), data.frame()
## 5. ´©±¸µçÁö À¯¿ëÇÑ ÆĞÅ°Áö¸¦ »ı¼ºÇØ¼­ °øÀ¯ÇÒ ¼ö ÀÖ°í, »õ·Î¿î ±â´É¿¡ ´ëÇÑ Àü´ŞÀÌ ºü¸£´Ù. <- R Developer
## 6. ¾î¶°ÇÑ OS¿¡¼­ ¼³Ä¡°¡ °¡´ÉÇÏ´Ù. 



# 07/23/2018

# º¯¼ö <- µ¥ÀÌÅÍ ÀúÀå
## - º¯¼ö ÀÌ¸§Àº ¾ËÆÄºª, ¼ıÀÚ, _, .(¸¶Ä§Ç¥) »ç¿ëÇÑ´Ù. (Æ¯¼ö¹®ÀÚ´Â _, . ÀÌ°Í 2°³¸¸!)
## - º¯¼ö ÀÌ¸§ÀÇ Ã¹ ±ÛÀÚ´Â ¾ËÆÄºª, .(¸¶Ä§Ç¥)·Î ½ÃÀÛÇÒ ¼ö ÀÖ´Ù.
## - .(¸¶Ä§Ç¥)·Î ½ÃÀÛÇÒ °æ¿ì¿¡´Â ¹Ù·Î µÚ¿¡ ¼ıÀÚ¸¦ ÀÔ·ÂÇÒ ¼ö ¾ø´Ù. 

## ex) º¯¼ö ÀÌ¸§À¸·Î °¡´É -> a, i, x2, .y
## cf) º¯¼ö ÀÌ¸§À¸·Î ºÒ°¡´É -> 1a, .2, k-j

# º¯¼ö¿¡ °ª ÇÒ´ç¿¬»êÀÚ(<-, <<-, =)
## µÇµµ·ÏÀÌ¸é "<-" ÀÌ°Å ¾²´Â °Ô ³ªÀ½!(global variable)
x <- 1 
## R¿¡¼­´Â µ¥ÀÌÅÍ Å¸ÀÔ µû·Î Ç¥Çö ¾È ÇÔ!(°ª¿¡ µû¶ó ÀÚµ¿À¸·Î ¼³Á¤)
## "<-": ÇÒ´ç ¿¬»êÀÚ, ´ëÀÔ ¿¬»ê(ÀÌ º¯¼ö¿¡ ÇØ´ç °ªÀ» ³Ö°Ú´Ù´Â ¶æ!)

x
print(x)

y <<- 2 
### "<<-"
y
print(y)

z = 3 
### "="
z
print(z)

x + y + z

# "<-": global variable
## ÇÔ¼ö ¹Ù±ù¿¡ ÀÖ´Â º¯¼ö¿¡ »õ·Î¿î °ª ÇÒ´ç
## ÇÔ¼ö ¼öÇàÇÏ¸é º¯¼ö ³»ÀÇ °ª ÀÚÃ¼°¡ ¹Ù²ñ 
## plsqlÀÇ bind variableÀÇ ±â´É
sum(x <- c(1,2,3,4,5)) 
### 1Â÷¿ø ¹è¿­!(plsqlº¸´Ù ÈÎ¾À ½¬¿ò)
### x¿¡ ÇÒ´çµÈ °ªÀÌ ¹Ù²î¾úÀ½!
### sum() <- ¹è¿­ ¾È¿¡ ÀÖ´Â °ªµéÀ» ÇÕÇØÁÖ´Â ±â´É ¼öÇà(±×·ìÇÔ¼ö)
x

# "=": local variable
## ÇÔ¼ö ¾È¿¡¼­¸¸ °ªÀÌ Åë¿ë 
sum(y = c(1,2,3,4,5)) 
### y¿¡ ¹è¿­ ÀÔ·Â
### BUT y º¯¼ö ³»ÀÇ °ªÀº ¾È ¹Ù²î¾úÀ½!(Àü¿ªº¯¼ö vs. Áö¿ªº¯¼ö)
y

sum(f100 = c(1,2,3,4,5)) 
### ÇÔ¼ö´Â ¼öÇàµÊ
### BUT d º¯¼ö°¡ µû·Î »ı¼ºµÇÁö´Â ¾ÊÀ½ 
### local variable
f100

sum(f100 <- c(1,2,3,4,5)) 
### ÀÌ °æ¿ì¿¡´Â º¯¼ö°¡ ¸¸µé¾îÁü!
### global variable
f100

## ÇÔ¼ö ¾È ¾µ ¶§´Â "<-", "=" µÑ ´Ù ¶È°°Áö¸¸, ÇÔ¼ö¸¦ Á¦ÀÛ, ÀÌ¿ëÇÏ°Ô µÉ ¶§´Â µÎ ¿¬»êÀÚ¸¦ ±¸ºĞÇØ¼­ Ç¥ÇöÇØ¾ß ÇÔ! 



# ¼ıÀÚ(Á¤¼ö(integer), ½Ç¼ö(numeric))
## ½Ç¼ö(numeric): ºÎµ¿ ¼Ò¼öÁ¡ Ç¥Çö 
x <- 2
print(x)
class(x)
### º¯¼ö ¾È¿¡ µé¾î ÀÖ´Â °ªÀÇ Å¸ÀÔ È®ÀÎ °¡´É
### numeric: ½Ç¼ö cf. integer: Á¤¼ö
### R¿¡¼­´Â ¼ıÀÚ¸¦ Ç¥ÇöÇÏ¸é ±âº»ÀûÀ¸·Î ½Ç¼ö·Î ÀÎ½Ä!

### RÀº ´ë¼Ò¹®ÀÚ ±¸ºĞ!
### ¼ıÀÚ µÚ¿¡ LÀ» Áı¾î ³ÖÀ¸¸é Á¤¼ö·Î ÀúÀå!(reserved word)
y <- 2L 
print(y)
class(y) 
### integer!

### numeric + integer = numeric
z <- x + y
print(z)
class(z) 

str(z) 
### structure ÇÔ¼ö -> class()¿Í ±â´É ºñ½Á
### Å¸ÀÔ°ú °ªÀ» °°ÀÌ Ç¥Çö(num 4)

### boolean function -> ½Ç¼öÀÎÁö ¾Æ´ÑÁö true/false·Î Ç¥Çö!
is.numeric(z) 
is.integer(y)
is.integer(x)



# ¹®ÀÚ¿­ 
## ''¸¦ ½áµµ µÇ°í, ""¸¦ ½áµµ µÊ!
s1 <- 'hello'
s1
class(s1)
### character

s2 <- "¾È³çÇÏ¼¼¿ä"
s2
class(s2)

### character¸é true, ¾Æ´Ï¸é false
is.character(s1)
is.character(s2)



# Boolean Çü½Ä <- Áø¸®°ª Ç¥Çö <- TRUE/FALSE ´ë¼Ò¹®ÀÚ ±¸ºĞ!
## AND: &
## OR: |

## TRUE & TRUE -> TRUE
## TRUE & FALSE -> FALSE

## TRUE | TRUE -> TRUE
## TRUE | FALSE -> TRUE

# ÇÑ ±ÛÀÚ¸¸ ¾µ ¶§´Â ÇØ´ç ±ÛÀÚ¿¡ º¯¼ö°¡ µû·Î ¼³Á¤µÇ¾î ÀÖ´Â Áö ¸ÕÀú È®ÀÎ!
## T & T
## T & F
## T | T
## T | F

### º¯¼ö°¡ ´õ ¿ì¼±¼øÀ§°¡ ´õ ³ôÀ½!
T <- TRUE 
T
F <- FALSE
F

class(T) ### logical

### z´Â boolean Çü½ÄÀÇ º¯¼ö°¡ ¾Æ´Ô => FALSE
is.logical(T)
is.logical(F)
is.logical(z) 



# NA(Not Available) : °áÃø°ª(°áÃøÄ¡), µ¥ÀÌÅÍ ÀÔ·Â Áß ½Ç¼ö·Î °ªÀÌ ÀÔ·ÂµÇÁö ¾ÊÀº °æ¿ì 
a <- 100; b <- 90; c <- NA; 
### ÇÑ ÁÙ¿¡ ¿©·¯ º¯¼ö ÀÔ·ÂÇÏ°í ½ÍÀ¸¸é ; »ç¿ë!

a
b
c

### NA°¡ ³ª¿È!(°áÃø°ªÀÌ ÀÖ¾î¼­, °è»êÇÒ ¶§ NullÃ³·³ ³ª¿È!)
a + b + c 

### º¯¼ö c¿¡ NA°¡ ÀÖ´Â ÁöÀÇ ¿©ºÎ
is.na(c)  
is.na(a)

## cf. NULL: º¯¼ö¿¡ ÃÊ±âÈ­µÇÁö ¾ÊÀ»¶§ »ç¿ë, undefined°ªÀ» Ç¥Çö 
## NULLÀº °áÃøµÈ °Ô ¾Æ´Ï¶ó ±×Àú º¯¼ö ¾È¿¡ °ªÀÌ ¾È µé¾î°£ °Í »Ó!
## º¯¼ö ¼±¾ğ¸¸ ÇÏ°í °ªÀº ¾È ³ÖÀº °Å!
## PLSQL¿¡¼­´Â º¯¼ö ¼±¾ğ¸¸ ÇÏ¸é ÀÚµ¿À¸·Î NULLÀÌ µé¾î°¡Áö¸¸, R¿¡¼­´Â NA°¡ PLSQLÀÇ NULLÀÇ ±â´ÉÀ» »ç¿ë! 
## R¿¡¼­´Â Å¸ÀÔÀ» ¾²Áö ¾Ê±â ¶§¹®¿¡ º¯¼ö¿¡ NULLÀÌ¶óµµ ³Ö¾î³ö¾ß ÇÔ!(NA´Â ¾Æ¿¹ ÁøÂ¥ ¸ğ¸£°Ú´Â °æ¿ì)
## NULL <- º¯¼ö¿¡ ¾î´À Å¸ÀÔÀÇ °ªÀÌ µé¾î°¥ Áö´Â ¸ğ¸£°ÚÁö¸¸, º¯¼ö¸¸ ¸¸µé¾î ³õ°í ½ÍÀº °æ¿ì 
## µÇµµ·ÏÀÌ¸é NA·Î ³ÖÁö ¸»°í NULL·Î ³ÖÀ» °Í!(NA°ªÀÌ ÀÖÀ» °æ¿ì ´Ù¸¥ °ªÀ¸·Î ´ëÃ¼ÇÏ´Â ±â´ÉÀ» °¡Áø ÇÔ¼ö »ç¿ë)
x <- NULL
is.null(x)
is.na(x) 
### logical(0)
### NA¿Í´Â ´Ù¸§!

y <- 100
x + y 
### numeric(0)
### NA¿Í´Â ´Ù¸§!

z <- NA
z + y 
### NA
### NULL°ú´Â ´Ù¸§!



1 + 2
100 - 99
99 - 100
2 * 3
100 / 2
100 / 3

100 %/% 3 
### ¸ò¸¸ ²ôÁı¾î³¿ 
100 %% 3 
### ³ª¸ÓÁö¸¸ º½(SQLÀÇ mode ÇÔ¼öÀÇ ±â´É)

10 ^ 2 
### °ÅµìÁ¦°ö(SQLÀÇ power ÇÔ¼öÀÇ ±â´É)
10 ** 2 
### À§¿Í ¶È°°À½ 



# ºñ±³ ¿¬»êÀÚ
10 > 5 
### TRUE
10 < 5 
### FALSE
10 >= 5
10 <= 5
10 == 5 
### == ÀÌ·¸°Ô 2°³ ¿¬¼ÓÇØ¼­ ½á¾ß ÇÔ!
10 != 5

## ¿¬°á ¿¬»êÀÚ¿Í °°ÀÌ ¾µ ¶§´Â °ıÈ£µµ ÀûÀıÇÏ°Ô »ç¿ëÇÒ °Í!
10 > 9 & 10 >= 10 
10 < 9 | 10 >= 10
### ¿¬°á ¿¬»êÀÚ¿Í °°ÀÌ »ç¿ë 



# ¼ıÀÚ(Áö¼öÇ¥±â¹ı) 
1e2 
### 1 * 10^2
5e-1

5e-2
100000 
### 10¸¸ ´ÜÀ§´Â Áö¼öÇüÀ¸·Î ¹Ù²ñ => ¼ıÀÚ¸¦ Âß ³ª¿­ÇÏ´Â °Íº¸´Ù Áö¼ö Çü½ÄÀÌ ´õ ÆíÇÔ!
10**5 
### Áö¼öÇüÀ¸·Î º¯È¯!



# ÀÚ·áÇü
## 1. vector: °°Àº µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 1Â÷¿ø ¹è¿­ 
## 2. list: ¼­·Î ´Ù¸¥ µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 1Â÷¿ø ¹è¿­, ÁßÃ¸ °¡´É 
## 3. matrix: °°Àº µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 2Â÷¿ø ¹è¿­ 
## 4. array: °°Àº µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 3Â÷¿ø ¹è¿­ 
## 5. factor: ¸ñ·Ï, ¹üÁÖÇü µ¥ÀÌÅÍ 
## 6. data.frame: ¼­·Î ´Ù¸¥ µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â ÄÃ·³À¸·Î ÀÌ·ç¾îÁø 2Â÷¿ø ¹è¿­ 
## 7. table: data.frame µ¿ÀÏÇÑ ±¸Á¶¸¦ °®´Âµ¥ ¼Óµµ°¡ ºü¸£´Ù. 



# 1. vector(º¤ÅÍ) <- 1Â÷¿ø ¹è¿­!
## - °°Àº µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 1Â÷¿ø ¹è¿­ ±¸Á¶(RÀÇ ±âº» µ¥ÀÌÅÍ ±¸Á¶)
## - c(): combine value
## - º¤ÅÍ´Â ÁßÃ¸ ºÒ°¡´ÉÇÏ´Ù.
## - º¤ÅÍ´Â ´ÜÀÏ µ¥ÀÌÅÍ Å¸ÀÔ °¡´É
## - µ¥ÀÌÅÍ º¯È¯ ±ÔÄ¢: integer < double < character

x <- c(1,2,3,4,5)
x
mode(x)
class(x)
str(x) 
### ´ë°ıÈ£ <- º¤ÅÍÀÇ ¹üÀ§
### ÇØ´ç º¤ÅÍ¿¡¼­ ¾î´À µ¥ÀÌÅÍ¸¦ »ÌÀ¸·Á°í ÇÒ ¶§ ÀÌ ¹üÀ§ ÀÌ¿ë!

x <- c(1,2,3,4,'5')
x
mode(x) 
### ÇÏ³ª¸¸ ¹®ÀÚÇüÀ¸·Î ¹Ù²åÀ» »ÓÀÎµ¥, º¤ÅÍ ÀÚÃ¼°¡ characterÇüÀ¸·Î ¹Ù²ñ!(integer < double < character)
### º¤ÅÍ´Â ´ÜÀÏ µ¥ÀÌÅÍ Å¸ÀÔ¸¸ °¡´É!
class(x)
str(x) 

x <- c(1,2,3.14,4,5)
x
mode(x) 
### numericÀ¸·Î ¹Ù²ñ!(integerº¸´Ù´Â doubleÀÌ ¿ì¼± ¼øÀ§°¡ ´õ ³ôÀ½)
class(x)
str(x)

x <- c(1,2,3,c(4,5))
x 
### º¤ÅÍ ¾È¿¡ º¤ÅÍ¸¦ ¸¸µé¸é ±×³É Ç®¾î¹ö¸²!
mode(x)
class(x)
str(x)

s1 <- c('¼­¿ï','´ë±¸','±¤ÁÖ','ºÎ»ê')
s1
mode(s1)
class(s1)
str(s1) 



# ¼¿ ÀÌ¸§ 
x <- c(1,2,3,sum=c(4,5)) 
### sum ÇÔ¼ö°¡ ¾Æ´Ï¶ó, ÀÌ¸§¸¸ sumÀÎ °Å!
y <- c(1,2,3,sum(c(4,5)))
x 
### ÄÃ·³¸íÀ¸·Î ¼³Á¤µÊ
y 
### 4¹øÂ° À§Ä¡¿¡ ´õÇÑ °ªÀ¸·Î ÀÔ·Â

x <- c('±¹¾î'=90, '¼öÇĞ'=95, '¿µ¾î'=80) 
### ¼¿ ÀÌ¸§°ú °ªÀ» ÇÔ²² ¼³Á¤ 
### 1Â÷¿ø ¹è¿­ ¾È¿¡µµ ÀÌ·¸°Ô ¼¿ ÀÌ¸§(ÄÃ·³ ÀÌ¸§)µµ ÇÔ²² Ç¥Çö °¡´É!
x

z <- c('°ú¸ñ'=c(80,90,96)) 
### 3°³ÀÇ °ª¿¡ ÇÏ³ªÀÇ ÄÃ·³¸í ¼³Á¤ => °ú¸ñ1, °ú¸ñ2, °ú¸ñ3 ÀÌ·± ½ÄÀ¸·Î Ç¥ÇöµÊ
z

# names(): º¤ÅÍÀÇ °¢ ¼¿¿¡ ÀÌ¸§À» ¼³Á¤ 
## ¼¿ ÀÌ¸§ º¯°æ 
names(z) <- c('±¹¾î', '¿µ¾î', '¼öÇĞ') 
### ÄÃ·³¸íÀ» ¼¿ÀÇ °³¼ö¸¸Å­ Ç¥Çö 
z ### ÄÃ·³¸íÀÌ º¯°æµÆÀ½!

# ¼¿ ÀÌ¸§ »èÁ¦ <- NULL »ç¿ë!
names(z) <- NULL
z ### ÄÃ·³¸íÀÌ ¸ğµÎ ¾ø¾îÁü!

## cf. NA·Î ÇÒ °æ¿ì
names(z) <- NA
z 
### ÄÃ·³¸íÀÌ ¾Æ¿¹ ¾ø¾îÁöÁö ¾Ê°í, NA·Î ³²À½!

y <- c(1,2,3,4,5)
y
names(y) <- c('ÇÏ³ª','µÑ','¼Â','³İ','´Ù¼¸')
y



# º¤ÅÍÀÇ ±æÀÌ <- length(), NROW()
## º¤ÅÍ ¾È¿¡ µé¾î ÀÖ´Â °ªÀÇ °³¼ö Ç¥Çö(SQLÀÇ count ÇÔ¼öÀÇ ±â´É ¼öÇà)
length(y)
NROW(y) 
### À§¿Í °°Àº °á°ú 



# ¹è¿­ÀÇ ¿ø¼Ò Á¶ÀÛ <- PLSQL¿¡¼­´Â ¿ä¼Ò ¹øÈ£ °¡Áö°í Á¶ÀÛÇßÀ½(prior, next ...)
## RÀº PLSQLÀÇ nested ¹è¿­ Å¸ÀÔ°ú ºñ½Á(1¹øºÎÅÍ ½ÃÀÛ)
## ÀÎµ¦½º ¹øÈ£ or ¼¿ ÀÌ¸§ <- ÀÌ µÎ °¡ÁöÀÇ ¹æ¹ıÀ» °¡Áö°í ¿ä¼Ò°ªÀ» Ã£¾Æ³¿!

# º¤ÅÍÀÇ ¿ä¼Ò ¹øÈ£¸¦ ÀÌ¿ëÇÏ´Â ¹æ¹ı
y[1] 
### º¤ÅÍ yÀÇ 1¹ø ¹æ¿¡ ÇØ´çÇÏ´Â °ª ¸®ÅÏ
y[2]
y[1:3] 
### 1¹ø ¹æºÎÅÍ 3¹ø ¹æ±îÁö
y[-1,-3] 
### ¿À·ù!
y[c(-1,-3)] 
### 1¹ø ¹æ°ú 3¹ø ¹æÀÇ ¿ä¼Òµé Á¦¿Ü <- minus ºÎÈ£ »ç¿ë!(¿©·¯ °³¸¦ Á¦¿Ü½ÃÅ°°í ½ÍÀ» ¶§´Â c() »ç¿ë!)

y['ÇÏ³ª'] 
### ¼¿ ÀÌ¸§À» °¡Áö°íµµ ¿ä¼Ò¸¦ º¼ ¼ö ÀÖÀ½ 
y[c('ÇÏ³ª','´Ù¼¸')] 
### ¼¿ ÀÌ¸§À¸·Î °Ë»öÇÒ ¶§µµ ¿©·¯ °³ÀÇ °æ¿ì¿¡´Â c() »ç¿ë!

y[-1:-4] 
### 1¹ø ¹æºÎÅÍ 4¹ø ¹æ±îÁö Âß Á¦¿Ü => 5¹ø ¹æÀÇ °ª¸¸ ³ª¿È!



# ¿¬¼ÓµÇ´Â °ªÀ» Ç¥ÇöÇÏ´Â ¹æ¹ı 
x <- 1:100 
### sequence
x <- 1:1e5
x <- c(1:1000) 
### x <- c(½ÃÀÛ°ª:Á¾·á°ª) <- 1¾¿ ÀÚµ¿À¸·Î Áõ°¡ 
x



# sequence: ÀÚµ¿ÀÏ·Ã¹øÈ£¸¦ »ı¼º 
## seq(½ÃÀÛ°ª, Á¾·á°ª, Áõ°¡ºĞ)
seq(1,5,1)
seq(0,1000,5) 
### 0¿¡¼­ºÎÅÍ 1000±îÁö 5¾¿ Áõ°¡ 

10:1 
### 10¿¡¼­ 1±îÁö °¨¼Ò(reverse)
seq(10,1,-1) 
### À§¿Í °á°ú µ¿ÀÏ 
seq(10,0,-1)

x <- c(2,4,6,8,10)
x
seq_along(x) 
### º¤ÅÍ ¾È¿¡ ÀÖ´Â °³¼ö(±æÀÌ)¸¸Å­ sequentialÇÏ°Ô ÀÏ·Ã¹øÈ£ »ı¼º
1:NROW(x) 
### À§¿Í µ¿ÀÏ(º¤ÅÍ °³¼ö¸¸Å­ sequence ¸¸µë)



# ¹İº¹µÇ´Â °ª
rep(1:5, times = 2) 
### 1ºÎÅÍ 5±îÁöÀÇ sequence¸¦ 2¹ø ¹İº¹!
rep(1:5, each = 2) 
### °¢°¢ÀÇ °ªÀ» 2°³¾¿!
rep(1:5, each = 2, times = 2)
rep(1:5, times = 2, each = 2)



# º¤ÅÍÀÇ °ª ¼öÁ¤
x <- c(1:5)
x[2] <- 8 
### 2¹ø ¹æÀÇ °ªÀÌ ¼öÁ¤
x
x[3:5] <- c(30,40,50)
x[3:5] <- seq(10,12,1)



# º¤ÅÍÀÇ °ªÀ» Ãß°¡
x[6] <- 60 
### 6¹ø ¹æÀÌ Ãß°¡µÊ
x
x[8] <- 80 
### Áß°£¿¡ 7¹ø ¹æÀº NA·Î Ã³¸®µÊ 
x[7] <- 70
x

# append()
append(x,90,after=8) 
### 8¹ø ¹æ µÚ¿¡´Ù°¡ 90À» Ãß°¡ BUT x·Î °Ë»öÇØº¸¸é, º¯°æ»çÇ×ÀÌ ¹İ¿µÀº ¾È µÇ¾î ÀÖÀ½!(¹Ì¸®º¸±â¸¸ Á¦°ø)
x 
x <- append(x,90,after=8) 
### ÀÌÁ¦ ¹İ¿µ!(º¯¼ö¿¡ ³Ö¾îÁà¾ß ÇÔ!)
x
## before´Â ¾øÀ½! after¸¸ °¡´É!



# º¤ÅÍ ¿¬»ê 
x <- c(1:5)
x + 10 
### °¢°¢ÀÇ ¿ä¼ÒÀÇ °ªÀÌ ´Ù 10¾¿ ´õÇØÁü(RÀÇ °¡Àå Å« ÀåÁ¡!)
x * 10
## À§ ¿¬»ê °á°ú¸¦ ¹İ¿µÇÏ·Á¸é, º¯¼ö¿¡ ³Ö¾îÁà¾ß ÇÔ!



# ¹è¿­ º¯¼ö ºñ±³
x <- c(1,2,3)
y <- c(1,2,3)
x == y
z <- c(1,2,4)
x == z

## identical() <- ´Ù ¸ÂÀ¸¸é TRUE, ÇÏ³ª¶óµµ Æ²¸®¸é FALSE
identical(x,y) 
identical(x,z)

w <- c(1:5)

x == w ## µÎ º¤ÅÍÀÇ length°¡ ´Ù¸£´Ù´Â ¸Ş½ÃÁö°¡ ¶ä
identical(x,w) 
### FALSE

x <- c(1,2,3,4)
y <- c(1,2,3,4,4)

x == y 
### 5¹øÂ° ¿ø¼Ò¿¡ ´ëÇØ FALSE°¡ ¶ä(x¿¡ 5¹øÂ° ¿ä¼Ò°¡ ¾ø±â ¶§¹®)
identical(x,y) 
### µÎ º¤ÅÍÀÇ °ªÀÌ µ¿ÀÏÇÑ Áö ÆÇ´Ü => 5¹øÂ° ¿ä¼Ò°¡ ¾È ¸ÂÀ½ => FALSE!
setequal(x,y) 
### µÎ º¤ÅÍÀÇ °°Àº ÁıÇÕÀÎÁö ÆÇ´Ü(Áßº¹°ªÀÌ ÀÖÀ¸¸é °°Àº ÁıÇÕÀ¸·Î ÆÇ´Ü!) => TRUE!



# ÁıÇÕ 
x <- c(1,2,3,4)
y <- c(1,4,6)
union(x,y) ### ÇÕÁıÇÕ => Áßº¹ Á¦°Å!
intersect(x,y) ### ±³ÁıÇÕ 
setdiff(x,y) ### Â÷ÁıÇÕ
'''
It is worth pointing out that intersect and setdiff will discard any duplicated values in the arguments. 
Whereas %in% will keep duplicates. So if we had duplicated values we will get different results. 
For example, indroducing a duplicated element a in vector x:
'''
### Keeps duplicated element x(intersect)
x[x %in% intersect(x, y)]
### Keeps duplicated element x(setdiff)
x[!x %in% y]



# %in% ¿¬»êÀÚ 
1 %in% x 
### x º¯¼ö¿¡ 1ÀÌ ÀÖÀ¸¸é TRUE, ¾Æ´Ï¸é FALSE
5 %in% x

x <- c('b','a','d','a',NA)
x

'a' %in% x 
### a°¡ x¿¡ ÀÖ´Â ÁöÀÇ ¿©ºÎ´Â ¾Ë ¼ö ÀÖÁö¸¸, ¾î´À À§Ä¡¿¡ ÀÖ´Â Áö´Â ¾Ë ¼ö ¾øÀ½

x == 'a' 
### a¸¦ xÀÇ °¢ ¿ä¼Ò¿Í ºñ±³ 

x[x == 'a'] 
### NAµµ ¸®ÅÏµÊ!
### Á¶°Ç¿¡ ÇØ´çÇÏ´Â ¿ä¼Ò¹øÈ£ Ã£±â 



# which() <- ÇØ´ç°ªÀÌ ¾î´À À§Ä¡¿¡ ÀÖ´Â Áö ÆÄ¾Ç 
which('a' == x) 
### ÇØ´ç°ªÀÌ ¾î´À º¤ÅÍÀÇ ¸î ¹øÂ°¿¡ À§Ä¡ÇØ ÀÖ´Â Áö ¾Ë ¼ö ÀÖÀ½!
x[which('a' == x)] 
### ¹Ù·Î À§¿¡¼­ ±¸ÇÑ ¿ä¼Ò ¹øÈ£¸¦ x[]ÀÇ ¹æ ¹øÈ£·Î ÀÌ¿ë!

is.na(x) 
### NA°¡ ÀÖÀ¸¸é TRUE
which(NA == x) 
### È®ÀÎ ºÒ°¡!(NAÀÇ À§Ä¡´Â ÆÄ¾Ç ºÒ°¡´É!)
which(is.na(x)) 
### ÀÌ°É·Î NAÀÇ À§Ä¡¸¦ ÆÄ¾ÇÇØ¾ß ÇÔ 

x[which('a' == x)] 
x[which('a' == x)] <- 'aa'
x ### a °ªÀ» °¡Áø ¹æ¸¸ µû·Î °Ë»öÇØ¼­ ÀÌ¸¦ aa·Î ¹Ù²Ş!



x <- c(1:5) 
### integer Çü½Ä
y <- c(1,2,3,4,5) 
### numeric Çü½Ä
setequal(x,y) 
### TRUE
identical(x,y) 
### FALSE(typeÀÌ ´Ù¸£±â ¶§¹®!)
x
y
str(x)
str(y)
y <- as.integer(y) 
### Çüº¯È¯ ÇÔ¼ö(numeric => integer) <- SQLÀÇ to_number()
identical(x,y) 
### ÀÌÁ¦ TRUE!



# help(), ? ±â´É <- ¸Ş¼ÒµåÀÇ ÀÎÀÚ°ªÀ¸·Î ¹» ³Ö¾î¾ß ÇÒ Áö ¸ğ¸¦ ¶§
help(identical)
?identical



# 2. ListÇü µ¥ÀÌÅÍ
## - ¼­·Î "´Ù¸¥" µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â º¤ÅÍµéÀ» ÀúÀåÇÏ°Å³ª ¶Ç´Ù¸¥ ¸®½ºÆ® ÀúÀå°¡´ÉÇÑ ±¸Á¶ÀÌ´Ù. 
## - list(Å° = °ª, Å° = °ª)
x <- list(name = 'È«±æµ¿', addr = '¼­¿ï½Ã', pn = '010-1111-1234') 
### ¹®ÀÚ, ¼ıÀÚ µÑ ´Ù °¡´É
x
str(x)
class(x)
mode(x)
x$name 
### x$Å°ÀÌ¸§
x$addr
x$pn

x[1]
x[[1]] 
### Console¿¡ "$Å°ÀÌ¸§" ºÎºĞÀÌ »ç¶óÁö°í, ±×Àú °ª¸¸ ¸®ÅÏµÊ!
x[1:3]

## list ¿ä¼Ò Ãß°¡ 
x$sal <- 10000 
### x$»õ·Î¿îÅ° <- °ª 
x

## list ¿ä¼Ò Á¦°Å
x$sal <- NULL
x

## list ¿ä¼Ò ¼öÁ¤
x$pn <- '010-1234-1004'
x

## list ÁßÃ¸ 
y <- list(a=list(val=c(1,2,3)),b=list(val=c(1,2,3,4))) 
### 2°³ ÀÌ»óÀÇ ¸®½ºÆ®µéÀÌ ÇÏ³ªÀÇ ¸®½ºÆ®¿¡ µé¾î°¨ 
### data.frameÀ» ¾²¸é µÇ´Ï±î ±»ÀÌ ÀÌ·¸°Ô ¾µ ÇÊ¿ä´Â ¾øÀ½!
y
y$a
y$b





##################################################################################################
##################################################################################################
##################################################################################################





# 07/24/2018
# 3. Çà·Ä <- ½Å°æ¸Á°ú °ü·Ã(Python)
## - º¤ÅÍÃ³·³ ÇÑ°¡Áö À¯ÇüÀÇ ½ºÄ®¶ó °ª¸¸ ÀúÀå 
## - matrix ÇÔ¼ö¸¦ ÀÌ¿ëÇØ¼­ Çà·ÄÀ» »ı¼º 
## - Çà°ú ¿­À» ÁöÁ¤(nrow, ncol)

x <- c(1:9) ### 1Â÷¿ø ¹è¿­
x <- matrix(c(1:9), nrow=3) ### nrow: ÇàÀÇ ¼ö(#nrow = 3) <- º¸ÆíÀûÀ¸·Î´Â Çà°ú ¿­À» °°ÀÌ »ı°¢ÇØ¼­ ¸¸µë!
x
x <- matrix(c(1:9), ncol=3) ### ncol: ¿­ÀÇ ¼ö(#ncol = 3) 
x
x <- matrix(c(1:9), nrow=3, ncol=3)
x <- matrix(c(1:9), ncol=1) ### ÇÑ ÇàÂ¥¸®ÀÇ ¿­(º¤ÅÍ)
x

nrow(x) ### ÇàÀÇ ¼ö(¼ıÀÚ Å¸ÀÔ ¸®ÅÏ!!!)
ncol(x) ### ¿­ÀÇ ¼ö
dim(x) ### Çà, ¿­ÀÇ ¼ö(º¤ÅÍ)
x <- matrix(c(1:9), nrow=3, byrow = T) ### ÇàºÎÅÍ °ªÀ» Ã¤¿ò
x <- matrix(c(1:9), nrow=3, byrow = F) ### ¿­ºÎÅÍ °ªÀ» Ã¤¿ò(Default)
x

x <- matrix(c(1,2,3,4), nrow=2, byrow=TRUE, 
            dimnames=list(c('row1', 'row2'), c('col1', 'col2'))) ### Çà°ú ¿­ÀÇ ÀÌ¸§ ÁöÁ¤(dimnames=list) <- ¸®½ºÆ®ÇüÀ¸·Î ÁöÁ¤!

x <- matrix(c(1:9), ncol = 3)
x
dimnames(x) = list(c('row1', 'row2', 'row3'), c('col1', 'col2', 'col3')) ### MatrixºÎÅÍ ¸¸µé°í Çà°ú ¿­ÀÇ ÀÌ¸§À» µû·Î ÁöÁ¤!
                                                                         ### ¸®½ºÆ® ¾È¿¡ º¤ÅÍ·Î Ç¥Çö!
x

rownames(x) ### ÇàÀÇ ÀÌ¸§¸¸ È®ÀÎ ¹× "¼öÁ¤" <- º¤ÅÍ Å¸ÀÔ!!!
colnames(x)[1] <- 'col0' ### ¿­ÀÇ ÀÌ¸§ ¼öÁ¤
rownames(x) <- c('r1', 'r2', 'r3') ### º¤ÅÍ ±æÀÌ ¸ÂÃçÁà¾ß ÇÔ!
x

cells <- c(1:9)
rname <- c('r1', 'r2', 'r3')
cname <- c('c1', 'c2', 'c3')
x <- matrix(cells, nrow=3, byrow = T, dimnames = list(rname, cname)) ### µû·Î ¶³¾îÁ® ÀÖ´Â º¯¼ö¸¦ Á¶ÇÕÇØ¼­ matrix »ı¼º 
x
(x <- matrix(cells, nrow=3, byrow = T, dimnames = list(rname, cname))) ### Å©°Ô ÇÑ ¹ø °ıÈ£¸¦ ¿­°í ´İÀ¸¸é, °ğ¹Ù·Î º¯¼ö ³»¿ë È®ÀÎ °¡´É!

class(x) ### º¤ÅÍ¿Í ¸®½ºÆ®¿¡¼­´Â class¿Í mode°¡ °°¾ÒÀ½
         ### Matrix¿¡¼­´Â ÀÚ·áÇü ¸®ÅÏ
mode(x) ### mode()¿¡¼­´Â ÀÚ·á ¾È¿¡ µé¾î°£ µ¥ÀÌÅÍÀÇ Å¸ÀÔ È®ÀÎ °¡´É

## Çà·ÄÀÌ¸§[ÇàÀÎµ¦½º,¿­ÀÎµ¦½º]
x[1,1] ### 1Çà 1¿­ÀÇ °ª ¸®ÅÏ
x[2,1]
x[3,2]
x[1,] ### 1Çà¸¸ ÃßÃâ
x[,2] ### <- º¤ÅÍ Å¸ÀÔ!!!(ÄÜ¼Ö¿¡ °¡·Î·Î ¸®ÅÏµÊ)
x[,-2] ### 2¿­ Á¦¿Ü
x[1,-2]
x[1,2:3]
x[c(1,3),c(1,2)] ### 1Çà°ú 3Çà µû·Î ÃßÃâ <- c() ÀÌ¿ë!
x['r1',] ### row ÀÌ¸§ °¡Áö°íµµ °¡´É!
x[,'c2']

x[1,1] <- 10; x ### ¿ø¼Ò°ª ¼öÁ¤



# Çà·ÄÀÇ ¿¬»ê 
x <- matrix(c(1:4), ncol=2)
y <- matrix(seq(2,8,by=2), ncol=2)

x + 10
x - 10
10 - x
x / 2
x + x
x - x
x / x
x * x ### ±×³É ¿ø¼Òµé³¢¸® °öÇÔ
x %*% x ### Çà·Ä °ö
x %*% y

t(x) ### ÀüÄ¡Çà·Ä(Çà°ú ¿­ÀÇ À§Ä¡¸¦ ¹Ù²Û´Ù) ex. 1Çà 2¿­ <-> 2Çà 1¿­ => ½Å°æ¸Á!
solve(x) ### ¿ªÇà·Ä
x %*% solve(x) ### ´ÜÀ§Çà·Ä(I)

x <- matrix(c(1:6), ncol=3)
x
dim(x)
dim(t(x)) ### Çà·ÄÀÇ ¸ğ¾çÀ» ¹Ù²Ù´Â ÀÛ¾÷!
dim(x) <- c(3,2) ### ÀÌ·± ½ÄÀ¸·Îµµ ¹Ù²Ü ¼ö ÀÖÀ½!!(c() ÀÌ¿ë)

## Çà·Ä º´ÇÕ 
x <- matrix(c(1:9), nrow=3)
y <- matrix(c(1:9), nrow=3)

cbind(x,y) ### ¿­À» ±âÁØÀ¸·Î ÇÕÄ§(°¡·Î·Î Âß ´ÃÀÓ)
rbind(x,y) ### ÇàÀ¸·Î ÇÕÃÄÁÜ(¼¼·Î·Î Âß ´ÃÀÓ)



# 4. array(¹è¿­)
## dim(Çà, ¿­, ¸é)
## - °°Àº µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â "3Â÷¿ø" ¹è¿­±¸Á¶ 
## - matrix: 2Â÷¿ø Çà·Ä, array 3Â÷¿ø Çà·Ä <- array¸¦ 2Â÷¿øÀ¸·Î ¸¸µé¸é, Çà·ÄÀÌ µÊ 
## - array ÇÔ¼ö¸¦ ÀÌ¿ëÇØ¼­ ¹è¿­»ı¼º 

## ´ÙÂ÷¿ø ¹è¿­ => ¼­·Î ´Ù¸¥ Å¸ÀÔÀÇ µ¥ÀÌÅÍ¸¦ Á¶ÀÛ!

x <- array(c(1:6), dim=c(2,3)) ### Çà·Ä°ú °°À½
x <- array(c(1:24), dim=c(2,3,4)) ### 4°³ÀÇ ¸éÀ» ¸¸µë => 2x3 Çà·ÄÀ» 4°³ »ı¼º!

x[1,1,] ### °¢ ¸éÀÇ 1Çà 1¿­ °ª¸¸ ÃßÃâ => º¤ÅÍ Å¸ÀÔ!
x[1,,] ### 1ÇàÀÇ 4¸é¸¸ »Ì¾Æ³¿ 
x[,,4]

dimnames(x)
dimnames(x) <- list(c('r1', 'r2'), c('c1', 'c2', 'c3')) ### Matrix¿Í °°À½!
x
rownames(x)
colnames(x)

class(x) ### array
mode(x) ### array¿¡ ÀÖ´Â µ¥ÀÌÅÍÀÇ Å¸ÀÔ(numeric)
str(x) ### Á¾ÇÕ 
is.matrix(x)
is.array(x)



# 5. factor(ÆÑÅÍ) <- ¹Ì¸® ·¹º§(¹üÁÖ)À» ¸¸µé¾î¼­ º¤ÅÍÀÇ °ª °ü¸®!
## - ¹üÁÖÇü: µ¥ÀÌÅÍ¸¦ ¹Ì¸® Á¤ÇØÁø À¯ÇüÀ¸·Î ºĞ·ù ex. job_id, department_id from employees => ÀÌ¸¦ º¯¼ö·Î Ç¥Çö!
## - level: (A, B, C, D, E), ('ÁÁÀ½', 'º¸Åë', '³ª»İ')
## - Á¾·ù: ¼ø¼­Çü(ordinal), ¸í¸ñÇü(nominal)

## - ¼ø¼­Çü(ordinal): µ¥ÀÌÅÍ°£ ¼ø¼­¸¦ µÑ ¼ö ÀÖ´Â °æ¿ì(ex. A, B, C, D)
## - ¸í¸ñÇü(nominal): µ¥ÀÌÅÍ°£ Å©±â ºñ±³°¡ ºÒ°¡´ÉÇÑ °æ¿ì(ex. ³²³à) <- default

## Áßº¹ Á¦°Å!(°íÀ¯ °ªÀ¸·Î ÃßÃâ)

x <- factor('ÁÁÀ½', c('ÁÁÀ½', 'º¸Åë', '³ª»İ')) ; x
### factor(°ª, c(·¹º§))
x <- factor('¾ÆÁÖ ÁÁÀ½', c('ÁÁÀ½', 'º¸Åë', '³ª»İ')) ; x
### ·¹º§ ¾È¿¡ ¾ø´Â °ª ³ÖÀ¸¸é ¿À·ù ³ª¿È!(Á¤ÇØÁø À¯Çü ´ë·Î µ¥ÀÌÅÍ¸¦ Ã³¸®ÇØ¾ß ÇÒ ¶§¸¸ »ç¿ë!)
str(x)
class(x)
mode(x) ### ·¹º§À» character Çü½ÄÀ¸·Î Àû¾ú´Â µ¥µµ, numericÀ¸·Î ³ª¿È!

y <- factor('ÁÁÀ½', c('ÁÁÀ½', 'º¸Åë', '³ª»İ'), ordered = TRUE) ### ordinal·Î ¸¸µë!(¼ø¼­ È®ÀÎ!)
y
str(y) ### Å©±â: levelÀÇ ¼ø¼­!
class(y) ### "ordered" "factor"
mode(y)

nlevels(y) ### ·¹º§ÀÇ °³¼ö => number Å¸ÀÔ!!!
levels(y) ### ·¹º§ÀÇ ¸ñ·Ï => º¤ÅÍ Å¸ÀÔ!!! 
levels(y)[1]
levels(y)[2]
levels(y)[3]

## ·¹º§ ¸ñ·Ï º¯°æ
levels(y) <- c('good', 'normal', 'bad') ; y

is.factor(y)
is.factor(x)
is.ordered(y)
is.ordered(x)

gender <- factor(c("male", "male", "female"), c("male", "female")) ; gender ### nominal!
x <- ordered(c('a','b'), c('a','b','c')) ; x ### ordinal! <- ordered() »ç¿ë!
is.ordered(x)
is.factor(x)

## levels = c() »ç¿ë
x <- factor(c('large','medium','small','small','large','medium'), levels = c('small','medium','large')) ; x
x <- ordered(c('large','medium','small','small','large','medium'), levels = c('small','medium','large')) ; x

x <- append(x, 'tiny', after = 6) ; x ### levelÀ» ¹®ÀÚ·Î ÀÛ¼ºÇß¾îµµ, ³»ºÎÀûÀ¸·Î´Â numericÀ¸·Î °¡Áö°í ÀÖÀ½!
                                      ### append()¸¦ ÀÌ¿ëÇØ¼­ ºÒ¹ı µ¥ÀÌÅÍ¸¦ Ãß°¡ÇÏ¸é, ³ª¸ÓÁö´Â numericÀÌ µÇ°í, Ãß°¡µÈ µ¥ÀÌÅÍ¸¸ ¹®ÀÚÇüÀ¸·Î ³²À½!

## ¹üÁÖÇü => µ¥ÀÌÅÍ¸¦ Ãß°¡ÇÏ´Â °Ô ±î´Ù·Î¿ò

## ÇØ°áÃ¥: as.vector()¸¦ ÀÌ¿ëÇØ¼­ Çü º¯È¯! => append()¸¦ ÀÌ¿ëÇØ¼­ Ãß°¡ÇÑ ´ÙÀ½¿¡ as.factor()·Î ´Ù½Ã factor·Î º¯È¯!
x <- as.vector(x) ; x ### À§ÀÇ append()¸¦ ÀÌ¿ëÇÏ¿© Ãß°¡ °¡´É(º»·¡ÀÇ µ¥ÀÌÅÍ¿¡´Â ¿µÇâÀ» ÁÖÁö ¾ÊÀ½!)
x <- as.factor(x) ; x ### factor·Î Çü º¯È¯ => level¿¡ ÀÚµ¿ÀûÀ¸·Î tiny°¡ Ãß°¡µÊ!

## levelÀÇ ¼ø¼­ º¯°æ
x
x <- as.vector(x)
x <- factor(x, c('tiny', 'small', 'medium', 'large')) ; x ### level ¼ø¼­ º¯°æ!(as.vector()·Î Çü º¯È¯ ÇÑ ´ÙÀ½, ¼ø¼­ º¯°æ!)
                                                          ### factor(º¤ÅÍ¸í, c(·¹º§))
x <- as.ordered(x) ; x ### nominalÀ» ordinal·Î ¹Ù²Ş 



# 6. data frame(µ¥ÀÌÅÍÇÁ·¹ÀÓ)
## - °¢±â ´Ù¸¥ µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â ÄÃ·³À¸·Î ÀÌ·ç¾îÁø 2Â÷¿ø Å×ÀÌºí ±¸Á¶(DBÀÇ TABLE°ú À¯»çÇÏ´Ù)
## - data.frame() ÇÔ¼ö¸¦ ÀÌ¿ëÇØ¼­ °¢ ÄÃ·³, ÇàÀ» ±¸¼ºÇÑ´Ù.

df <- data.frame(x=c(1,2,3,4,5), y=c(6,7,8,9,10)) ; df
mode(df) ### listÇüÀ¸·Î µÇ¾î ÀÖÀ½! => ¼­·Î ´Ù¸¥ µ¥ÀÌÅÍ À¯ÇüÀÇ °ªµéÀ» ¸ğ¾Æ³õ¾Æ¾ß ÇÏ±â ¶§¹®! 
class(df)
str(df) ### obs: rowÀÇ ¼ö // variables: columnÀÇ ¼ö 

df$x ### ÇØ´ç ÄÃ·³¸¸ È®ÀÎ
df$y

df <- data.frame(name = c('scott', 'harden', 'curry'), sql = c(90, 80, 70), plsql = c(70, 80, 90)) ; df
str(df) ### name ÄÃ·³ÀÌ factorÇüÀ¸·Î µÇ¾î ÀÖÀ½! => ¹®ÀÚÇüÀ¸·Î ±¸¼ºµÈ ÄÃ·³Àº factorÇüÀ¸·Î ÀÚµ¿ ¼³Á¤µÊ => ºÒÆíÇÔ!
df <- data.frame(name = c('scott', 'harden', 'curry'), sql = c(90, 80, 70), plsql = c(70, 80, 90), stringsAsFactors = FALSE) ; df 
### stringsAsFactors = FALSE: ¹®ÀÚÇüÀ¸·Î ±¸¼ºµÈ ÄÃ·³À» ±×³É ¹®ÀÚÇüÀ¸·Î ³öµÎ¶ó´Â ¶æ!
str(df) ### chrÇüÀ¸·Î ¹Ù²ñ! 

## °ªÀ» ¼öÁ¤
df[1,1] ### Æ¯Á¤ °ª ÃßÃâ
df[1,1] <- 'james' ; df ### ÇØ´ç °ª º¯°æ

## Æ¯Á¤ ÄÃ·³À» È®ÀÎ -> º¯¼ö$ÄÃ·³¸í
df$sql ### º¤ÅÍ Å¸ÀÔ!!!
df$name
df$plsql

## Æ¯Á¤ ÄÃ·³À» Ãß°¡
df$R <- c(80, 70, 60) ; df

## Æ¯Á¤ ÄÃ·³À» »èÁ¦(NULL »ç¿ë!)
df$R <- NULL ; df

df[1,]
df[,2]
df[c(1,3),c(1,2)] 
df[-1,-2]
df[,c('sql','plsql')]
df[,'sql'] ### º¤ÅÍ Å¸ÀÔ!!!(°¡·Î·Î ³ª¿­µÇ¾î¼­ ÄÜ¼Ö¿¡ ¸®ÅÏµÊ!)
df[,'sql', drop = FALSE] ### drop = FALSE <- ¿­ ÇüÅÂ À¯ÁöµÅ¼­ ¸®ÅÏ!

df$sql[1]
df$sql[2]

x <- data.frame(1:3) ; x
colnames(x) <- c("val")  ### ÄÃ·³ ÀÌ¸§ ÁöÁ¤
rownames(x) <- c('a','b','c') ### Çà ÀÌ¸§ ÁöÁ¤
x
colnames(x)
names(x) ### À§ÀÇ colnames()¿Í °°À½ => µÑ Áß ÆíÇÑ °Å »ç¿ë! 
names(x) <- c('col') ; x

d <- data.frame(a=1:3, b=4:6, c=7:9) ; d
names(d) %in% c('b','c') ### °¢°¢ÀÇ ÄÃ·³¸íÀ» ºñ±³ÇØ¼­ °¢°¢ TRUE/FALSE ¸®ÅÏ!(names() <- º¤ÅÍ Å¸ÀÔ!)
d[,names(d) %in% c('b','c')] ### Æ¯Á¤ÇÑ ÄÃ·³¸¸ »Ì¾Æ³¾ ¼ö ÀÖÀ½! 

## NOT Á¶°Ç
### ¼ıÀÚ´Â -(minus) ºÎÈ£ »ç¿ë 
### ¹®ÀÚ´Â ! »ç¿ë 
d[,!names(d) %in% c('b','c')] ### ! <- ÇØ´ç ÄÃ·³Àº Á¦¿Ü  
d[,-c('b','c')] ### ¿À·ù!(ÄÃ·³¸íÀ» ½á¼­ Á¦¿Ü½ÃÅ°°í ½ÍÀ¸¸é "!" »ç¿ëÇØ¾ßÇÔ)
d[,-c(2,3)]

## Çà Ãß°¡ 
d[4,] <- c(7,7,7)
d[length(d)+1,] <- c(8,9,10) ; d

## Çà »èÁ¦
d <- d[-4,] ; d

x <- data.frame(x=1:1000) ; x
head(x) ### ¾ÕºÎºĞÀÇ µ¥ÀÌÅÍ 
tail(x) ### µŞºÎºĞÀÇ µ¥ÀÌÅÍ 
tail(x, n=10)
head(x,5)





##################################################################################################
##################################################################################################
##################################################################################################





# 07/25/2018

# ÀÚ·áÇü
## 1. vector: °°Àº µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 1Â÷¿ø ¹è¿­ 
## 2. list: ¼­·Î ´Ù¸¥ µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 1Â÷¿ø ¹è¿­, ÁßÃ¸ °¡´É <- list(ÄÃ·³¸í = °ª, ÄÃ·³¸í = °ª)
## 3. matrix: °°Àº µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 2Â÷¿ø ¹è¿­ <- matrix(º¤ÅÍ, nrow, ncol, byrow = T/F, dimnames = list(c(Çà), c(¿­)))
## 4. array: °°Àº µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â 3Â÷¿ø ¹è¿­ <- array(c(µ¥ÀÌÅÍ), dim = c(Çà,¿­,¸é)) <- x[,,1]
## 5. factor: ¸ñ·Ï, ¹üÁÖÇü µ¥ÀÌÅÍ <- factor(c(Æ¯Á¤°ª), c(·¹º§)) // ordered()
## 6. data.frame: ¼­·Î ´Ù¸¥ µ¥ÀÌÅÍ Å¸ÀÔÀ» °®´Â ÄÃ·³À¸·Î ÀÌ·ç¾îÁø 2Â÷¿ø ¹è¿­ <- data.frame(ÄÃ·³¸í1 = c(°ª), ÄÃ·³¸í2 = c(°ª)) <- list¸¦ ¸ğ¾Æ³õÀº °Å! 
## 7. table: data.frame µ¿ÀÏÇÑ ±¸Á¶¸¦ °®´Âµ¥ ¼Óµµ°¡ ºü¸£´Ù. 

a <- c(1,2)
b <- list(c('king',100))
c <- matrix(c(1,2))
d <- array(1:12, dim = c(2,2,3))
e <- factor(c('male','female'))
f <- data.frame(x = c(1,2))

class(a) ; class(b) ; class(c) ; class(d) ; class(e) ; class(f) ### ÀÚ·áÇü ÀÚÃ¼ÀÇ ±¸Á¶¿¡ ´ëÇÑ ºÎºĞ(±×·¡µµ vector´Â numericÀÌ¶ó°í ³ª¿È!)
mode(a) ; mode(b) ; mode(c) ; mode(d) ; mode(e) ; mode(f) ### ÀÚ·áÇü ³»ÀÇ µ¥ÀÌÅÍ Á¾·ù!
str(a) ; str(b) ; str(c) ; str(d) ; str(e) ; str(f)

## Boolean ÇÔ¼ö 
is.numeric(a)
is.character(a)
is.integer(a)
is.factor(e)
is.matrix(c)
is.array(c) ; is.array(d)
is.data.frame(f)
is.list(b)

## Çü º¯È¯ ÇÔ¼ö
as.numeric(a)
as.array(a)
as.matrix(a)

install.packages('readxl')
library(readxl)
emp <- read.csv("C://data/emp.csv") ### csvÆÄÀÏÀ» data.frameÀ¸·Î ÀĞ¾îµéÀÌ´Â ÇÔ¼ö 
View(emp)
str(emp) ### ÄÃ·³ Áß¿¡ factor¶ó°í µÇ¾î ÀÖ´Â ºÎºĞÀº ÁÖÀÇ!

emp <- read.csv("C://data/emp.csv", header = FALSE) ### header = FALSE <- ÄÃ·³¸íÀÌ ÇÊµå°ªÀ¸·Î µé¾î°¨!
View(emp)
str(emp) ### ÀüºÎ factorÇüÀ¸·Î ¹Ù²î¾úÀ½!

emp <- read.csv("C://data/emp.csv", header = TRUE, stringsAsFactors = F)
View(emp)
str(emp) ### Factor Å¸ÀÔÀ¸·Î µÇ¾î ÀÖ´Â ÄÃ·³µéÀÌ chr Å¸ÀÔÀ¸·Î ¹Ù²ñ(ÇØ°á!)
         ### ÇÊµå°ªÀÌ ¾øÀ¸¸é NULL(ÃÊ±â°ªÀÌ ¼³Á¤µÇÁö ¾ÊÀº °Å)ÀÌ ¾Æ´Ï¶ó NA(°áÃøÄ¡)·Î ¼³Á¤µÊ!

getwd()
setwd('C://data/') ### ÁÖ¼Ò¸¦ default ¼³Á¤

names(emp) ### ÄÃ·³ ÀÌ¸§ È®ÀÎ °¡´É!
emp$EMPLOYEE_ID ### ´ë¼Ò¹®ÀÚ ±¸ºĞ! => º¤ÅÍ Å¸ÀÔ!
emp$EMPLOYEE_ID == 100 ### 100ÀÌ ÀÖ´Â °÷¿¡ TRUE => ÀÌ°É ¿ä¼Ò ¹øÈ£ ºÎºĞ([])¿¡ Áı¾î³ÖÀ½!(Çà Á¦ÇÑ ±â´É!)

## emp[ÇàÁ¦ÇÑ, º¸°í½ÍÀºÄÃ·³]
## emp[º¸°í½ÍÀº·Î¿ì, ¿­Á¦ÇÑ]
emp[emp$EMPLOYEE_ID == 100,] ### ÀÌ °ªÀÌ ÀÖ´Â row ÃßÃâ <- select * from emp where employee_id = 100;
emp[emp$EMPLOYEE_ID == 100, c('LAST_NAME','SALARY')] ### select last_name, salary from emp where employee_id = 100;

install.packages('sqldf')
library(sqldf)



# ¹®ÀÚÇÔ¼ö 
## 0. paste0(): ¹®ÀÚ ÇÕÄ¡±â

## 1. nchar() : ¹®ÀÚ ¼ö¸¦ ¸®ÅÏÇÏ´Â ÇÔ¼ö(OracleÀÇ length)
nchar('R Developer')
nchar('R Developer', type = 'chars') ### Default
nchar('R Developer', type = 'bytes') ### ¿µ¹®ÀÚ´Â ±ÛÀÚ ¼ö¸¶´Ù 1 byte¾¿ °è»ê => 11 bytes

nchar('ºòµ¥ÀÌÅÍ')
nchar('ºòµ¥ÀÌÅÍ', type = 'chars')
nchar('ºòµ¥ÀÌÅÍ', type = 'bytes') ### ÇÑ±¹¾î´Â ÇÑ ±ÛÀÚ°¡ 2 bytes¾¿! 

## 2. strsplit(): ºÎºĞ¹®ÀÚ·Î ºĞ¸®ÇÏ´Â ÇÔ¼ö 
strsplit('R Developer') ### ¿À·ù!(default ¼³Á¤ ¾È µÊ!)
x <- strsplit('R Developer', split = character(0)) ### ½ºÆç¸µ¸¶´Ù ºĞ¸®½ÃÅ´!
strsplit('R Developer', split = character(3)) ### º¯È­ ¾øÀ½! 
strsplit('R Developer', split = " ") ### °ø¹éÀ» ±âÁØÀ¸·Î split
strsplit('R,Developer', split = ",") ### ,¸¦ ±âÁØÀ¸·Î split

str(x) ### º¤ÅÍ°¡ ¾Æ´Ô! ¸®½ºÆ®·Î ³ª¿È!
unlist(x) ### ¸®½ºÆ® Å¸ÀÔÀ» º¤ÅÍ Å¸ÀÔÀ¸·Î ¹Ù²ãÁÜ! 
str(unlist(x))

## 3. toupper(): ´ë¹®ÀÚ·Î ¹Ù²ãÁÜ 
toupper('r developer')

## 3-1. toTitleCase(), str_to_title(): Ã¹ ±ÛÀÚ¸¸ ´ë¹®ÀÚ·Î ¹Ù²ãÁÜ 
library(tools)
toTitleCase(r)
library(stringr)
str_to_title(r)

## 4. tolower(): ¼Ò¹®ÀÚ·Î ¹Ù²ãÁÜ
tolower('R DEVELOPER')

## 5. substr(): ¹®ÀÚ¿­ ÃßÃâ(Oracle SQL°ú ±â´ÉÀÌ °°À½! ±âÁØÁ¡(1) ¿ª½Ã ¸ø ¹Ù²Ş!) => ¹®ÀÚ ¸®ÅÏ! 
substr('R Developer',1,1)
substr('R Developer',1,3)

## 6. sub(): Ã¹¹øÂ° ÀÏÄ¡ÇÏ´Â ¹®ÀÚ¸¸ ¹Ù²Ù´Â ÇÔ¼ö
### sub(¿øº»±ÛÀÚ, »õ·Î¿î±ÛÀÚ, ¹®Àå)
sub('R', 'Python', 'R Programmer R Developer')
sub('R Programmer', 'Python Coder', 'R Programmer R Developer')

## 7. gsub(): ÀÏÄ¡ÇÏ´Â "¸ğµç" ¹®ÀÚ¸¦ ´ëÃ¼ÇÏ´Â ÇÔ¼ö
### gsub(¿øº»±ÛÀÚ, »õ·Î¿î±ÛÀÚ, ¹®Àå)
gsub('R', 'Python', 'R Programmer R Developer')
gsub('[0-2]','*','120304') ### ¹®ÀåÆĞÅÏÀ» Ã£À» ¶§ À¯¿ëÇÏ°Ô ¾²ÀÓ! 



# ¼ıÀÚÇÔ¼ö 
## 1. round()
round(45.926)
round(45.926,1) ### ¼Ò¼öÁ¡ Ã¹Â° ÀÚ¸®±îÁö! 
round(45.926,2)
round(45.926,-1) ### 10ÀÇ ÀÚ¸®±îÁö ¹İ¿Ã¸²(±âÁ¸ÀÇ Oracle SQL°ú ºñ½Á!)
round(45.926,-2) ### ¾øÀ¸¸é 0 

## 2. trunc()
### ¹«Á¶°Ç ¼Ò¼öÁ¡À» ¹ö¸®´Â ÀÛ¾÷ ¼öÇà!(¼Ò¼öÁ¡ ¸î Â° ÀÚ¸®±îÁö ¹ö¸± °ÇÁö´Â ÀÓÀÇ·Î ¼³Á¤ÇÒ ¼ö ¾øÀ½!)
### %%ÀÇ ±â´É°ú ºñ½Á(¸ò ¹ö¸®°í ³ª¸ÓÁö¸¸ ÃëÇÔ)
trunc(45.926)
trunc(45.926,1)
trunc(45.926,2) ### trunc()´Â 2¹øÂ° ÀÎÀÚÀÇ ¼ıÀÚ°¡ ÀÇ¹Ì ¾øÀ½! 

## 3. signif()
### À§Ä¡°ªÀº ±âÁØ°ª! <- »ç¿ë¿¡ À¯ÀÇ! 
signif(45.926,1) ### ¿Ã¸²!(1À» ±âÁØÀ¸·Î ÇØ¼­ µÚ¿¡ ÀÖ´Â °ÍÀ¸·ÎºÎÅÍ ¹İ¿Ã¸²!)
signif(45.926,2) ### ¼Ò¼öÁ¡ "1"ÀÇ ÀÚ¸®¿¡¼­ ¹İ¿Ã¸²

## 4. floor()
### ÀÛ°Å³ª °°Àº Á¤¼ö("¹ö¸²"ÀÇ ±â´É)
### trunc()¿ÍÀÇ Â÷ÀÌ => -(minus)ÀÏ ¶§ ´Ş¶óÁü!
floor(45.926)
trunc(-45.926)
floor(-45.926)



# ³¯Â¥ÇÔ¼ö 
## 1. ÇöÀç³¯Â¥ 
Sys.Date() ### ¼­¹öÀÇ ½Ã°£ Á¤º¸!(´ë¼Ò¹®ÀÚ ±¸ºĞ!) <- ³¯Â¥±îÁö!
Sys.time() ### ½Ã°£°ú ½Ã°£´ë Æ÷ÇÔ! 
date() ### ¹Ì±¹½ÄÀ¸·Î Ç¥±âµÊ! 

## 2. as.Date(): ¹®ÀÚ³¯Â¥¸¦ ³¯Â¥ÇüÀ¸·Î º¯È¯ÇÏ´Â ÇÔ¼ö 
### Áö¿ª¿¡ Á¾¼Ó
as.Date('2018-07-25')
as.Date('2018/07/25')
as.Date('20180725') ### ¿À·ù!(Ç¥ÁØ¼­½Ä¿¡ ¸Â°Ô ÀÔ·ÂÇØ¾ß!)
as.Date('20180725', format = '%Y%m%d') ### formatÀ» µÎ¹øÂ° ÀÎÀÚ°ªÀ¸·Î ÀÔ·ÂÇØ¾ß! 

'''
## 3. format
%Y: ¼¼±â¸¦ Æ÷ÇÔÇÑ ³âµµ(4ÀÚ¸®)
%y: ¼¼±â¸¦ »ı·«ÇÑ ³âµµ(2ÀÚ¸®)

%m: ¼ıÀÚ´Ş
%B: ¹®ÀÚ´Ş
%b: abbreviated month

%d: ÀÏ
%A: ¿äÀÏ
%a: abbreviated weekday 

%u: ¼ıÀÚ¿äÀÏ 1 - 7 ¿ù¿äÀÏ(1)
%w: ¼ıÀÚ¿äÀÏ 0 - 6 ÀÏ¿äÀÏ(0)

%H: ½Ã
%M: ºĞ
%S: ÃÊ

%z: timezone ½Ã°£ 
%Z: timezone name
'''

as.Date('2018³â 1¿ù 2ÀÏ', format = '%Y³â%m¿ù%dÀÏ') ### ÇÑ±¹¾î·Î Ç¥ÇöÇÒ ¶§´Â, ²À format¿¡ ÇÑ±¹¾î¸¦ ±âÀÔÇÒ °Í!

## Console¿¡ ¸®ÅÏµÇ´Â DateÀÇ Çü½ÄÀ» ¹Ù²Ù´Â ¹ı 
format(Sys.time(), '%y%m%d %z%Z') ### ³¯Â¥ ¸ğµ¨ ¿ä¼Ò ¾î¶»°Ô ¾²´Â Áö ±â¾ïÇÒ °Í! 
format(Sys.time(), '%A %a %u %w')
format(Sys.time(), '%B %dÀÏ %Y³â')




##################################################################################################
##################################################################################################
##################################################################################################





# 07/26/2018

## 4. weekdays: ¿äÀÏÀ» Ãâ·ÂÇØÁÖ´Â ÇÔ¼ö 
### weekdays(³¯Â¥Å¸ÀÔ), '%A'
weekdays(Sys.Date())
weekdays(as.Date('1989³â 5¿ù 5ÀÏ', format = '%Y³â%m¿ù%dÀÏ'))
format(as.Date('1989³â 5¿ù 5ÀÏ', format = '%Y³â%m¿ù%dÀÏ'), '%A')

## 5. ³¯Â¥ °è»ê 
Sys.Date() + 100 ### ³¯Â¥ + ¼ıÀÚ(ÀÏ) = ³¯Â¥
Sys.Date() - 206 ### ³¯Â¥ - ¼ıÀÚ = ³¯Â¥
Sys.Date() - as.Date('2014-05-20') ### ³¯Â¥ - ³¯Â¥ = ¼ıÀÚ(difftime)
as.numeric(Sys.Date() - as.Date('2014-05-20')) ### À§ÀÇ °ªÀ» numericÀ¸·Î º¯°æ!
as.Date('2014-05-20') - as.Date('2018-11-03') ### -(minus) °ª!
Sys.Date() + as.Date('2014-05-20') ### ³¯Â¥ + ³¯Â¥ => ¿À·ù!

## 6. difftime ÇÔ¼ö: µÎ ³¯Â¥ °£ÀÇ ÀÏ¼ö¸¦ Ç¥Çö 
trunc(difftime('2018-11-22', as.Date('2014-05-20')))
trunc(as.numeric(difftime('2018-11-22', as.Date('2014-05-20'))))

## 7. as.difftime ÇÔ¼ö: ½Ã°£ÀÇ Â÷ÀÌ 
as.difftime('00:09:30') - as.difftime('00:18:20') ### '00:09:30' <- ½ÃºĞÃÊ ±¸ºĞÇØ¼­ Ç¥Çö! 
as.numeric(as.difftime('00:18:20') - as.difftime('00:09:30'))

## 8. lubridate ÆĞÅ°Áö 
### ymb(¼ıÀÚ) <- cf. as.Date(¹®ÀÚ)
install.packages('lubridate')
library(lubridate)
library(stringr)
?lubridate
mdy(05051989) ### date Å¸ÀÔÀ¸·Î ¸®ÅÏ! 
ymd_hms("2010-12-13 15:30:30")
ymd_hms(Sys.time())

### ÇöÀç ½Ã°£ 
now() 

### ¿¬µµ¸¸ µû·Î ¶¼¾î³õÀ½ 
year(now())

### ¿ù
month(now())
date <- now()
month(date, label = T) ### Levels => factor Å¸ÀÔ! 
month(date, label = F) ### (default) => numeric Å¸ÀÔ! 
format(Sys.time(), '%m')

### ÀÏ
day(now())
format(Sys.time(), '%d')

### ¿äÀÏ
wday(now()) ### ¼ıÀÚ °ªÀ¸·Î »Ì¾ÆÁü! %u¿Í ´Ù¸§!
format(Sys.time(), '%A')
format(Sys.time(), '%u')
wday(now(), week_start = 1) ### formatÀÇ %u¿Í °°°Ô!(¿ù¿äÀÏ ±âÁØ) 
wday(now(), week_start = 7) ### ÀÏ¿äÀÏ ±âÁØ <- ±×·¹°í¸® ´Ş·Â(default)
wday(now(), week_start = 7, label = T) ### Factor type(¹«½¼ ¿äÀÏÀÌ ±âÁØÀ¸·Î µÇ¾î ÀÖ´Â Áö ¾Ë ¼ö ÀÖÀ½!)



## ³¯Â¥ + ³¯Â¥(to_yminterval()ÀÇ ±â´É)
years(10) ### 10³â(10y 0m 0d 0H 0M 0S)
months(100) ### 100°³¿ù(100m 0d 0H 0M 0S) <- to_yminterval('10-00') from SQL
now() + years(10) ### 10³â ÈÄ
now() + months(100) ### 100°³¿ù ÈÄ
now() + days(100) ### 100ÀÏ ÈÄ
now() + hours(3) ### 3½Ã°£ ÈÄ
now() + minutes(100) ### 100ºĞ ÈÄ
now() + seconds(100) ### 100ÃÊ ÈÄ
now() + years(1) + months(1) + days(1) + hours(10) + minutes(20) + seconds(60)

## ½Ã°£, ºĞ, ÃÊ±îÁö¸¸ Ç¥Çö 
hm('08:00') ### 8½Ã°£
hms('02:30:59') ### ÃÊ±îÁö
now() + hm('08:00')
now() + hms('02:30:59')



## year() vs. years() <- ±¸ºĞÇÒ °Í! 
date <- now()
date
year(date) <- 2017 ### º¯¼ö ³»¿¡ ÀúÀåµÇ¾î ÀÖ´Â ¿¬µµ¸¦ ¹Ù²Ş! <- ¿¬µµ¸¦ ¼öÁ¤ÇÏ´Â ¹æ¹ı! 
date
date - years(1)

month(date) <- 1 ### ¿ù ¼ö¸¦ ¼öÁ¤ÇÏ´Â ¹æ¹ı 
date

day(date) <- 1 ### ÀÏ ¼öÁ¤
date

hour(date) <- 01 ### ½Ã°£ º¯°æ
minute(date) <- 01 ### ºĞ ¼öÁ¤
second(date) <- 00 ### ÃÊ ¼öÁ¤
date ### 0½Ã 00ºĞ 00ÃÊ·Î ¼öÁ¤ÇÏ¸é ¾Æ¿¹ ¾È ¶ä! 

## 9. ºĞ±â
### quarters(³¯Â¥)
quarters(Sys.Date()) ### Q3(3ºĞ±â)



## POSIXct, POSIXt(POSIXlt) Å¬·¡½º
mode(Sys.Date()) ### numeric
mode(Sys.time()) ### numeric
class(Sys.Date()) ### date
class(Sys.time()) ### POSIXct POSIXt <- POSIX(Portable Operating System Interface) <- UNIX °£ ¼ÒÅë °¡´ÉÇÑ ÇÁ·Î±×·¥ ÀÎÅÍÆäÀÌ½ºÀÇ ±Ô¾à 
                  ### POSIXct(continuous) POSIXt(POSIXlt)(list time)
                  ### rÀº ³¯Â¥ ½Ã°£ µ¥ÀÌÅÍ¸¦ Ã³¸®ÇÒ ¼ö ÀÖµµ·Ï POSIXct, POSIXt(POSIXlt) Å¬·¡½º¸¦ »ç¿ëÇÑ´Ù. 
Sys.time()
as.numeric(Sys.time())

## as.POSIXlt()
time <- as.POSIXlt(Sys.time())
unlist(time) 
'''
sec: ÃÊ
min: ºĞ
hour: ½Ã
mday: ±×´ŞÀÇ ÀÏ
mon: 1¿ùÀ» 0À¸·Î ½ÃÀÛ
year: 1900³âÀ» 0À¸·Î ex. 1900+118 = 2018(year: "118")
wday: ÀÏ¿äÀÏ 0 ex. ¸ñ¿äÀÏ(wday: "4") <- "%w"
yday: 1¿ù 1ÀÏ 0
isdst: ¼­¸ÓÅ¸ÀÓ ex. 0 <- ¼­¸ÓÅ¸ÀÓÀ» ÁöÁ¤ÇÏÁö ¾Ê¾Ò´Ù´Â ¶æ 
zone: timezone name
gmtoff: timezone ½Ã(ÃÊ ´ÜÀ§) <- KST(+9) <- GMT offset
'''

date <- '2018-07-26'
class(as.Date(date, format('%Y-%m-%d'))) ### Date
strptime(date, format='%Y-%m-%d') ### ³¯Â¥¿Í ½Ã°£´ë Ç¥½Ã 
class(strptime(date, format='%Y-%m-%d')) ### POSIXct POSIXt



# Áßº¹ Á¦°Å <- unique()
unique(emp$JOB_ID)

# Á¤·Ä(SORT) <- sort()
## sort ÀÛ¾÷ÇÏ¸é, NA°¡ ¾ø¾îÁü! 
x <- c(3,2,4,8,6,5,10,NA,1,11,NA,15)
x[which(is.na(x))]

sort(x) ### ÀÚµ¿ÀûÀ¸·Î NA°¡ ¾ø¾îÁü! 
sort(x, decreasing = FALSE) ### ¿À¸§Â÷¼ø
sort(x, decreasing = TRUE) ### ³»¸²Â÷¼ø
sort(x, decreasing = FALSE, na.last = NA) ### NA Ãâ·Â ¾È ÇÔ
sort(x, decreasing = FALSE, na.last = TRUE) ### NA¸¦ ¸¶Áö¸·¿¡ Ãâ·Â 
sort(x, decreasing = FALSE, na.last = FALSE) ### NA Ã³À½¿¡ Ãâ·Â 
rev(sort(x)) ### reverse function => ¼ø¼­ ¹İ´ë·Î! 

# Order: Á¤·ÄÀÇ »öÀÎÀ» ¹İÈ¯
## data.frame¿¡¼­ Çà ºÎºĞÀ» Á¦ÇÑÇÒ ¶§ sort()°¡ ¾Æ´Ñ order()¸¦ ¾¸! 
df[order(df$weight),]
df[order(-df$weight),] ### minus <- ³»¸²Â÷¼ø 
x <- c(3,5,1,4,2)
sort(x)
order(x) ### Ã³À½ º¯¼ö ¼±¾ğÇÒ ¶§ÀÇ ¼ø¼­ ±×´ë·Î Á¤·Ä! 
x <- c(30,50,10,40,20)
sort(x)
order(x) ### IndexÀÇ ¹øÈ£ ¸®ÅÏ!(30-3, 50-5, 10-1, 40-4, 20-2)
x[order(x)] ### sort()ÀÇ °á°ú¿Í °°À½! 
x[order(x, decreasing = TRUE, na.last = NA)]
x[order(x, decreasing = FALSE, na.last = NA)]
x[order(x, decreasing = TRUE, na.last = TRUE)]
x[order(x, decreasing = TRUE, na.last = FALSE)]

# doBy: µ¥ÀÌÅÍ ÇÁ·¹ÀÓ¿¡ Á¤·Ä 
install.packages('doBy')
library(doBy)
??doBy

### orderBy(~Á¤·ÄÄÃ·³, µ¥ÀÌÅÍÇÁ·¹ÀÓ[,c(ÄÃ·³)]) <- order by Àı in SQL 
orderBy(~SALARY, emp[,c("LAST_NAME", "SALARY")]) ### ~(Default): ¿À¸§Â÷¼ø 
orderBy(~-SALARY, emp[,c("LAST_NAME", "SALARY")]) ### ~-: ³»¸²Â÷¼ø
orderBy(~SALARY, emp[,c("LAST_NAME", "SALARY", "DEPARTMENT_ID")])
orderBy(~DEPARTMENT_ID+SALARY, emp[,c("LAST_NAME", "SALARY", "DEPARTMENT_ID")]) ### DEPARTMENT_IDºÎÅÍ Á¤·ÄÇÏ°í, ±× ´ÙÀ½ SALARY Á¤·Ä! 
orderBy(~+DEPARTMENT_ID+SALARY, emp[,c("LAST_NAME", "SALARY", "DEPARTMENT_ID")])
sqldf('select last_name, salary, department_id from emp order by department_id, salary')
orderBy(~-DEPARTMENT_ID-SALARY, emp[,c("LAST_NAME", "SALARY", "DEPARTMENT_ID")]) ### ³»¸²Â÷¼ø(¾ÕÀÇ µÎ ÄÃ·³¿¡ ¸ğµÎ - ºÙÀÌ±â!)
sqldf('select last_name, salary, department_id from emp order by department_id desc, salary desc')





##################################################################################################
##################################################################################################
##################################################################################################





# 07/27/2018

# ±×·ìÇÔ¼ö 
x <- c(100,90,80,70)

sum(x) ### ÇÕ
mean(x) ### Æò±Õ
var(x) ### ºĞ»ê
sd(x) ### Ç¥ÁØÆíÂ÷

max(x) ### ÃÖ´ë°ª
min(x) ### ÃÖ¼Ò°ª
length(x) ### ¿ø¼ÒÀÇ °³¼ö
NROW(x) ### length()¿Í °°À½ <- "count()" in SQL

x <- c(100,90,80,70,NA)
sum(x) ### °áÃøÄ¡ µé¾î ÀÖÀ¸¸é °á°ú°ª ¸®ÅÏµÇÁö ¾ÊÀ½! 
sum(x, na.rm = T) ### na.rm = T <- NA¸¦ Áö¿ì°í ¼öÇàÇÏ¶ó´Â ¶æ <- sum(na.omit(x)) ÀÌ·¸°Ô ½áµµ µÊ! 
sum(x, na.rm = F) ### Default
mean(x, na.rm = T)
var(x, na.rm = T) 
sd(x, na.rm = T)
max(x, na.rm = T) 
min(x, na.rm = T) 
length(x) ### ÀÌ°Ç NA°¡ Æ÷ÇÔµÇ¾îµµ ¹İ¿µµÇ¼­ ³ª¿È!(°áÃøÄ¡µµ °³¼ö¿¡ °è»ê)
NROW(x)

length(na.omit(x)) ### NA¸¦ Á¦¿ÜÇÏ°í °³¼ö Ä«¿îÆ®! 

sqldf('select sum(salary), avg(salary) from emp;')
sqldf('select sum(salary), avg(salary) from emp group by department_id;') ### ±×·ì ºĞÇÒÇÑ ´ÙÀ½ Áı°è°ªÀ» ±¸ÇÔ! 
sqldf('select sum(salary), avg(nvl(salary,0)) from emp group by department_id;')

mean(x, na.rm = T) ### NA°¡ Á¦¿ÜµÈ Æò±Õ => SQLÀÇ nvl() ÇÔ¼öÃ³·³, NA¸¦ 0À¸·Î ¹Ù²Ù°í °è»êÇØ¾ß ÇÔ!!!
x[which(is.na(x))] <- 0
mean(x, na.rm = T) ### °ªÀÌ ´Ş¶óÁ³À½! (½ÇÁ¦ °³¼ö¸¦ ³ª´²¼­ Æò±Õ °è»ê)



# aggregate ÇÔ¼ö
## group by Áı°è ÇÔ¼ö in SQL 
## µ¥ÀÌÅÍ¸¦ ºĞÇÒÇÏ°í °¢ "±×·ì"À¸·Î ¹­Àº ÈÄ ±×·ì ÇÔ¼ö¸¦ Àû¿ëÇÑ´Ù.
## aggregate(°è»êµÉÄÃ·³ ~ ºĞÇÒÇØ¾ßÇÒ ±âÁØÄÃ·³1 + ±âÁØÄÃ·³2, µ¥ÀÌÅÍ, ÇÔ¼ö)
## aggregate(salary     ~ department_id + JOB_ID          , µ¥ÀÌÅÍ, ÇÔ¼ö)
aggregate(SALARY ~ JOB_ID, emp, sum)
sqldf('select job_id, sum(salary) from emp group by job_id')
aggregate(SALARY ~ JOB_ID, emp, mean)
aggregate(SALARY ~ JOB_ID, emp, max)
aggregate(SALARY ~ JOB_ID, emp, min)



# apply ÇÔ¼ö
## - Çà·Ä, ¹è¿­, µ¥ÀÌÅÍÇÁ·¹ÀÓ¿¡ ÇÔ¼ö¸¦ Àû¿ëÇÑ °á°ú¸¦ º¤ÅÍ, ¸®½ºÆ®, ¹è¿­ ÇüÅÂ·Î ¸®ÅÏÇÑ´Ù. cf) ´ÜÀÏ ¿­(vector)À» Áı°èÇÏ´Â °Ç sum()À» ½áµµ µÊ! 
## - Çà·Ä¿¡¼­ ÇàÀÌ³ª ¿­ÀÇ ¹æÇâÀ¸·Î ÇÔ¼ö¸¦ Àû¿ë 

## apply(x, MARGIN, FUNC)
### x: Çà·Ä, ¹è¿­, µ¥ÀÌÅÍÇÁ·¹ÀÓ
### MARGIN: ÇÔ¼ö¸¦ Àû¿ëÇÒ¶§ ¹æÇâÀ» ÁöÁ¤
###         1 -> Çà ¹æÇâ // 2 -> ¿­ ¹æÇâ // c(1,2) -> Çà°ú ¿­ÀÇ ¹æÇâ 
### FUN: Àû¿ëÇÒ ÇÔ¼ö(sum, mean, var, sd, max, min)

### Matrix¿¡ Àû¿ë 
m <- matrix(1:4, ncol=2) ; m
dim(m) ### 2x2 Çà·Ä 
apply(m,1,sum) ### matrix¸¦ Çà ¹æÇâÀ¸·Î sum => º¤ÅÍ Å¸ÀÔÀ¸·Î ¸®ÅÏ! 
apply(m,2,sum) ### ¿­ ¹æÇâ

apply(a,1,sum) ### Çà³¢¸®ÀÇ ÇÕ
apply(a,2,sum) ### ¿­³¢¸®ÀÇ ÇÕ
apply(a,3,sum) ### ¸é³¢¸®ÀÇ ÇÕ(array)

### Data Frame¿¡ Àû¿ë 
df <- data.frame(name = c('king', 'smith', 'jane'), sql = c(90, NA, 70), python = c(75, 90, NA)) ; df ### Ã¹¹øÂ° ¿­Àº char Å¸ÀÔÀÌ¶ó¼­ °è»êÇÒ ¼ö ¾øÀ½! => Çà Á¦ÇÑ!(df[,2])
apply(df[,2],2,sum) ### apply()´Â Çà·Ä, ¹è¿­, µ¥ÀÌÅÍÇÁ·¹ÀÓÀÇ ¸ğ¾çÀ¸·Î µÇ¾î ÀÖ¾î¾ß ÇÔ! => º¤ÅÍ ÇüÅÂ¸é ±×³É sum() ½áµµ µÊ! 
apply(df[,c(2,3)],1,sum) ### 2¿­¿¡¼­ 3¿­±îÁö horizontal sum! => º¤ÅÍ Å¸ÀÔÀ¸·Î ¸®ÅÏ! 
apply(df[,c(2,3)],1,sum, na.rm = T) ### apply()¿¡µµ "na.rm = T" Àû¿ë °¡´É! 

apply(df[,c(2,3)],2,sum)
apply(df[,c(2,3)],2,sum, na.rm = T) ### ÄÃ·³¸íµµ °°ÀÌ ³ª¿È => ¸®½ºÆ® Å¸ÀÔ! 



## rowSums(): ¹è¿­, Çà·Ä, µ¥ÀÌÅÍÇÁ·¹ÀÓÀÇ ÇàÀÇ ÇÕ (º¤ÅÍ X)
## rowMeans(): ¹è¿­, Çà·Ä, µ¥ÀÌÅÍÇÁ·¹ÀÓÀÇ ÇàÀÇ Æò±Õ 
rowSums(df[,2:3], na.rm = T) ### apply()ÀÇ MARGIN 1°ú °°À½! 
rowMeans(df[,2:3], na.rm = T)
rowMeans(df[,c(2,3)], na.rm = T) ### À§¿Í °°À½(µû·Î ¶³¾îÁ® ÀÖ´Â ¿­À» Áı°èÇÒ ¶§´Â c() »ç¿ë!)

## colSums(): ¹è¿­, Çà·Ä, µ¥ÀÌÅÍÇÁ·¹ÀÓÀÇ ¿­ÀÇ ÇÕ (º¤ÅÍ X)
## colMeans(): ¹è¿­, Çà·Ä, µ¥ÀÌÅÍÇÁ·¹ÀÓÀÇ ¿­ÀÇ Æò±Õ 
colSums(df[,2:3], na.rm = T) ### apply()ÀÇ MARGIN 2¿Í °°À½! 
colMeans(df[,2:3], na.rm = T)



# lapply()
## - º¤ÅÍ, ¸®½ºÆ®, µ¥ÀÌÅÍÇÁ·¹ÀÓ¿¡ ÇÔ¼ö¸¦ Àû¿ëÇÏ°í ±× °á°ú¸¦ ¸®½ºÆ®·Î ¸®ÅÏÇÏ´Â ÇÔ¼ö 
## - ¸®½ºÆ®: ¼­·Î ´Ù¸¥ µ¥ÀÌÅÍ Å¸ÀÔ¿¡ °ªÀ» ÀúÀåÇÏ´Â ÀÚ·áÇüÀÌ´Ù. 
x <- list(a = 1:3, b = 4:6) ; x ### x´Â ¸®½ºÆ®ÀÌÁö¸¸, ±× ¾È¿¡ a¸¸ »Ì¾Æ³ÂÀ¸¸é ±×°Ç º¤ÅÍ! 
str(x)
median(x$a) ### x$a <- º¤ÅÍ! 
median(x$b)
lapply(x,median) ### À§ÀÇ µÎ ÀÛ¾÷(median(x$a), median(x$b))À» ÇÑ ¹ø¿¡ ³¡³¿! 
sapply(x,median) ### lapply()ÀÇ ¸®ÅÏ°ªÀ» °£·«È­ÇÑ °Å! 

lapply(df[,2:3],mean,na.rm=T) ### ¸®½ºÆ® Å¸ÀÔ
apply(df[,2:3],2,mean,na.rm=T) ### µ¥ÀÌÅÍÇÁ·¹ÀÓ Å¸ÀÔ 
colMeans(df[,2:3], na.rm = T) ### ÀÌ ¼Â Áß¿¡ ¸¾¿¡ µå´Â °Å °ñ¶ó ¾²¸é µÊ! => ÀÚ·áÇü¿¡ µû¶ó apply ÇÔ¼ö ¸ÂÃçÁà¾ß! 



## ¸®½ºÆ®¸¦ µ¥ÀÌÅÍÇÁ·¹ÀÓÀ¸·Î ¹Ù²Ù´Â ¹æ¹ı(vector -> matrix -> data.frame)
### 1. ¸®½ºÆ®¸¦ º¤ÅÍ·Î ¹Ù²Ş(unlist())
### 2. º¤ÅÍ¸¦ ¸ÅÆ®¸¯½º·Î ¹Ù²Ş(matrix())
### 3. ¸ÅÆ®¸¯½º¸¦ µ¥ÀÌÅÍÇÁ·¹ÀÓÀ¸·Î ¹Ù²Ş(as.data.frame())
### 4. ÄÃ·³ÀÇ ÀÌ¸§À» ¹Ù²ãÁÜ(names() <- c())
lapply(df[,2:3],mean,na.rm=T) ### ¸®½ºÆ® ÇüÅÂ 
unlist(lapply(df[,2:3],mean,na.rm=T)) ### unlist() => º¤ÅÍ Å¸ÀÔÀ¸·Î ¹Ù²ñ! (µ¥ÀÌÅÍÇÁ·¹ÀÓÃ³·³ »ı°åÁö¸¸ ½ÇÁ¦ ¸ğ¾çÀº º¤ÅÍ!)
matrix(unlist(lapply(df[,2:3],mean,na.rm=T)), ncol=2, byrow=T)  
as.data.frame(matrix(unlist(lapply(df[,2:3],mean,na.rm=T)), ncol=2, byrow=T))
names(x) <- c('sql', 'python') ; x

x <- as.data.frame(matrix(unlist(lapply(df[,2:3],mean,na.rm=T)), ncol=2, byrow=T)) ### data frame -> ´Ù¸¥ Å¸ÀÔÀÇ ÄÃ·³À¸·Î ±¸¼º 
str(x)
class(x)
mode(x) ### ¾È¿¡´Â ¸®½ºÆ® ÇüÅÂ·Î µÇ¾î ÀÖÀ½! 



# sapply()
## - º¤ÅÍ, ¸®½ºÆ®, µ¥ÀÌÅÍÇÁ·¹ÀÓ¿¡ ÇÔ¼ö¸¦ Àû¿ëÇÏ°í ±× °á°ú¸¦ º¤ÅÍ·Î ¸®ÅÏÇÏ´Â ÇÔ¼ö 
x <- sapply(df[,2:3], mean, na.rm = T) ; x
str(x)
class(x)
mode(x)

x <- as.data.frame(matrix(sapply(df[,2:3], mean, na.rm = T), ncol=2, byrow=T))
names(x) <- c('sql', 'python') ; x

t <- as.data.frame(t(as.data.frame(x)))
str(t)
class(t)
mode(t)



# tapply()
## aggregate()¿Í ºñ½ÁÇÑ °Å! 
## - º¤ÅÍ, µ¥ÀÌÅÍÇÁ·¹ÀÓ¿¡ ÀúÀåµÈ µ¥ÀÌÅÍ¸¦ ÁÖ¾îÁø ±âÁØ¿¡ µû¶ó ±×·ìÀ¸·Î ¹­Àº µÚ ±×·ìÇÔ¼ö¸¦ Àû¿ëÇÏ°í ±× °á°ú¸¦ array Çü½ÄÀ¸·Î ¸®ÅÏÇÏ´Â ÇÔ¼ö 
tapply(emp$SALARY, emp$DEPARTMENT_ID, sum) ### tapply(): °¡·Î·Î ³ª¿­(array ¸ğ¾ç)
aggregate(SALARY ~ DEPARTMENT_ID, emp, sum) ### aggregate(): ¼¼·Î·Î ³ª¿­ 

tapply(emp$SALARY, c(emp$DEPARTMENT_ID, emp$JOB_ID), sum) ### BUT tapply()´Â combineÀÌ ¾È µÊ! 
tapply(emp$SALARY, list(emp$DEPARTMENT_ID, emp$JOB_ID), sum) ### c() ´ë½Å list()¸¦ »ç¿ë! => NAµéÀÌ ³ª¿À´Â °Ô ÁöÀúºĞÇÔ! 
tapply(emp$SALARY, list(emp$DEPARTMENT_ID, emp$JOB_ID), sum, default = 0) ### NA ´ë½Å 0¸¦ display ½ÃÅ´! 





##################################################################################################
##################################################################################################
##################################################################################################





# 07/30/2018

ls() ### ¸Ş¸ğ¸®¿¡ ¼±¾ğµÇ¾î ÀÖ´Â º¯¼ö¸í => ¿¹¾à¾î°¡ º¯¼ö·Î ¼³Á¤µÇ¾î ÀÖ´Â Áö È®ÀÎ! 
rm(y) ### º¯¼ö¸í »èÁ¦ 
rm(list=ls()) ### ¸ğµÎ »èÁ¦ => ÀÌ°Å ¼öÇàÇÏ°í ´Ù½Ã ls() ÇØº¸¸é, "character(0)"¶ó°í ¶ä! 



# Á¦¾î¹® <- if ±¸Á¶
## Á¶°ÇÀÇ Èå¸§À» Á¦¾îÇÏ´Â ¹æ¹ı



## 1. if¹®: Á¶°Ç¿¡ µû¶ó ¼­·Î ´Ù¸¥ ÄÚµå¸¦ ¼öÇàÇÏµµ·Ï ÇÏ´Â ¹®Àå 
### R¿¡¼­´Â {}·Î ±¸ºĞ! 
'''
if (Á¶°Ç) {
              Á¶°ÇÀÌ ÂüÀÏ ¶§ ¼öÇàÇÏ´Â ¹®Àå
} else {
              Á¶°ÇÀÌ °ÅÁşÀÏ ¶§ ¼öÇàÇÏ´Â ¹®Àå 
          }
'''

## ex. 
if(1<2){
  print("2°¡ 1º¸´Ù Å©´Ù")
}else{
  print("1Àº 2º¸´Ù ÀÛ´Ù")
}
ifelse(x%%2 == 0, "2ÀÇ ¹è¼ö", "2ÀÇ ¹è¼ö°¡ ¾Æ´Ï´Ù") ### print() ÇÔ¼ö¸¦ µû·Î ¾µ ÇÊ¿ä´Â ¾øÀ½! (ifelse() ÇÔ¼ö°¡ ÀÚµ¿À¸·Î ¸®ÅÏ!)

### sub if¹®µµ °¡´É! (elseÀı¿¡ ¶Ç´Ù¸¥ if¹®À» ÀÛ¼º)



## 2. ifelse() ÇÔ¼ö <- if¹®À» ÇÔ¼ö·Î ¿ä¾à 
### ifelse(Á¶°Ç, Âü, °ÅÁş)



## else¿¡ if¹® ÁßÃ¸ <- PLSQLÃ³·³ else if´Â ¸ø ¾¸! 
x <- 3
if (x==1) {'³²Àº ±â°£ ÃÖ¼±À» ´ÙÇÏÀÚ'
} else {if(x==2){'³»³â¿¡µµ ´Ù¸¥ ÇĞ¿ø ¶Ç ´Ù´ÏÁö ¹¹'
  } else { if(x==3) {'±×³É »ç´Â °ÅÁö ¹¹'}}
}



## 3. switch¹®
### switch(À§Ä¡º¯¼ö, ½ÇÇà¹®1, ½ÇÇà¹®2, ...) <- º¯¼ö°ª(1,2,3)¿¡ µû¶ó Á¶°Ç¿¡ ¸Â´Â ½ÇÇà¹®À» ¼öÇàÇÑ´Ù. 
### À§ÀÇ ÁßÃ¸ if¹®(else if¹®)À» °£¼ÒÈ­! 
x <- 3
switch(x,'³²Àº ±â°£ ÃÖ¼±À» ´ÙÇÏÀÚ','Çàº¹ÇÏÀÚ','°Ç°­ÇÏ°Ô »ìÀÚ') ### x º¯¼ö¿¡ À§Ä¡°ªÀ» °®°í ÀÖÀ¸¸é µÊ 

### À§Ä¡°ª µû·Î ÁöÁ¤! 
### switch(À§Ä¡º¯¼ö, À§Ä¡°ª = °ª, else°ª) <- À§Ä¡º¯¼ö¿¡´Â ¹«Á¶°Ç ´ÜÀÏ°ª¸¸ µé¾î°¥ ¼ö ÀÖÀ½! 
x <- '°­'
switch(x, '»ê' = 'ÇÑ¶ó»ê °¡°í ½Í´Ù', '¹Ù´Ù' = 'ÇÔ´öÇØ¼ö¿åÀå °¡°í ½Í´Ù', '±×³É ¹æÄÛÇÏ¼¼¿ä')



# ¹İº¹¹® 
## 1. for¹®
'''
for(º¯¼ö in µ¥ÀÌÅÍº¯¼ö) {
                         ¹İº¹¼öÇàÇÒ ¹®Àå
                        }
'''
for(i in 1:10){
                print(i)
}
### i <- ¼öÇàÇØ¾ßÇÒ °ª¸¸Å­ i°¡ ¼öÇàµÊ 
### ¾Æ·¡Ã³·³ µû·Î i <- i+1À» ¼³Á¤ÇÒ ÇÊ¿ä ¾øÀ½! 

## 2. while¹®
'''
while(Á¶°Ç¹®) {
                ¹İº¹¼öÇàÇÒ ¹®Àå
}
'''
i <- 1
while (i<=10) {
  print(i)
  i <- i+1 ### for¹®°úÀÇ Â÷ÀÌÁ¡! 
}

## 3. repeat(±âº» loop¹®) <- ¹«ÇÑ·çÇÁÀÇ ¿ì·Á! => break ¸í·É¹®À» ÅëÇØ ¹«ÇÑ·çÇÁ ¹æÁö! 
### break´Â while¹®ÀÌ³ª for¹®¿¡¼­µµ »ç¿ë °¡´É! 
'''
repeat {
        ¹İº¹¼öÇàÇÒ ¹®Àå
}
'''
i <- 1
repeat{
  print(i)
  if (i==10) {break}
  i <- i+1
}

x <- 1:5
for (i in x){
  if (i==3){
    break
  }
  print(i)
}

## cf. next: ÇØ´ç ¿ä¼Ò¸¦ skip!(3¸¸ Á¦³¢°í ³ª¸ÓÁö ¸®ÅÏ!)
x <- 1:5
for (i in x){
  if (i==3){
    next
  }
  print(i)
}





##################################################################################################
##################################################################################################
##################################################################################################





# 07/31/2018

### PLSQL -> mutating error(ÇÔ¼ö´Â Ç¥Çö½ÄÀÇ ÀÏºÎ·Î È£ÃâµÇ±â ¶§¹®¿¡, DML ÀÛ¾÷À» µ¿½Ã¿¡ ÇÏ´Â °æ¿ì, error ¹ß»ı!)
### Python -> ¸ğµâ½Ä °³¹ß ÆĞÅ°Áö(°ü·Ã¼º ÀÖ´Â ÇÁ·Î±×·¥µé¸¸ ¸ğ¾Æ ³õÀ½ => °ü¸® ÆíÇÔ!)
### ¹ÙÀÎµå º¯¼ö -> Åø¿¡ Á¾¼Ó // ÆĞÅ°Áö¸¦ ÀÌ¿ëÇÏ¸é global variableÀ» º¸´Ù Æí¸®ÇÏ°Ô »ç¿ë °¡´É! 



# ÇÔ¼ö(function)
## - »ç¿ëÀÚ°¡ Á¤ÀÇÇÏ´Â ÇÔ¼ö¸¦ »ı¼ºÇÒ ¼ö ÀÖ´Ù. (ÀÇµµÀûÀ¸·Î)
## - ÀÚÁÖ ¹İº¹µÇ¾î »ç¿ëÇÏ´Â ±â´ÉÀ» Á¤ÀÇÇÏ´Â ÇÁ·Î±×·¥ 
## - ÄÚµå °£´ÜÇØÁø´Ù. 

### ÄÚµå°¡ ¾îµò°¡¿¡´Â ÀúÀåµÇ¾î ÀÖÀ½ => ¼Ò½º ÄÚµå °¡Áö°í ÀÖ¾î¾ß ÇØ´ç ÇÔ¼ö¸¦ »ç¿ë °¡´É! 
### ±âº»ÀûÀ¸·Î Á¦°øÇÏ´Â ÇÔ¼ö ¿Ü¿¡´Â, °ü·Ã¼º ÀÖ´Â ÇÔ¼öµéÀ» ¸ğ¾Æ³õÀº ÆĞÅ°Áö¸¦ library()·Î È£ÃâÇØ¼­ »ç¿ëÇÏ´Â °Í! 

'''
ÇÔ¼öÀÌ¸§ <- function(){
                        ÇÔ¼ö ¼öÇàÇØ¾ß ÇÒ ÄÚµå
                        return(¹İÈ¯°ª) ### optional
}
'''
### º¯¼ö ¼³Á¤ÇÏµíÀÌ, ÇÔ¼öµµ "<-"¸¦ ÀÌ¿ëÇØ¼­ ¸¸µë! 

Sys.Date()

date1 <- function(){
  return(Sys.Date())
}
date1() ### ÇÔ¼ö·Î ÀÌ¿ë °¡´É! 

date2 <- function(){
  Sys.Date()
}

time <- function(){
  Sys.time()
}

date2()
time()
### return() ¾ø¾îµµ °¡´É! 

hap <- function(x,y){
  res <- x+y ### res: local variable(ÇÔ¼ö ³»¿¡¼­¸¸ »ç¿ëµÇ´Â º¯¼ö)
  return(res)
}
hap(1,2)



## °¡º¯ÀÎ¼ö
### ¸Å°³º¯¼öÀÇ °³¼ö¸¦ °¡º¯ÀûÀ¸·Î ¸¸µé°í ½ÍÀ» °æ¿ì => "..." <- º¯¼ö ÀÌ¸§À» ÀÌ·¸°Ô ¼³Á¤! 
f <- function(...){
  x <- list(...) ### "..."ÀÇ °ªÀÌ ÀÌ °÷¿¡ µé¾î¿È 
  for (i in x){
    print(i) ### Ãâ·ÂÀº º¤ÅÍ ¸ğ¾ç!
  }
}
f(1,2,3,4,5)
f('a','b','c','d')
### ¸Å°³º¯¼öÀÇ °³¼ö¿¡ »ó°ü¾øÀÌ ÇÔ¼ö°¡ ¼öÇàµÊ! 

f <- function(...){
  x <- c(...) ### combine c ½áµµ »ó°ü ¾øÀ½! 
  for (i in x){
    print(i)  
  }
}
f(1,2,3)



## ÁßÃ¸ÇÔ¼ö
### ÁßÃ¸µÈ ÇÔ¼ö´Â ÇÔ¼ö ³»ºÎ¿¡¼­ µû·Î È£Ãâ! 
f <- function(x,y){
  print(x)
  f2 <- function(y){
    y <- x*y ### y <- local variable
    print(y)
  }
  f2(y) ### ÀÌ°Å ¾øÀ¸¸é f2 ºÎºĞÀÇ ½ÇÇà°ªÀ» È®ÀÎÇÒ ¼ö ¾øÀ½! => ÁßÃ¸µÈ ÇÔ¼ö´Â ÇÔ¼ö ³»ºÎ¿¡¼­ µû·Î È£ÃâÇØ¾ß!! 
}
f(10,20)



## Àü¿ªº¯¼ö(global variable)
### ÇÔ¼ö¿¡ »ó°ü¾øÀÌ ÇÁ·Î±×·¥ ÀüÃ¼¿¡¼­ »ç¿ëÇÒ ¼ö ÀÖ´Â º¯¼ö 

## Áö¿ªº¯¼ö(local variable)
### ÇÔ¼ö ³»¿¡¼­ Á¤ÀÇµÇ°í »ç¿ëÇÏ´Â º¯¼ö 

## ¸Å°³º¯¼ö(parameter variable)
### ÇÔ¼öÀÇ ÀÎ¼ö¿¡¼­ ¹Ş¾Æ¼­ »ç¿ëÇÏ´Â º¯¼ö 

## a. "<-"
x <- 1 ; y <- 2 ; z <- 3 ### global variables
f <- function(x) {
  y <- x*10 ### "<-": local variableÃ³·³ »ç¿ë, ÇÁ·Î±×·¥ ¾È¿¡¼­¸¸ ¾²ÀÌ´Â º¯¼ö(global variable¿¡ ¿µÇâÀ» ÁÖÁö ¾ÊÀ½)
  print(x); print(y); print(z) ### x,z: global variables // y: local variable
}
f(x)
x ; y ; z ### À§ÀÇ f(x)ÀÇ ¸®ÅÏ°ª°ú´Â º°°³·Î ±×³É global variablesÀÇ °ª ¸®ÅÏ! (y°ª¿¡ ÁÖ¸ñ!)

## b. "<<-"
x <- 1 ; y <- 2 ; z <- 3 
f <- function(x) {
  y <<- x*10 ### "<<-": ¾Æ¿¹ »õ·Î¿î global variable·Î ´ëÃ¼(´Ü¼øÇÑ local variableÀÌ ¾Æ´Ï¶ó, global variable¿¡µµ ¿µÇâÀ» ÁØ´Ù´Â ¶æ!)
  print(x); print(y); print(z) 
}
f(x)
x ; y ; z ### ¾Æ±î¿Í´Â ´Ş¸®, global variable·Î¼­ÀÇ y°ªµµ ¹Ù²ñ!!! 

## c. "="
x <- 1 ; y <- 2 ; z <- 3 
f <- function(x) {
  y = x*10 ### "=": local variable!  
  print(x); print(y); print(z) 
}
f(x)
x ; y ; z

### À§¿¡ sum() ºÎºĞÀÇ global, local variablesÀÇ ¼³¸í ÇÑ ¹ø ´Ù½Ã È®ÀÎÇØº¸°í, ºñ±³ÇØº¼ °Í! 
sum(x1 <- c(1,2,3,4,5)) ; x1 ### local, BUT sum() ¹Û¿¡¼­µµ x1 »ç¿ë °¡´É(µû·Î º¯¼ö ¼±¾ğ±îÁö µÊ!)
sum(y1 <<- c(1,2,3,4,5)) ; y1 ### global
sum(z1 = c(1,2,3,4,5)) ; z1 ### local(sum() ¹Û¿¡¼­´Â z1 »ç¿ë ¸ø ÇÔ) <- °¡Àå local½º·¯¿ò! 



# merge(SQLÀÇ join ±â´É ¼öÇà!)
## µÎ µ¥ÀÌÅÍÇÁ·¹ÀÓÀÇ °øÅëµÈ °ªÀ» ±âÁØÀ¸·Î º´ÇÕÇÑ´Ù.
x1 <- data.frame(id = c(100,200,300), sql = c(70,90,80))
y1 <- data.frame(id = c(100,200,500), python = c(80,70,60))
rbind(x1,y1) ### ¿À·ù!(ÄÃ·³¸íÀÌ ´Ù¸£±â ¶§¹®)
cbind(x1,y1) ### ÀÌ»óÇÏ°Ô ºÙ¿©Áü! 

merge(x1,y1) ### ¼öÇàµÇ´Âµ¥, ÀÏÄ¡µÇ´Â °ª¸¸ ¸®ÅÏµÊ => µÎ µ¥ÀÌÅÍÇÁ·¹ÀÓÀÇ "°øÅë"µÈ °ª(id ÄÃ·³À» ±â¹İÀ¸·Î merge!) => ÀÏÄ¡µÇ´Â °ª¸¸ ³ª¿È! 
             ### => equi join°ú °°À½! (Å°°ªÀÌ ÀÏÄ¡µÇ´Â °Í¸¸ ÃßÃâ)
             ### natural join(join Á¶°Ç ¼ú¾î¸¦ RÀÌ ÀÚµ¿ÀûÀ¸·Î ¼³Á¤ => "°øÅëµÈ °ªÀ» ±âÁØÀ¸·Î º´ÇÕ")
merge(x1,y1,all=T) ### ÀÏÄ¡µÇÁö ¾ÊÀº °ª±îÁö ³ª¿È(full outer join)
merge(x1,y1,all.x = T) ### x1¿¡ ÀÖ´Â °ª(id = 300)¸¸ ¸®ÅÏ(ÀÏÄ¡µÇÁö ¾ÊÀº °ª Áß¿¡¼­) => left outer join
merge(x1,y1,all.y = T) ### x2¿¡ ÀÖ´Â °ª(id = 500)¸¸ ¸®ÅÏ(ÀÏÄ¡µÇÁö ¾ÊÀº °ª Áß¿¡¼­) => right outer join

x1 <- data.frame(id = c(100,200,300), sql = c(70,90,80))
x2 <- data.frame(id = c(100,200,300), sql = c(80,70,60))
x3 <- data.frame(no = c(100,200,500), python = c(80,60,70))

merge(x1,x3,all=T) ### µ¿ÀÏÇÑ ÄÃ·³ ÀÌ¸§ÀÌ ¾øÀ½! 
merge(x1,x3,by.x = 'id',by.y = 'no',all = T) ### x1ÀÇ 'id'¿Í x3ÀÇ 'no'¸¦ µ¿ÀÏÇÑ ÄÃ·³À¸·Î °£ÁÖ! 
                                             ### join ´ë»ó ÄÃ·³ ÀÌ¸§À» µû·Î ÁöÁ¤ => SQLÀÇ join onÀı°ú ºñ½ÁÇÑ ±â´É!(cf. natural join)

x4 <- merge(x1,x3,by.x = 'id',by.y = 'no',all = T) ; x4 ### ÄÃ·³ ÀÌ¸§ÀÌ id·Î µÇ¾î ÀÖÀ½!(Ã¹¹øÂ° DF¸¦ Áß½ÉÀ¸·Î!)

merge(x4,x2,by.x = 'id',by.y='id', all=T) ### SQL °ªµéÀÌ ¼­·Î ´Ù¸£±â ¶§¹®¿¡, º°·ÎÀÇ ÄÃ·³À» µû·Î ¸¸µë! 



dept <- read.csv("C://data/dept.csv", header = TRUE, stringsAsFactors = F)
View(dept)

w <- merge(emp,dept,by="DEPARTMENT_ID") ### "by = ±âÁØÄÃ·³" <- join usingÀı ¾²´Â °ÍÃ³·³ »ç¿ë! 
head(w)
v <- sqldf('select * from emp e join dept d where e.department_id = d.department_id')
head(v,5)

merge(emp,dept,by="DEPARTMENT_ID")[,c("LAST_NAME","DEPARTMENT_NAME")] ### joined table¿¡¼­ Æ¯Á¤ ÄÃ·³¸¸ È®ÀÎ
v[,c("LAST_NAME","LOCATION_ID")]





##################################################################################################
##################################################################################################
##################################################################################################





# 08/01/2018

# subset()
## Á¶°Ç¿¡ ¸¸Á·ÇÏ´Â µ¥ÀÌÅÍ¸¦ ¼±ÅÃ(ÇÊÅÍ¸µ)
## ÀÚµ¿ÀûÀ¸·Î NA¸¦ Ã³¸®ÇÔ! 
emp[emp$DEPARTMENT_ID == 20,]
subset(emp,DEPARTMENT_ID == 20) ### ¹Ù·Î À§ÀÇ ÄÚµå¿Í °°Àº Çà Á¦ÇÑ ±â´É ¼öÇà! => NA ÀÚµ¿À¸·Î Ã³¸®! 

emp[,c("LAST_NAME","SALARY","DEPARTMENT_ID")]
subset(emp, select = c(LAST_NAME, SALARY, DEPARTMENT_ID)) ### select = c() <- ÄÃ·³ ÃßÃâ °¡´É!(""´Â Á¦¿ÜÇÒ °Í!)

names(emp) ### DF¿¡ Æ÷ÇÔµÈ ÄÃ·³¸í È®ÀÎ °¡´É
emp[,names(emp) %in% c("LAST_NAME","SALARY","DEPARTMENT_ID")] ### À§¿Í °°À½ 
emp[,!names(emp) %in% c("LAST_NAME","SALARY","DEPARTMENT_ID")] ### ÇØ´ç ÄÃ·³À» Á¦¿ÜÇÑ ÄÃ·³µé È®ÀÎ °¡´É(! »ç¿ë)
subset(emp, select = -c(LAST_NAME, SALARY, DEPARTMENT_ID)) ### ÇØ´ç ÄÃ·³À» Á¦¿ÜÇÑ ÄÃ·³µé È®ÀÎ °¡´É(- »ç¿ë)

### subset(´ë»óµ¥ÀÌÅÍ, ÇàÁ¦ÇÑ, select = c(¿­ÃßÃâ))
subset(emp, SALARY >= 10000, select = -c(LAST_NAME, SALARY, DEPARTMENT_ID)) ### Çà Á¦ÇÑ
emp[emp$SALARY >= 10000,!names(emp) %in% c("LAST_NAME","SALARY","DEPARTMENT_ID")]



# sqldf() ¸Ş¼Òµå 
## SQLÀ» ÀÌ¿ëÇØ¼­ µ¥ÀÌÅÍ¸¦ Ã³¸®ÇÑ´Ù. 
## MySQL, SQLlite ±â¹İ! 
install.packages('sqldf')
library(sqldf)

sqldf('select * from emp')
sqldf('select * from dept')
sqldf('select * from loc')
sqldf('select job_id from emp')
sqldf('select distinct job_id from emp') ### unique() ±â´É 
sqldf('select * from emp where department_id = 20') ### whereÀı: Çà Á¦ÇÑ // selectÀı: ¿­ ÃßÃâ 
sqldf('select * from emp limit 10') ### 10°³ÀÇ Æ©ÇÃ¸¸ º¸¿©´Ş¶ó´Â ¶æ <- head() ±â´É
sqldf('select last_name, salary from emp order by salary desc') ### doBy ÆĞÅ°ÁöÀÇ orderBy() ±â´É 
sqldf('select last_name as name, salary from emp order by salary desc') ### names() ±â´É(alias)
sqldf('select count(*) from emp')

length(emp) ### ÄÃ·³ÀÇ °³¼ö
NROW(emp) ### Æ©ÇÃÀÇ °³¼ö
sum(emp$SALARY)
mean(emp$SALARY)
sd(emp$SALARY)
var(emp$SALARY)
max(emp$SALARY)
min(emp$SALARY)

c(NROW(emp), sum(emp$SALARY), mean(emp$SALARY), sd(emp$SALARY), var(emp$SALARY), max(emp$SALARY), min(emp$SALARY))
sqldf('select count(employee_id), sum(salary), avg(salary), variance(salary), stdev(salary), max(salary), min(salary) from emp')

sqldf('select department_id, sum(salary) from emp group by department_id')
sqldf('select department_id, sum(salary) from emp group by department_id having sum(salary) >= 20000')
sqldf('select department_id, job_id, sum(salary) from emp group by department_id having sum(salary) >= 20000') ### group byÀı¿¡ job_id°¡ ºüÁ³´Â µ¥µµ ¿À·ù°¡ ¾È ³²! => BUT °á°ú°ªÀÌ ´Ù¸§! 
sqldf('select department_id, job_id, sum(salary) from emp group by department_id, job_id having sum(salary) >= 20000')

sqldf('select last_name, upper(last_name), lower(last_name), substr(last_name,1,2), length(last_name), 
      leftstr(last_name,2), rightstr(last_name,2), reverse(last_name)
      from emp') ### leftstr(): ¿ŞÂÊ ¸î ±ÛÀÚ¸¸ ÃßÃâ // rightstr(): ¿À¸¥ÂÊ ¸î ±ÛÀÚ ÃßÃâ // reverse(): ±ÛÀÚ¸¦ ¹İ´ë·Î 

sqldf('select * from emp where department_id is null') ### SQLÀÇ NULL = RÀÇ NA
sqldf('select * from emp where department_id in (10,20)')
sqldf('select * from emp where salary between 10000 and 20000')

sqldf('select e.last_name, d.department_name
      from emp e, dept d
      where e.department_id = d.department_id') ### Oracle Çü½Ä 
sqldf('select e.last_name, d.department_name
      from emp e join dept d
      on e.department_id = d.department_id') ### ANSI Ç¥ÁØ 
sqldf('select e.last_name, d.department_name
      from emp e join dept d
      using(department_id)')
sqldf('select e.last_name, d.department_name
      from emp e left outer join dept d
      on e.department_id = d.department_id') 
sqldf('select e.last_name, d.department_name
      from emp e right outer join dept d
      on e.department_id = d.department_id') ### ¿À·ù! (right outer joinÀ» Á¦°øÇÏÁö ¾ÊÀ½) => ±×³É Å×ÀÌºí ÀÌ¸§ÀÇ À§Ä¡¸¸ ¹Ù²Ù¸é µÊ! 
sqldf('select e.last_name, d.department_name
      from emp e full outer join dept d
      on e.department_id = d.department_id') ### ¿À·ù! (full outer joinÀ» Á¦°øÇÏÁö ¾ÊÀ½)

sqldf('select e.last_name, d.department_name
      from emp e left outer join dept d
      on e.department_id = d.department_id
      union
      select e.last_name, d.department_name
      from dept d left outer join emp e
      on e.department_id = d.department_id') ### unionÀ» »ç¿ëÇÔÀ¸·Î¼­ full outer joinÀÇ °á°ú¸¦ ¾òÀ» ¼ö ÀÖÀ½! (Áßº¹ Á¦°Å)

sqldf('select e.last_name, d.department_name
      from emp e left outer join dept d
      on e.department_id = d.department_id
      union all
      select e.last_name, d.department_name
      from dept d left outer join emp e
      on e.department_id = d.department_id') 

sqldf('select e.last_name, d.department_name
      from emp e left outer join dept d
      on e.department_id = d.department_id
      intersect
      select e.last_name, d.department_name
      from dept d left outer join emp e
      on e.department_id = d.department_id') 

sqldf('select e.last_name, d.department_name
      from emp e left outer join dept d
      on e.department_id = d.department_id
      except
      select e.last_name, d.department_name
      from dept d left outer join emp e
      on e.department_id = d.department_id') ### minus <- ¿À·ù! 

sqldf('select * from emp
      where salary > (select salary from emp where employee_id = 150)') ### subquery(whereÀı¿¡ select¹®)µµ °¡´É! (Inline View(fromÀı¿¡ select¹®)µµ °¡´É!)

### ³¯Â¥ <- Å¸ÀÔ Ã¼Å©°¡ ÇÊ¿äÇÔ!(Date Å¸ÀÔÀ¸·Î´Â ¾È µÇ°í, char Å¸ÀÔÀÌ¾î¾ß ÇÔ!)
emp$HIRE_DATE <- ymd(emp$HIRE_DATE)
sqldf('select * from emp where hire_date > "2002-01-01"') 

sqldf('select 1+2') ### dual Á¦°ø ¾È ÇÔ! 





##################################################################################################
##################################################################################################
##################################################################################################





# 08/02/2018

fruits <- read.csv("C://data/fruits_sales.csv",stringsAsFactors = F)
View(fruits)



aggregate(SALARY ~ DEPARTMENT_ID, emp, mean) ### group byÀı »ı°¢! DEPARTMENT_ID¿¡ NA¿¡ ÇØ´çµÇ´Â µ¥ÀÌÅÍ »ı·«µÊ! 
aggregate(SALARY ~ DEPARTMENT_ID + JOB_ID, emp, mean)

# ddply
## µ¥ÀÌÅÍÇÁ·¹ÀÓÀ» ºĞÇÒÇÏ°í ÇÔ¼ö¸¦ Àû¿ëÇÑ µÚ µ¥ÀÌÅÍÇÁ·¹ÀÓÀ¸·Î °á°ú¸¦ ¹İÈ¯ÇÏ´Â ÇÔ¼ö
install.packages("plyr")
library(plyr)

## ddply(data, ±âÁØÄÃ·³, ÇÔ¼ö) 
### data.frameÀ» ÀÔ·Â°ªÀ¸·Î ¹Ş¾Æ¼­ data.frameÀ¸·Î ¸®ÅÏ
ddply(emp, 'DEPARTMENT_ID', summarise, avg_sal = mean(SALARY)) ### NA±îÁö Æ÷ÇÔ! (avg_salÀÌ¶ó´Â º°µµÀÇ ÄÃ·³À» ¸¸µé¾î¼­ data.frameÀ» ±¸¼º!)

## summarise: ±âÁØÄÃ·³ÀÇ µ¥ÀÌÅÍ³¢¸® ¸ğÀº ÈÄ ÇÔ¼ö¿¡ Àû¿ë 
### ±»ÀÌ rbind()ÇÒ ÇÊ¿ä ¾øÀÌ ÀÚµ¿ÀûÀ¸·Î NA ¹İ¿µ! 
ddply(emp, c('DEPARTMENT_ID','JOB_ID'), summarise, avg_sal = mean(SALARY))
ddply(emp, 'DEPARTMENT_ID', summarise, avg_sal = mean(SALARY), sum_sal = sum(SALARY)) ### º°µµÀÇ ¿­À» °è¼Ó ¸¸µé¾î¼­ ±×·ì ÇÔ¼ö¸¦ Âß ³ª¿­ÇÒ ¼ö ÀÖÀ½! 
ddply(emp, 'DEPARTMENT_ID', summarise, cn = length(EMPLOYEE_ID), avg_sal = mean(SALARY), sum_sal = sum(SALARY))

## transform: °¢ Çàº°(name, year)·Î ¿¬»êÀ» ¼öÇàÇØ¼­ Çà´ç°ªÀ» Ãâ·ÂÇÏ´Â ±â´É 
ddply(fruits,"name",transform,'s_qty'=sum(qty)) ### °úÀÏÀÇ ÆÇ¸Å º¯µ¿ ÇöÈ²À» ÆÄ¾ÇÇÏ´Â °ÍÀÌ °¡´É! (s_qty: Áö³­ 4³â °£ ÆÇ¸ÅµÈ ÇØ´ç °úÀÏÀÇ ÃÑÇÕ)
ddply(fruits,"year",transform,'s_qty'=sum(qty)) ### ¿¬µµ º°·Î Á¤·Ä! 
ddply(fruits,"name",transform,'s_qty'=sum(qty), pct_qty=(100*qty)/(sum(qty))) ### pct_qty: ÃÑÇÕ ´ëºñ ÇØ´ç °úÀÏÀÇ ÆÇ¸Å ºñÀ² 
ddply(fruits,"year",transform,'s_qty'=sum(qty), pct_qty=(100*qty)/(sum(qty))) ### ¿¬µµ(year)¸¦ ±âÁØÀ¸·Î! (ÇØ´ç "¿¬µµ"ÀÇ ÆÇ¸Å·® ÇÕÀÌ 100)



# dplyr
## ÇÊÅÍ ±â´É! 
install.packages('dplyr')
library(dplyr)

emp[emp$DEPARTMENT_ID==20,]
emp %>% filter(DEPARTMENT_ID==20) ### Çà Á¦ÇÑ 
emp %>% select(SALARY) ### ¿­ ÃßÃâ 

## filter: Á¶°ÇÀ» Áà¼­ ÇÊÅÍ¸µÇÏ´Â ÇÔ¼ö <- whereÀı(SQL)
filter(emp,DEPARTMENT_ID==20) ### ÀÚ¹ßÀûÀ¸·Î NA°¡ ºüÁü! (just like subset())

emp[emp$DEPARTMENT_ID==20,c("LAST_NAME","SALARY")]
filter(emp,DEPARTMENT_ID==20)[,c("LAST_NAME","SALARY")]
filter(emp,DEPARTMENT_ID==20)[,2:5]
filter(emp,DEPARTMENT_ID==30 & SALARY>=3000)[,1:5]

## select: ¿©·¯ ÄÃ·³ÀÌ ÀÖ´Â µ¥ÀÌÅÍÇÁ·¹ÀÓ¿¡¼­ Æ¯Á¤ ÄÃ·³¸¸ ¼±ÅÃ»ç¿ë 
select(emp,LAST_NAME,SALARY)
select(emp,1,2)
select(emp,1:5)
select(emp,2,4,6)
select(emp,-SALARY,-COMMISSION_PCT)

## %>%: ¿©·¯ ¹®ÀåÀ» Á¶ÇÕÇØ¼­ »ç¿ëÇÏ´Â ¹æ¹ıÀ» Á¦°ø 
emp %>% select(LAST_NAME,JOB_ID,SALARY) %>% filter(SALARY >= 2000) ### ¿­ ÃßÃâ(select)ºÎÅÍ ÇÑ ´ÙÀ½, Çà Á¦ÇÑ(filter) 
emp %>% select(LAST_NAME,JOB_ID,SALARY) %>% filter(SALARY >= 10000) %>% head(3)
emp %>% select(LAST_NAME,JOB_ID,SALARY) %>% filter(SALARY >= 10000) %>% arrange(SALARY) ### arrange(): Á¤·Ä(¿À¸§Â÷¼ø)
emp %>% select(LAST_NAME,JOB_ID,SALARY) %>% filter(SALARY >= 10000) %>% arrange(desc(SALARY)) ### ³»¸²Â÷¼ø 

## mutate: »õ·Î¿î ÄÃ·³À» Ãß°¡
emp$SAL <- emp$SALARY * 12 ### ÄÃ·³ Ãß°¡ 
emp$SAL <- NULL ### ÄÃ·³ »èÁ¦ 

df <- mutate(emp,sal=SALARY * 12)
str(df)

emp %>% 
  select(LAST_NAME,JOB_ID,SALARY,COMMISSION_PCT) %>% 
  mutate(ANNUAL_SAL = SALARY * 12 + ifelse(is.na(COMMISSION_PCT),0,SALARY*COMMISSION_PCT)) %>% 
  arrange(desc(ANNUAL_SAL))

emp %>% 
  select(LAST_NAME,JOB_ID,SALARY,COMMISSION_PCT,DEPARTMENT_ID) %>% 
  mutate(ANNUAL_SAL = SALARY * 12 + ifelse(is.na(COMMISSION_PCT),0,SALARY*COMMISSION_PCT)) %>% 
  arrange(DEPARTMENT_ID,desc(ANNUAL_SAL)) ### DEPARTMENT_ID ¿À¸§Â÷¼ø, ANNUAL_SAL ³»¸²Â÷¼ø 

## summarise: ÁÖ¾îÁø µ¥ÀÌÅÍ Áı°è 
### data.frameÀ¸·Î ¸®ÅÏ(ÄÃ·³ÀÇ Å¸ÀÔµµ º¸¿©ÁÜ!)
emp %>% summarise(sum_sal=sum(SALARY),mean_sal=mean(SALARY)) ### ¿©·¯ Áı°è°ªÀ» ³ª¿­ÇÏ´Â °ÍÀÌ °¡´É! 
emp %>% summarise(max_sal=max(SALARY),min_sal=min(SALARY))
emp %>% group_by(DEPARTMENT_ID) %>% summarise(sum_sal = sum(SALARY), mean_sal = mean(SALARY)) ### group_by(): ºÎ¼­ º°·Î Áı°è!(NAµµ Æ÷ÇÔµÊ!) => data.frame
emp %>% group_by(JOB_ID) %>% summarise(sum_sal = sum(SALARY), mean_sal = mean(SALARY))
emp %>% group_by(DEPARTMENT_ID,JOB_ID) %>% summarise(sum_sal = sum(SALARY), mean_sal = mean(SALARY)) ### 2°³ÀÇ ÄÃ·³¿¡ ´ëÇÑ Áı°èµµ °¡´É! 
emp %>% summarise_at(c("SALARY","COMMISSION_PCT"),sum,na.rm=T) ### summarise_at(): °¢°¢ÀÇ ±×·ì(ÄÃ·³)¿¡ ´ëÇÑ sumÀ» ÇÏ¶ó´Â ¶æ! (SALARY¿¡ ´ëÇÑ sum, COMMISSION_PCT¿¡ ´ëÇÑ sum)
emp %>% summarise_if(is.numeric,sum,na.rm=T) ### numeric Å¸ÀÔ¿¡ ´ëÇØ¼­´Â sum ¼öÇà 





##################################################################################################
##################################################################################################
##################################################################################################





# 08/03/2018

sales <- fruits ; View(sales)
str(sales)
### °¡·Î ¸ğ¾çÀ» ¼¼·Î ¸ğ¾çÀ¸·Î ¹Ù²Ù´Â ÇÔ¼ö

install.packages('reshape2')
library(reshape2)

# melt(): ÄÃ·³ÀÌ ¸¹Àº ÇüÅÂ(wide)¸¦ ¼¼·Î ¹æÇâ ±ä(long) ÇüÅÂ·Î º¯°æ
## ¿­ÀÌ Çà °ªÀ¸·Î µé¾î°¨ 
melt(sales,id='year') ### year¸¦ ±âÁØÀ¸·Î ÇØ¼­ name±îÁö variable¿¡ µé¾î°¨! => variable°ú value¶ó´Â º°µµÀÇ ÄÃ·³ÀÌ ¸¸µé¾îÁü!(±âÁ¸¿¡ ¿­ÀÌ¾ú´ø name, year, qty, price°¡ Çà °ªÀ¸·Î µé¾î°¨!)
melt(sales,id='name') ### name ±âÁØ
m <- melt(sales,id=c('year','name')) ; m

# dcast(): long(¼¼·Î ¹æÇâ)À» wide(°¡·Î ¹æÇâ) ÇüÅÂ·Î ¹Ù²ãÁÜ
## º¯¼ö º° Áı°è °¡´É!
dcast(m, year+name ~ variable) ### ¿ø À§Ä¡! 
dcast(m, name ~ variable, sum) ### Áı°èµµ °¡´É!! 
dcast(m, year ~ variable, sum)



'''
¡á grepÇÔ¼ö : ¹®ÀÚ ÆĞÅÏÀ» Ã£À» ¶§ »ç¿ëµÇ´Â ÇÔ¼ö 

^ : Ã¹¹øÂ° 
$ : ¸¶Áö¸·
. : ÇÑÀÚ¸®¼ö
* : wild card(%)

<¿¹>
  emp[grep("aa", emp$LAST_NAME),c("LAST_NAME","SALARY")]

emp[grep("[x-z]", emp$LAST_NAME, ignore.case = TRUE),c("LAST_NAME","SALARY")]

ignore.case = TRUE ´ë¼Ò¹®ÀÚ ±¸ºĞ¾ÈÇÑ´Ù.
ignore.case = FALSE ´ë¼Ò¹®ÀÚ ±¸ºĞÇÑ´Ù.
'''
# grep(): µ¿ÀÏÇÑ ¹®ÀÚ¿­À» ¹®ÀÚ¿­ º¤ÅÍ¿¡¼­ Ã£¾Æ¼­ ÀÎµ¦½º ¹øÈ£¸¦ ¸®ÅÏÇÏ´Â ÇÔ¼ö 
## grep('¹®ÀÚ¿­',µ¥ÀÌÅÍ) -> ÀÎµ¦½º ¹øÈ£
## grep('¹®ÀÚ¿­',µ¥ÀÌÅÍ,value = TRUE) -> ½ÇÁ¦ µ¥ÀÌÅÍ°ª 
text <- c('a','ab','acb','accb','accccb')
grep('a',text) ### ÀÎµ¦½º ¹øÈ£ ¸®ÅÏ! -> ÇÑ ±ÛÀÚ¸¸ ³Ö¾úÀ» ¶§´Â ±× ¹®ÀÚ°¡ Æ÷ÇÔµÈ ¸ğµç ¿ä¼Ò ¹øÈ£¸¦ ¸®ÅÏ
grep('ab',text) ### 2±ÛÀÚ, 3±ÛÀÚ ³ÖÀ» ¶§´Â Á¤È®È÷ ÀÏÄ¡ÇÏ´Â ¹®ÀÚÀÇ ¿ä¼Ò ¹øÈ£¸¸ ¸®ÅÏ! 
grep('c',text,value = TRUE) ### "value = TRUE": ÀÎµ¦½º°¡ ¾Æ´Ñ ½ÇÁ¦ °ªÀ¸·Î ¸®ÅÏ! 

## *: Àû¾îµµ 0¹ø ¸ÅÄªÇÏ¸é Ã£´Â´Ù 
grep('ac*b',text,value = TRUE) ### * ¾ÕÀÇ ±ÛÀÚ: option ±ÛÀÚ <- a¿Í b´Â ¹«Á¶°Ç Æ÷ÇÔµÇ¾î¾ß ÇÏ´Âµ¥, c´Â ¾È ³ª¿Íµµ µÇ°í, ÇÏ³ª¸¸ ³ª¿Íµµ µÇ°í, ¿©·¯ °³°¡ ³ª¿Íµµ µÊ! 

## +: Àû¾îµµ 1¹ø ¸ÅÄªÇÏ¸é Ã£´Â´Ù 
grep('ac+b',text,value = TRUE)

## ?: ÃÖ´ë 1¹ø ¸ÅÄªÇÏ¸é Ã£´Â´Ù(0¹ø or 1¹ø ¸ÅÄª)
grep('ac?b',text,value = TRUE) ### c¸¦ Æ÷ÇÔÇÏÁö ¾Ê´Â ¹®ÀÚ¿­µµ ¸®ÅÏ 

## {}: "¹Ù·Î ¾Õ"¿¡ ÀÖ´Â ¹®ÀÚ°¡ {} ¾È¿¡ ÀÖ´Â ¼ıÀÚ¸¸Å­ ¸ÅÄªÇÏ¸é Ã£´Â´Ù
grep('ac{2}b',text,value = TRUE) ### {n}: n¹ø ¸ÅÄª 
grep('ac{3}b',text,value = TRUE)
grep('ac{4}b',text,value = TRUE)

grep('ac{2,}b',text,value = TRUE) ### {n,}: n¹ø ÀÌ»ó ¸ÅÄªÇÏ¸é Ã£´Â´Ù 
grep('ac{1,4}b',text,value = TRUE) ### {n,m}: n¹ø ÀÌ»ó m¹ø ÀÌÇÏ ¸ÅÄªÇÏ¸é Ã£´Â´Ù <- {} ¾È¿¡ ÀÎ¼ö°ªÀ» 3°³ ³ÖÀ» ¼ö´Â ¾øÀ½! 
grep('ac{,2}b',text,value = TRUE) ### {,n}: n¹ø ÀÌÇÏ ¸ÅÄªÇÏ¸é Ã£´Â´Ù(0~n)



text <- c('abcd','cdab','cabd','c abd')
grep('ab',text,value = TRUE)
grep('^ab',text,value = TRUE) ### ^: ½ÃÀÛ(ab·Î ½ÃÀÛ) cf. 'c abd' <- ab ¾Õ¿¡ °ø¹é ¹®ÀÚ°¡ ÀÖÀ½(¸®ÅÏµÇÁö ¾ÊÀ½!)
grep('ab$',text,value = TRUE) ### $: ³¡(ab·Î ³¡³ª´Â °Å)

## \\b: °ø¹é ¹®ÀÚ µÚ¿¡ ÀÖ´Â °Íµéµµ °°ÀÌ ¸®ÅÏ <- ^¿ÍÀÇ Â÷ÀÌÁ¡¿¡ ÁÖ¸ñ! 
grep('\\bab',text,value = TRUE) ### \\b: ab·Î ½ÃÀÛµÇ´Â ±ÛÀÚµé Áß¿¡, blank µÚ¿¡ ÀÖ´Â °Íµéµµ ¸®ÅÏ('c abd'µµ ¸®ÅÏµÊ!) <- ^ vs. \\b



text <- c('^ab','ab','abc','abd','abe','ab 12', '$ab')
grep('ab',text,value = TRUE)
grep('^ab',text,value = TRUE) ### '^ab' Á¦¿Ü
grep('\\bab',text,value = TRUE) ### '^ab' Æ÷ÇÔ

## .: ¾î¶² ¹®ÀÚ ÇÏ³ª ¸ÅÄª 
grep('ab.',text,value = TRUE) ### .: ab µÚ¿¡ ¹«Á¶°Ç ¹®ÀÚ ÇÏ³ª´Â ¿Í¾ß ÇÔ!(°ø¹é ¹®ÀÚµµ Àû¿ëµÊ)

## [n,m]: [..] ¸®½ºÆ® ¾È¿¡ ÀÖ´Â ¹®ÀÚ ¸ÅÄª  
grep('ab[c,e]',text,value = TRUE) ### [c,e]: ab µÚ¿¡ c ¶Ç´Â e°¡ ¿Í¾ß ÇÔ! 

## [n-m]: nºÎÅÍ m±îÁö ¹®ÀÚ ¸ÅÄª 
grep('ab[c-e]',text,value = TRUE) ### cºÎÅÍ e±îÁö!(d Æ÷ÇÔ!!)

## [^n]: NOTÀÇ ÀÇ¹Ì! 
grep('ab[^c]',text,value = TRUE) ### ¼¼¹øÂ° À§Ä¡¿¡ c¸¸ ¾Æ´Ï¸é ´Ù ¸®ÅÏ! 

grep('[a-z]',text,value = TRUE)
grep('^[a-z]',text,value = TRUE)
grep('[^(a-z)]',text,value = TRUE)
text

## \\Æ¯¼ö¹®ÀÚ: Æ¯¼ö¹®ÀÚ·Î ½ÃÀÛµÇ´Â ±ÛÀÚ¸¦ ¸®ÅÏ 
grep('\\^',text,value = TRUE) ### \\^: ^·Î ½ÃÀÛµÇ´Â ±ÛÀÚ¸¦ Ã£´Â´Ù
grep('\\$',text,value = TRUE)
grep('$',text,value = TRUE) ### ±×³É ¸ğµç °É ´Ù Ã£À½ => $¸¸ Æ÷ÇÔµÈ ¹®ÀÚ¸¦ Ã£°í ½ÍÀ¸¸é, \\¸¦ »ç¿ëÇØ¾ß ÇÔ! 



text <- c('sql','SQL','Sql100','PLSQL','plsql','R','r','r0','python','PYTHON','pyth0n','python#','100')
text <- c('sql','SQL','Sql100','PLSQL','plsql','R','r','r0','python','PYTHON','pyth0n','python#','100','*','$','^')
text <- c('sql','SQL','Sql100','PLSQL','plsql','R','r','r0','python','PYTHON','pyth0n','python#','100','*','$','^','+','*100','$$','#$%','ªÒªéª«ªÊ','ùÓí®','ÇÑ±Û','¡Ú')
grep('[0-9]',text,value = T) ### ¼ıÀÚ¿­ÀÌ Æ÷ÇÔµÈ ¸ğµç ¿ä¼Ò ¸®ÅÏ <- ¾ËÆÄºª o¸¦ ¼ıÀÚ 0À¸·Î Àß¸ø ±âÀÔÇÑ °ÍµéÀ» ÃßÃâÇÒ ¶§ ¾²ÀÓ! 
grep('[[:digit:]]',text,value = T) ### ¼ıÀÚ°¡ Æ÷ÇÔµÈ ¿ä¼Ò ¸®ÅÏ <- À§ÀÇ [0-9]ÀÇ °á°ú¿Í °°À½ 
grep('[[:upper:]]',text,value = T) ### ´ë¹®ÀÚ¸¸ ¸®ÅÏ
grep('[[:lower:]]',text,value = T) ### ¼Ò¹®ÀÚ¸¸ ¸®ÅÏ
grep('[[:alpha:]]',text,value = T) ### char Å¸ÀÔ¸¸ ¸®ÅÏ
grep('[[:alnum:]]',text,value = T) ### ¼ıÀÚ±îÁö ¸®ÅÏ! (alpha + number)
grep('[[:punct:]]',text,value = T) ### ±¸µÎÁ¡ÀÌ Æ÷ÇÔµÈ ¹®ÀÚ¿­ ¸®ÅÏ(, . # µîµî)

text[gregexpr('[*|$|^]',text) == 1]
text[which(gregexpr('[*|$|^]',text) == 1)] 

setdiff(text[gregexpr('[*|$|^]',text) == 1], grep('[[:digit:]]',text,value = T)) ### '*100' Á¦¿Ü! 

x <- unlist(strsplit(grep('[[:punct:]]',text,value = T), split = "")) ; x
x[-grep('[a-z]',x)]

x <- grep('[^[:alnum:]]$',text,value = T) ; x
y <- grep('^[^[:alnum:]]',text,value = T) ; y
intersect(x,y)
grep('^*[^[:alnum:]]*$',text,value = T)
grep('^*[[:punct:]]*$',text,value = T)



grep('Steven',emp$FIRST_NAME,value = T)
grep('Stephen',emp$FIRST_NAME,value = T)
grep('Steven|Stephen',emp$FIRST_NAME,value = T)
gregexpr('Ste(v|ph)en',emp$FIRST_NAME)==1 ### À§Ä¡°ª(TRUE or FALSE)
emp[gregexpr('Ste(v|ph)en',emp$FIRST_NAME)==1,] ### Æ©ÇÃ °Ë»ö 

x <- c('Steven','Stephen')
grep(x,emp$FIRST_NAME,value = T) ### ¿À·ù!
grep(paste(x,collapse = "|"),emp$FIRST_NAME,value = T)



# stringr ÆĞÅ°Áö 
# str_detect(): Æ¯Á¤ ¹®ÀÚ°¡ ÀÖ´ÂÁö¸¦ °Ë»çÇØ¼­ TRUE/FALSE¸¦ Ãâ·ÂÇÏ´Â ÇÔ¼ö 
## ±ÛÀÚ Ã£´Â °Å(grep()¿Í ±â´É ºñ½Á)
## grepÃ³·³ ^,.,$ ±â´É »ç¿ë °¡´É! 
text
str_detect(text,'SQL') ### text º¯¼ö ¾È¿¡ 'SQL'ÀÌ¶ó´Â ¹®ÀÚ¸¸ Ã£´Â °Å -> TRUE/FALSE
text[str_detect(text,'SQL')] ### ½ÇÁ¦ µ¥ÀÌÅÍ°ª ¸®ÅÏ
which(str_detect(text,'SQL')) ### ÀÎµ¦½º 
str_detect(text,'^s') ### ¼Ò¹®ÀÚ s·Î ½ÃÀÛµÇ´Â ³à¼®µé º¸´Â °Å
text[str_detect(text,'n$')]
text[str_detect(text,'^[sS]')] ### ´ë¹®ÀÚ S ¶Ç´Â ¼Ò¹®ÀÚ s·Î ½ÃÀÛÇÏ´Â °Å 
text[str_detect(text,'[qQ]')] ### ´ë¹®ÀÚ Q ¶Ç´Â ¼Ò¹®ÀÚ q¸¦ Æ÷ÇÔÇÏ´Â °Å
text[str_detect(text,regex('s', ignore_case = T))]
text[str_detect(text,'[sS]')]

## str_count(): ÁÖ¾îÁø ´Ü¾î¿¡¼­ ÇØ´ç ±ÛÀÚ°¡ ¸î ¹ø ³ª¿À´ÂÁö ¾Ë·ÁÁÖ´Â ÇÔ¼ö 
text <- c('sqls','ssqls')
str_count(text,'s') ### Ã¹¹øÂ° ¿ä¼Ò¿¡ s°¡ 2°³ Æ÷ÇÔµÇ¾î ÀÖ°í, µÎ¹øÂ° ¿ä¼Ò¿¡ 3°³ Æ÷ÇÔµÇ¾î ÀÖÀ½À» ¾Ë·ÁÁÜ! 
str_count(text,'S') ### ´ë¼Ò¹®ÀÚ ±¸ºĞ! 
str_count(text,'[sS]') ### ´ë¹®ÀÚ S¿Í ¼Ò¹®ÀÚ s ¸ğµÎ ¹İ¿µ! 

## str_c(): ¹®ÀÚ¿­ ÇÕÃÄ¼­ Ãâ·ÂÇÏ´Â ÇÔ¼ö <- paste0()
str_c('R','ºòµ¥ÀÌÅÍ ºĞ¼®')
text <- 'R'
str_c('ÇÁ·Î±×·¥ ¾ğ¾î : ',text)
str_c(text,' Àº µ¥ÀÌÅÍ ºĞ¼®ÇÏ±â À§ÇØ ÁÁÀº ¾ğ¾î´Â ',text,'ÀÌ´Ù')
text <- c('R','ºòµ¥ÀÌÅÍ ºĞ¼®')
str_c(text,collapse=' ')
str_c(text,collapse=',') ### collapse ÀÛ¾÷ÇÏ°í ½ÍÀ¸¸é, º¤ÅÍ º¯¼ö¿¡ µû·Î Áı¾î ³Ö¾î¼­ str_c() ÇÔ¼ö¸¦ ¼öÇàÇØ¾ß ÇÔ! 

## str_dup(): ÁÖ¾îÁø ¹®ÀÚ¿­À» ÁÖ¾îÁø È½¼ö¸¸Å­ ¹İº¹ÇØ¼­ Ãâ·ÂÇÏ´Â ÇÔ¼ö
str_dup('ÆÄµµ ¼Ò¸® µè°í ½Í´Ù',10) ### 10¹ø ¹İº¹ 

## str_length(): ÁÖ¾îÁø ¹®ÀÚ¿­ÀÇ ±æÀÌ¸¦ Ãâ·ÂÇÏ´Â ÇÔ¼ö
str_length('ÇØ¿î´ë°¡°í½Í´Ù')

## str_locate(): ÁÖ¾îÁø ¹®ÀÚ¿­¿¡¼­ Æ¯Á¤ ¹®ÀÚ°¡ Ã³À½À¸·Î ³ª¿À´Â À§Ä¡ 
str_locate('january','a') ### start: Ã³À½À¸·Î ³ª¿À´Â À§Ä¡
str_locate_all('january','a') ### ³¡¿¡ ³ª¿À´Â À§Ä¡±îÁö È®ÀÎ °¡´É 
str_locate_all('janauary','a') ### Áß°£¿¡ ³ª¿À´Â À§Ä¡µµ È®ÀÎ °¡´É! 

## str_replace(): ÁÖ¾îÁø ¹®ÀÚ¿­¿¡¼­ º¯°æ Àü ¹®ÀÚ¸¦ º¯°æ ÈÄ ¹®ÀÚ·Î ¹Ù²Ù´Â ÇÔ¼ö 
### str_replace(¿øº»,±âÁ¸¹®ÀÚ¿­,»õ·Î¿î¹®ÀÚ¿­)
str_replace('ºòµ¥ÀÌÅÍºĞ¼®','ºòµ¥ÀÌÅÍ','°¡Ä¡')
str_replace('banana','a','*') ### Ã¹¹øÂ° °Í¸¸ ¹Ù²ñ 
str_replace_all('banana','a','*')

## str_split(): ÁÖ¾îÁø µ¥ÀÌÅÍ¼Â¿¡¼­ ÁöÁ¤µÈ ±âÈ£¸¦ ±âÁØÀ¸·Î ºĞ¸®ÇÏ´Â ÇÔ¼ö cf. str_c(): ÇÕÄ¡´Â °Å
str <- str_c('sql','/','plsql','/','r')
str_split(str,'/') ### /¸¦ ±âÁØÀ¸·Î ºĞ¸® 
str

## str_sub(): ÁÖ¾îÁø ¹®ÀÚ¿­¿¡¼­ ÁöÁ¤µÈ ±æÀÌ ¸¸Å­ÀÇ ¹®ÀÚ¸¦ Àß¶ó³»´Â ÇÔ¼ö 
str_sub('Çàº¹ÇÏ°Ô »ìÀÚ',start=1,end=2) ### Ã¹¹øÂ° ±ÛÀÚ¿¡¼­ µÎ¹øÂ° ±ÛÀÚ±îÁö¸¸ »Ì¾Æ³»°í, ³ª¸ÓÁö´Â ´Ù ÀÚ¸§! 
str_sub('Çàº¹ÇÏ°Ô »ìÀÚ',start=-2) ### Á© µÚ¿¡ µÎ ±ÛÀÚ <- start¿¡ -(minus) ºÙÀÓ 
str_sub('Çàº¹ÇÏ°Ô »ìÀÚ',start=1) ### end Ç¥Çö ¾È ÇÏ¸é, ±×³É ³¡±îÁö ´Ù Ç¥Çö! 

'        R        ' ### °ø¹é¹®ÀÚµµ ¹®ÀÚ·Î ÀÎ½Ä! 

## str_trim(): Á¢µÎ, Á¢¹Ì ºÎºĞ¿¡ °ø¹é ¹®ÀÚ¸¦ Á¦°ÅÇÏ´Â ÇÔ¼ö 
str_trim('        R        ') ### °ø¹é ¹®Á¦ ´Ù Á¦°ÅµÊ! 





##################################################################################################
##################################################################################################
##################################################################################################





# 08/06/2018

# Åë°èÇĞ
## - °ü½É´ë»ó¿¡ ´ëÇØ °ü·ÃµÈ µ¥ÀÌÅÍ¸¦ ¼öÁıÇÏ°í ±× µ¥ÀÌÅÍ¸¦ ¿ä¾à, Á¤¸®ÇÏ¿© ÀÌ·ÎºÎÅÍ ºÒÈ®½ÇÇÑ »ç½Ç¿¡ ´ëÇÑ °á·ĞÀÌ³ª ÀÏ¹İÀûÀÎ ±ÔÄ¢¼ºÀ» Ã£´Â ÇĞ¹®ÀÌ´Ù.
## - ÇØ°áÇÏ°í ½ÍÀº ¹®Á¦°¡ ÀÖ±â¿¡ ±×¿¡ µû¸¥ ´äÀ» Ã£±â À§ÇØ¼­ ºĞ¼®À» ÇÑ´Ù. 

# ÀÚ·á(Data)
## - ¹®Á¦ÇØ°áÀ» À§ÇÑ ¿øÀç·á·Î¼­ Ã³¸®µÇÁö ¾ÊÀº ¼ıÀÚ, ¹®ÀÚ, ÀÏ·ÃÀÇ »ç½ÇÀÌ³ª ±â·ÏµéÀÇ ¸ğÀÓ
## - ¾î¶°ÇÑ °¡Ä¡ ÆÇ´ÜÀ» ÇÒ ¼ö ÀÖ´Â ±Ù°Å°¡ µÇ´Â Àç·á

# ¾çÀû ÀÚ·á <- »çÄ¢ ¿¬»ê °¡´É 
## - ¼ıÀÚ, Å©±â°¡ °ü½É, ÃøÁ¤µÇ´Â °ª
## - ¿¬¼ÓÇü ÀÚ·á ex. Å°, ¸ö¹«°Ô <- ¼Ò¼öÁ¡!(ÇÏ³ªÀÇ ¼ıÀÚ·Î µü ¶³¾îÁöÁö ¾ÊÀ½)
## - ÀÌ»êÇü ÀÚ·á ex. Ãâ»ı¾Æ ¼ö, ³²ÇĞ»ı ¼ö, ¿Ş¼ÕÀâÀÌ ¼ö <- ÇÏ³ªÀÇ ¼ö·Î µü ¶³¾îÁö´Â °ª

# ÁúÀû ÀÚ·á <- ¹üÁÖÇü 
## - ÀÚ·áÀÇ ³»Æ÷ÇÏ°í ÀÖ´Â ÀÇ¹Ì°¡ ÀÖÀ» °æ¿ì
## - ¼øÀ§Çü ÀÚ·á: ÇĞÁ¡(A,B,C,D,F), ¸Å¿ì±×·¸´Ù, º¸ÅëÀÌ´Ù <- ÀÇ¹Ì°¡ ÀÖÀ¸¸é¼­ ¼ø¼­°¡ ÀÖ´Â °æ¿ì(ordered)
## - ¸í¸ñÇü ÀÚ·á: ¼ºº°±¸ºĞ(³²,¿©), °ÅÁÖÁö¿ª, Ç÷¾×Çü <- factor

'''
                ¿ä¾à¹æ¹ı            ÀÚ·áÁ¤¸®              ±×·¡ÇÁ
-----------------------------------------------------------------------
ÁúÀû ÀÚ·á     µµÇ¥, ±×·¡ÇÁ      µµ¼öºĞÆ÷Ç¥(table)        ¸·´ë±×·¡ÇÁ
                                    ºĞÇÒÇ¥                ¿ø±×·¡ÇÁ
-----------------------------------------------------------------------
¾çÀû ÀÚ·á     ¼öÄ¡, ±×·¡ÇÁ     Æò±Õ, ºĞ»ê, Ç¥ÁØÆíÂ÷      È÷½ºÅä±×·¥
                               Áß¾Ó°ª, ÃÖºó°ª             boxplot
                               ÃÖ¼Ò°ª, ÃÖ´ë°ª, 4ºĞÀ§¼ö   ½Ã°è¿­µµÇ¥
                                                         scatter plot
'''
### ½Ã°¢È­(Visualisation) -> "ÀÚ·áÁ¤¸®"¸¦ "±×·¡ÇÁ"·Î ¸¸µë! 

# ±â¼úÅë°è(Áö±İ±îÁö ÇØ¿Â °Å!)
## - ÀÚ·á¸¦ ¼öÁı, Á¤¸®
## - ÀÚ·á ÇüÅÂ¸¦ Ç¥Çö 
## - ÀÚ·áÀÇ Æ¯¼º°ªÀ» µµÃâ 

### select dept_id, count(*) <- µµ¼öºĞÆ÷Ç¥! => ÀÌ°É "½Ã°¢È­"ÇØ¾ß!!! 

# ÃßÃøÅë°è
## - Ç¥º»À¸·ÎºÎÅÍ °üÂûÇÏ°íÀÚ ÇÏ´Â Æ¯¼º°ª µµÃâ
## - ÀÌ¸¦ ¹ÙÅÁÀ¸·Î ¸ğÁı´ÜÀÇ Æ¯¼º ÆÄ¾Ç 



# Pie chart
## pie(°ª, labels = Ä«Å×°í¸®, main = "Á¦¸ñ", col=c('»ö±ò'))
## - ÁúÀûÀÚ·á¿¡ ´ëÇÑ »ó´ëµµ¼öºĞÆ÷¸¦ ³ªÅ¸³»±â À§ÇØ ÀÏ¹İÀûÀ¸·Î »ç¿ëµÇ´Â ¿ø ±×·¡ÇÁ
## - ¿øÀ» ±×¸° ÈÄ ±× ¿ø¿¡ °¢ °è±ŞÀÇ »ó´ëµµ¼ö¿¡ ´ëÀÀÇÏ´Â ¸éÀû ¶Ç´Â ºÎºĞÀ¸·Î ³ª´«´Ù. 

# Simple Pie Chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries", col=default(5))
?colour
### A È¸»ç : 100¾ï
### B È¸»ç : 50¾ï
### C È¸»ç : 30¾ï
### D È¸»ç : 10¾ï

s <- c(100,50,30,10)
company <- c("AÈ¸»ç", "BÈ¸»ç", "CÈ¸»ç", "DÈ¸»ç")
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×")
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×", col=c('red','blue','green','yellow'))

### rainbow(): ¹«Áö°³»ö
### heat.colors(12): Àû»ö, È²»ö¿¡ Ä¡¿ìÄ£ »ö
### terrain.colors(12): Áö±¸ ÁöÇü»ö 
### topo.colors(12): Ã»»ö¿¡ °¡±î¿î »ö
### cm.colors(12): ÇÎÅ©, ºí·ç
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×", col = rainbow(length(s))) ### rainbow(¼ıÀÚ) ÀÌ¿ë! 
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×", col = topo.colors(12))
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×", col = cm.colors(12))
?pie

## clockwise
### ½Ã°è ¹æÇâ(TRUE)À¸·Î È¸ÀüÇÒ Áö ¹İ½Ã°è ¹æÇâ(FALSE)À¸·Î È¸ÀüÇÒ Áö ÁöÁ¤
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×", col = rainbow(length(s)), clockwise = F) ### Default(¹İ½Ã°è ¹æÇâ)
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×", col = rainbow(length(s)), clockwise = T)

## init.angle
### clockwise°¡ ¹İ½Ã°è ¹æÇâ(FALSE) 3½Ã ¹æÇâ 
### clockwise°¡ ½Ã°è ¹æÇâ(TRUE) 12½Ã ¹æÇâ 
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×", col = rainbow(length(s)), clockwise = F, init.angle = 90) ### Ã³À½ ½ÃÀÛÇÏ´Â °¢µµ ÁöÁ¤ 
pie(s, labels = company, main="È¸»ç º° ¸ÅÃâ¾×", col = rainbow(length(s)), clockwise = T, init.angle = 45)

## ÆÄÀÌ¿¡ ´ëÇÑ Å©±â(percentage)¸¦ ³Ö°í ½ÍÀº °æ¿ì 
# Pie Chart with Percentages
slices <- c(10, 12, 4, 16, 8) 
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)), main="Pie Chart of Countries")

p <- round(s/sum(s)*100) ; p
label <- paste0(company," ",p,"%") ; label
pie(s, labels = label, main="È¸»ç º° ¸ÅÃâ¾×", col = rainbow(length(s)), clockwise = F)

## pie chart¸¦ ±×¸± ¶§´Â µÇµµ·ÏÀÌ¸é ¹ü·Ê(legend) »ç¿ë! 
legend(-1.2,-.3,x$DEPARTMENT_NAME,fill = rainbow(length(x$dept_sum)))

# 3D Exploded Pie Chart
install.packages('plotrix')
library(plotrix)
slices <- c(10, 12, 4, 16, 8) 
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.1,main="Pie Chart of Countries ")

pie3D(s,labels = label,explode = 0.1,labelcex = 0.8)
### explode: ºÎÃ¤²ÃµéÀÇ °£°İ (0: °£°İ ¾øÀÌ ºÙ¾î ÀÖÀ½)
### labelcex: labelÀÇ ¹®ÀÚ Å©±â 



# ¸·´ë±×·¡ÇÁ
## - ÁúÀû ÀÚ·á¸¦ Ç¥ÇöÇÏ´Â ±×·¡ÇÁ 
## - °¢ °è±Ş ÀÌ¸§ À§¿¡ °íÁ¤ ³ÊºñÀÇ ¸·´ë¸¦ ±×¸®°í µµ¼ö¿¡ µû¶ó ÀûÀıÇÏ°Ô ¸·´ëÀÇ ±æÀÌ¸¦ Ç¥ÇöÇÑ´Ù. 

# Simple Bar Plot 
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution", 
        xlab="Number of Gears")

sales <- c(150,100,70,30)
team <- c("¿µ¾÷1ÆÀ","¿µ¾÷2ÆÀ","¿µ¾÷3ÆÀ","¿µ¾÷4ÆÀ")
barplot(height = sales, width = 0.5, names.arg = team, 
        horiz = FALSE, col = rainbow(length(sales)), 
        main = "¿µ¾÷ÆÀº° ¿µ¾÷ ½ÇÀû", sub = "2018³âµµ",
        xlab = "¿µ¾÷ÆÀ", ylab = "¿µ¾÷½ÇÀû(¾ï¿ø)", 
        ylim = c(0,180))
barplot(height = sales, width = 35, names.arg = team, 
        horiz = TRUE, col = rainbow(length(sales)), 
        main = "¿µ¾÷ÆÀº° ¿µ¾÷ ½ÇÀû", sub = "2018³âµµ",
        xlab = "¿µ¾÷ÆÀ", ylab = "¿µ¾÷½ÇÀû(¾ï¿ø)", 
        ylim = c(0,180))
### height: ¸·´ë Å©±â¸¦ ³ªÅ¸³»´Â º¤ÅÍ(¼ıÀÚ Çü½Ä) -> ¸·´ë ±×·¡ÇÁ¸¦ Ç¥ÇöÇÏ´Â °ª(¼ıÀÚ°¡ µé¾î°¡´Â º¤ÅÍ º¯¼ö·Î Ç¥Çö!)
### width: ¸·´ë ³Êºñ(Æø)
### names.arg: ¸·´ë ¾Æ·¡ Ãâ·ÂµÇ´Â ÀÌ¸§ 
### col: ¸·´ë »ö»ó 
### main: Á¦¸ñ 
### sub: ºÎÁ¦¸ñ 
### horiz: TRUE(¼öÆò¸·´ë), FALSE(¼öÁ÷¸·´ë)
### xlab: xÃà ÀÌ¸§
### ylab: yÃà ÀÌ¸§
### ylim: yÃà Å©±â <- ¸·´ëÀÇ ±æÀÌ°¡ ³Ê¹« ±æ´Ù ½ÍÀ¸¸é ylimÀ» ÁÙÀÏ °Í! 
### xlim: xÃà Å©±â

bp <- barplot(height = sales, width = 0.5, names.arg = team, 
        horiz = FALSE, col = rainbow(length(sales)), 
        main = "¿µ¾÷ÆÀº° ¿µ¾÷ ½ÇÀû", sub = "2018³âµµ",
        xlab = "¿µ¾÷ÆÀ", ylab = "¿µ¾÷½ÇÀû(¾ï¿ø)", 
        ylim = c(0,180))
label <- paste(sales,'¾ï¿ø',sep="")
text(x=bp,y=sales,labels=label,pos=3) ### ¸·´ë¸¶´Ù °¢°¢ÀÇ ¼öÄ¡¸¦ Ç¥Çö! 
### pos = 1: ¸·´ë ³¡ ¼±ÀÇ ¾Æ·¡ÂÊ
### pos = 2: ¸·´ë ³¡ ¼±ÀÇ ¿ŞÂÊ
### pos = 3: ¸·´ë ³¡ ¼±ÀÇ À§ÂÊ
### pos = 4: ¸·´ë ³¡ ¼±ÀÇ ¿À¸¥ÂÊ



# Stacked bar chart(½ºÅÃÇü ¹Ù Â÷Æ®) <- ´©Àû! 

# Stacked Bar Plot with Colors and Legend
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts))

x1 <- c(2,6,9,5)
x2 <- c(8,10,15,6)
data <- rbind(x1, x2) ; data
name <- c("¿µ¾÷1ÆÀ","¿µ¾÷2ÆÀ","¿µ¾÷3ÆÀ","¿µ¾÷4ÆÀ")
label <- c("2016³â","2017³â")

barplot(data, names.arg = name, main = "¿µ¾÷ÆÀº° ¿µ¾÷ ½ÇÀû", 
        xlab = "¿µ¾÷ÆÀ", ylab = "ÆÇ¸Å½ÇÀû(¾ï¿ø)", ylim = c(0,30), 
        col = c("darkblue","pink")) ### BUT ¾î¶² ¿¬µµÀÇ °ªÀÎÁö ¸ğ¸§! => »ö»ó º°·Î legend Ç¥Çö! 
barplot(data, names.arg = name, main = "¿µ¾÷ÆÀº° ¿µ¾÷ ½ÇÀû", 
        xlab = "¿µ¾÷ÆÀ", ylab = "ÆÇ¸Å½ÇÀû(¾ï¿ø)", ylim = c(0,30), 
        col = c("darkblue","pink"), 
        legend.text = label)





##################################################################################################
##################################################################################################
##################################################################################################





# 08/07/2018

# Grouped Bar Chart <- "beside=TRUE"

# Grouped Bar Plot 
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

barplot(data, names.arg = name, main = "¿µ¾÷ÆÀº° ¿µ¾÷ ½ÇÀû", 
        xlab = "¿µ¾÷ÆÀ", ylab = "ÆÇ¸Å½ÇÀû(¾ï¿ø)", ylim = c(0,20), 
        col = c("darkblue","pink"), legend = label, beside=TRUE)





##################################################################################################
##################################################################################################
##################################################################################################





# 08/09/2018

# ÀÚ·á(Data)
## - ¹®Á¦ÇØ°áÀ» À§ÇÑ ¿øÀç·á·Î¼­ Ã³¸®µÇÁö ¾ÊÀº ¼ıÀÚ, ¹®ÀÚ, ÀÏ·ÃÀÇ »ç½ÇÀÌ³ª ±â·ÏµéÀÇ ¸ğÀÓ
## - ¾î¶°ÇÑ °¡Ä¡ ÆÇ´ÜÀ» ÇÒ ¼ö ÀÖ´Â ±Ù°Å°¡ µÇ´Â Àç·á

# ¾çÀû ÀÚ·á
## - ¼ıÀÚ, Å©±â°¡ °ü½É, ÃøÁ¤µÇ´Â °ª
## - ¿¬¼ÓÇü ÀÚ·á ex. Å°, ¸ö¹«°Ô <- ¼Ò¼öÁ¡!(ÇÏ³ªÀÇ ¼ıÀÚ·Î µü ¶³¾îÁöÁö ¾ÊÀ½)
## - ÀÌ»êÇü ÀÚ·á ex. Ãâ»ı¾Æ ¼ö, ³²ÇĞ»ı ¼ö, ¿Ş¼ÕÀâÀÌ ¼ö <- ÇÏ³ªÀÇ ¼ö·Î µü ¶³¾îÁö´Â °ª

# ÁúÀû ÀÚ·á
## - ÀÚ·áÀÇ ³»Æ÷ÇÏ°í ÀÖ´Â ÀÇ¹Ì°¡ ÀÖÀ» °æ¿ì
## - ¼øÀ§Çü ÀÚ·á: ÇĞÁ¡(A,B,C,D,F), ¸Å¿ì±×·¸´Ù, º¸ÅëÀÌ´Ù <- ÀÇ¹Ì°¡ ÀÖÀ¸¸é¼­ ¼ø¼­°¡ ÀÖ´Â °æ¿ì(ordered)
## - ¸í¸ñÇü ÀÚ·á: ¼ºº°±¸ºĞ(³²,¿©), °ÅÁÖÁö¿ª, Ç÷¾×Çü <- factor

'''
                ¿ä¾à¹æ¹ı            ÀÚ·áÁ¤¸®              ±×·¡ÇÁ
-----------------------------------------------------------------------
ÁúÀû ÀÚ·á     µµÇ¥, ±×·¡ÇÁ      µµ¼öºĞÆ÷Ç¥(table)        ¸·´ë±×·¡ÇÁ(barplot)
(qualitative)                        ºĞÇÒÇ¥                ¿ø±×·¡ÇÁ
-----------------------------------------------------------------------
¾çÀû ÀÚ·á     ¼öÄ¡, ±×·¡ÇÁ     Æò±Õ, ºĞ»ê, Ç¥ÁØÆíÂ÷      È÷½ºÅä±×·¥
(quantitative)                  Áß¾Ó°ª, ÃÖºó°ª             boxplot
                              ÃÖ¼Ò°ª, ÃÖ´ë°ª, 4ºĞÀ§¼ö    ½Ã°è¿­µµÇ¥
                                                        scatter plot
'''

# ºĞÇÒÇ¥(contingency table)
## - ¸í¸ñÇü(categorical), ¼ø¼­Çü(¼øÀ§Çü)(ordinal) µ¥ÀÌÅÍÀÇ µµ¼ö(frequency)¸¦ Ç¥ ÇüÅÂ·Î ³ªÅ¸³»´Â °ÍÀ» ÀÇ¹ÌÇÑ´Ù. 

x <- c('A','B','A','B','B','C')

## µ¥ÀÌÅÍÀÇ ºóµµ¼ö(µµ¼ö)¸¦ ÆÄ¾ÇÇÒ ¼ö ÀÖ´Â ÇÏ³ªÀÇ ±â´É
### À¯ÀÏÅ° °ªÀ» ±âÁØÀ¸·Î °¢°¢ÀÇ °Ç¼ö°¡ ³ª¿È! 
table(x) ### table(): ºĞÇÒÇ¥¸¦ ¸¸µå´Â ¸Ş¼Òµå 

## ÃÖ´ë°ªÀÌ ÀúÀåµÈ À§Ä¡ÀÇ »öÀÎÀ» ¹İÈ¯ 
which.max(table(x)) ### which.max(): µµ¼ö°¡ °¡Àå Å« °ª°ú À§Ä¡ Á¤º¸°¡ ³ª¿È! 

which.min(table(x)) ### which.min(): ÃÖ¼Ò°ª°ú ±× À§Ä¡ Á¤º¸ 

names(table(x)) ### ¼¿ ¸ñ·Ï È®ÀÎ 
names(table(x))[2]

## tableÀ» ÀÌ¿ëÇØ °¢ ÄÃ·³ÀÇ µµ¼öºĞÆ÷¸¦ ½±°Ô ÆÄ¾Ç °¡´É! 
table(emp$JOB_ID)
table(emp$DEPARTMENT_ID)

## xtabs(): formula(~)¸¦ ÀÌ¿ëÇØ ºĞÇÒÇ¥ ÀÛ¼º <- table()°ú °°Àº ±â´É! 
xtabs(~JOB_ID, emp)

### ¿©·¯ °³ÀÇ ÄÃ·³À» °¡Áö°í ºĞ¼®ÇØ¾ß ÇÒ ¶§´Â, º¤ÅÍ¸¦ ½á¾ß ÇÒ Áö, list¸¦ ½á¾ß ÇÒ Áö ²À »ı°¢ÇØº¼ °Í! 
table(c(emp$JOB_ID,emp$DEPARTMENT_ID))
table(list(emp$JOB_ID,emp$DEPARTMENT_ID)) ### ´õ Á¤¸®Á¤µ·ÀÌ Àß µÇ¾î ÀÖÀ½! (cross table)

xtabs(~JOB_ID+DEPARTMENT_ID,emp) ### À§ÀÇ table(list)¿Í °°Àº ¸ğ¾ç, ±â´É 

### Áö±İ±îÁö´Â sqlÀÇ count() ±â´É¸¸ »ç¿ëÇÑ °Å! 

## Áı°è°ªÀ» »ç¿ëÇÏ´Â ¹ı
xtabs(SALARY~JOB_ID+DEPARTMENT_ID,emp) ### SALARY¿¡ ´ëÇÑ ÇÕÀÌ ±¸ÇØÁü! (aggregate()ÀÇ ±â´É! ºĞÇÒÇ¥ Çü½ÄÀ¸·Î º¼ ¼ö ÀÖÀ½!)
aggregate(SALARY ~ JOB_ID+DEPARTMENT_ID, emp, sum)



## margin.table(): ºĞÇÒÇ¥ÀÇ ÇàÀÇ ÇÕ, ¿­ÀÇ ÇÕÀ» ±¸ÇÏ´Â ¹æ¹ı 
x <- xtabs(SALARY~JOB_ID+DEPARTMENT_ID,emp) 
y <- margin.table(x,1) ### 1: Çà ¹æÇâÀ¸·Î ÇÕÀ» ±¸ÇÔ! 
z <- margin.table(x,2) ### 2: ¿­ ¹æÇâÀ¸·Î ÇÕÀ» ±¸ÇÔ! 

## prop.table(x,1): Çà ¹æÇâÀ¸·Î »ó´ëÀûÀÎ ºñÀ²°ª °è»ê
prop.table(x,1)

## prop.table(x,2): ¿­ ¹æÇâÀ¸·Î »ó´ëÀûÀÎ ºñÀ²°ª °è»ê
round(prop.table(x,2),2)

## prop.table(): ºĞÇÒÇ¥ ÀüÃ¼ÀÇ ºñÀ² °è»ê(margin »èÁ¦)
prop.table(x)



# »êÁ¡µµ(scatter plot)
## - ÁÖ¾îÁø µ¥ÀÌÅÍ¸¦ Á¡À¸·Î Ç¥½ÃÇØ Èğ»Ñ¸®µíÀÌ ½Ã°¢È­ÇÑ ±×·¡ÇÁ(ºĞ»ê)
## - µ¥ÀÌÅÍÀÇ ½ÇÁ¦ °ªµéÀÌ Ç¥½ÃµÇ¹Ç·Î µ¥ÀÌÅÍÀÇ ºĞÆ÷¸¦ ÇÑ ´«¿¡ »ìÆìº¸´Âµ¥ À¯¿ëÇÏ´Ù. 
## »êÆ÷µµ -> »ó°üºĞ¼®! (µÎ º¯¼öÀÇ »ó°ü°ü°è)

data() ### R¿¡ ³»ÀåµÇ¾î ÀÖ´Â µ¥ÀÌÅÍ¼Â È®ÀÎ °¡´É 
help(women) ### ÇØ´ç µ¥ÀÌÅÍ¼Â¿¡ ´ëÇÑ Á¤º¸ È®ÀÎ °¡´É

str(women)
plot(women$weight)
plot(women$height)

plot(x=women$height, y=women$weight, xlab="Å°", ylab="¸ö¹«°Ô", main="¿©¼ºÀÇ Å°¿Í ¸ö¹«°Ô", sub="¹Ì±¹ÀÇ 70³â´ë ±âÁØ",
     type="p", lty = 4, lwd = 2, pch = 25, cex = 1.5)
## type
### p: Á¡, l: ¼±, b: (Á¡, ¼±), c: (bÀÇ ¼± ºÎºĞ¸¸), o: Á¡ À§ÀÇ ¼±, h: ¼öÁ÷¼±, s: °è´ÜÇü, n: ³ªÅ¸³ªÁö ¾ÊÀ½

## lty: ¼±ÀÇ À¯Çü(1~6) 
'''
0: ±×¸®Áö ¾ÊÀ½
1: ½Ç¼±(default)
2: ´ë½Ã(-)
3: Á¡
4: Á¡°ú ´ë½Ã
5: ±ä ´ë½Ã
6: µÎ °³ÀÇ ´ë½Ã
'''

## lwd: ¼±ÀÇ ±½±â(default = 1)
## pch: Á¡ÀÇ Á¾·ù(0~25)
## cex: Á¡ÀÇ Å©±â(default = 1)


# µµ¼öºĞÆ÷Ç¥ (frequency distribution), frequency table
## ¹Ì¸® ±¸°£À» ¼³Á¤ÇØ ³õ°í °¢ ±¸°£ÀÇ ¹üÀ§ ¾È¿¡ Á¶»çµÈ µ¥ÀÌÅÍ °ªµéÀÌ ¸î°³¾¿ ¼ÓÇÏ´Â°¡¸¦ Ç¥½ÃÇÏ´Â Ç¥ 
'''
-°è±Ş: °¢ ±¸°£
-µµ¼ö: °¢ ±¸°£(°è±Ş)¿¡ ¼ÓÇÑ µ¥ÀÌÅÍ °ªµéÀÇ ¼ö
-»ó´ëµµ¼ö: ¾î´À °è±Ş¿¡ ¼ÓÇÑ µµ¼ö°¡ ÀüÃ¼ µµ¼ö¿¡ Â÷ÁöÇÏ´Â ºñÀ²
-´©Àûµµ¼ö: ¾î´À °è±ŞÀÇ µµ¼ö¿Í ±× À§ÀÇ °è±Ş¿¡ ¼ÓÇÑ µµ¼ö¸¦ ¸ğµÎ ÇÕÇÏ¿© ±¸ÇÏ¸ç ÀÌ·¯ÇÑ ´©Àûµµ¼ö¸¦ °¢ °è±Şº°·Î Ç¥½Ã 
'''

## °è±ŞÀÇ ¼öÀÇ °áÁ¤
'''
°è±Ş¼ö = ÀÚ·áÀÇ ÃøÁ¤°ªµéÀÇ °¹¼ö^(1/3)
ex) length(score)^(1/3)

±Ş°£ = (°¡Àå Å« ÃøÁ¤°ª - °¡Àå ÀÛÀº ÃøÁ¤°ª) / °è±Ş ¼ö 
ex) (max(score)-min(score))/length(score)^(1/3)

¡ØÀ§ÀÇ °áÁ¤¹æ¹ıÀº ¹ıÄ¢ÀÌ ¾Æ´Ï¶ó Âü°í»çÇ×
'''
?cut ### divides the range of x into intervals
?nclass.Sturges ### Compute the number of classes for a histogram.

#Fake data
x <- sample(10:20, 44, TRUE)
#Your code
factorx <- factor(cut(x, breaks=nclass.Sturges(x)))
#Tabulate and turn into data.frame
xout <- as.data.frame(table(factorx)) ### as.data.frame() <- ÀÌ°Ô ÇÙ½É! (Freq ±¸ÇÏ´Â ¹æ¹ı)
#Add cumFreq and proportions
xout <- transform(xout, cumFreq = cumsum(Freq), relative = prop.table(Freq))
#-----
'''
factorx Freq cumFreq   relative
1 (9.99,11.4]   11      11 0.25000000
2 (11.4,12.9]    3      14 0.06818182
3 (12.9,14.3]   11      25 0.25000000
4 (14.3,15.7]    2      27 0.04545455
5 (15.7,17.1]    6      33 0.13636364
6 (17.1,18.6]    3      36 0.06818182
7   (18.6,20]    8      44 0.18181818
'''





##################################################################################################
##################################################################################################
##################################################################################################





# 08/10/2018

# µµ¼öºĞÆ÷Ç¥ -> ÁúÀû ÀÚ·á, non-categorical

# cut()
## ¿¬¼ÓÇü ÀÚ·á¸¦ categoricalÇÏ°Ô º¯È¯ÇÏ´Â ÇÔ¼ö 
## ¿¬¼ÓÇü º¯¼ö¸¦ ¹üÁÖÇü º¯¼ö·Î º¯È¯ 

# µµ¼öºĞÆ÷Ç¥´Â ÀÚ·áÀÇ Áß¿äÇÑ Æ¯¼ºÀ» ¼­¼úÀû ¹æ¹ıÀ¸·Î ³ªÅ¸³»´Âµ¥ È¿°úÀûÀÌ°í
# ÀÌ¸¦ ½Ã°¢È­ÇÏ·Á¸é "È÷½ºÅä±×·¥"À» »ç¿ëÇÏ¸é µÈ´Ù. -> ÀÚ·áÀÇ ºĞÆ÷µµ! 

'''
The Difference Between Bar Charts and Histograms

Here is the main difference between bar charts and histograms. 
With bar charts, each column represents a group defined by a categorical variable; 
and with histograms, each column represents a group defined by a continuous, quantitative variable.

One implication of this distinction: it can be appropriate to talk about the skewness of a histogram; 
that is, the tendency of the observations to fall more on the low end or the high end of the X axis.

With bar charts, however, the X axis does not have a low end or a high end; 
because the labels on the X axis are categorical - not quantitative. 
As a result, it is not appropriate to comment on the skewness of a bar chart.
'''

#Fake data
score ### ¿¬¼ÓÇü º¯¼ö -> ÀÌ°É cut()À» ÅëÇØ ¹üÁÖÇü º¯¼ö·Î ¹Ù²ãÁÜ! 

# Your code
scoref <- factor(cut(score, breaks=nclass.Sturges(score))) ; scoref

c <- cut(score, breaks = c(60,70,80,90,100), right=FALSE, 
    labels = c("60Á¡ÀÌ»ó~70Á¡¹Ì¸¸","70Á¡ÀÌ»ó~80Á¡¹Ì¸¸","80Á¡ÀÌ»ó~90Á¡¹Ì¸¸","90Á¡ÀÌ»ó")) ; c ### ¿¬¼ÓÇü ÀÚ·á°¡ ÀüºÎ categoricalÇÏ°Ô ¹Ù²ñ! 
c <- cut(score, breaks = seq(60,100,10), right=FALSE, 
         labels = c("60Á¡ÀÌ»ó~70Á¡¹Ì¸¸","70Á¡ÀÌ»ó~80Á¡¹Ì¸¸","80Á¡ÀÌ»ó~90Á¡¹Ì¸¸","90Á¡ÀÌ»ó")) ; c 
table(c) ### µµ¼ö È®ÀÎ °¡´É! 
## cut:: right=FALSE <- "60<= ~ <70" or "[60,70)" (~ ÀÌ»ó, ~ ÀÌÇÏ)
##       right=TRUE <- "60< ~ <=70" or "(60,70]" (~ ÀÌÇÏ, ~ ÀÌ»ó)

## µµ¼öºĞÆ÷Ç¥
c.table <- table(c)
## »ó´ëµµ¼öºĞÆ÷Ç¥
c.prop <- prop.table(c.table)

cbind(c.table, c.prop)

## µµ¼öºĞÆ÷Ç¥(cut())¸¦ »ç¿ëÇÒ ¶§´Â, È÷½ºÅä±×·¥ »ç¿ë! 
hist(score, breaks = seq(60,100,10), right = FALSE, col = rainbow(4))
### 60°ú 70 »çÀÌ¿¡ 63ÀÌ ¸î °³ÀÎÁö, 65°¡ ¸î °³ÀÎÁö µğÅ×ÀÏÇÑ ÀÚ·á ±¸¼ºÀ» È®ÀÎÇÏ°í ½ÍÀ¸¸é, ÁÙ±âÀÙ ±×¸² »ç¿ë! 

## ÁÙ±â ÀÙ ±×¸²(stem and leaf diagram)
### - ¼­¼úÀûÀÎ ¸é°ú ±×·¡ÇÁÀÇ ½Ã°¢ÀûÀÎ ¸éÀ» µ¿½Ã¿¡ °í·ÁÇÏ¿© ÀÚ·áÀÇ Æ¯¼ºÀ» ³ªÅ¸³¾ ¶§ »ç¿ë 
### - ÀÚ·á¸¦ ±¸¼ºÇÏ´Â °¢°¢ÀÇ µ¥ÀÌÅÍ °ªµéÀÇ ÁÙ±â(stem)¿Í ÀÙ(leaf)À¸·Î ±¸ºĞ 
stem(score) ### ÁÙ±â | ÀÙ <- Á¤¼öÇü¸¸ »ç¿ëÇÒ °Í!(¼Ò¼öÁ¡Àº ¹İ¿Ã¸²µÊ)

heig <- c(178.5,193.6,134.8,147.36,159.1)
stem(heig) 

# Tabulate and turn into data.frame
sout <- as.data.frame(table(scoref)) ; sout ### as.data.frame() <- ÀÌ°Ô ÇÙ½É! (Freq ±¸ÇÏ´Â ¹æ¹ı)

# Add cumFreq and proportions
scout <- transform(sout, cumFreq = cumsum(Freq), relative = prop.table(Freq)) ; scout



# Google Map
install.packages('ggmap')
library(ggmap)

## geocode("Áö¿ª¸í ¶Ç´Â ÁÖ¼Ò"): À§µµ, °æµµ°ªÀ» ¹İÈ¯ÇÏ´Â ÇÔ¼ö 
gc <- geocode(enc2utf8("¼­¿ï½Ã")) ### enc2utf8(): ÇÑ±ÛÀ» utf8 Çü½ÄÀ¸·Î º¯È¯ÇÏ´Â ÇÔ¼ö 
### lon: longitude(°æµµ) // lat: latitude(À§µµ)

map <- get_googlemap(center = as.numeric(gc), zoom = 18, maptype = "satellite")
ggmap(map)

'''
center: Áöµµ ÁÂÇ¥°ª
zoom: Áöµµ Å©±â ±âº»°ª(10 µµ½Ã), 3(´ë·ú) ~ 21(ºôµù)
size: Áöµµ °¡·Î ¼¼·Î ÇÈ¼¿ Å©±â 640 x 640, size = c(640,640)
mapsize: Áöµµ À¯Çü
         terrain(ÁöÇüÁ¤º¸±â¹İ), satellite(À§¼ºÁöµµ), roadmap(µµ·Î¸íÇ¥½Ã), hybrid(À§¼º, µµ·Î¸í)
marker: À§µµ °æµµ À§Ä¡¿¡ ¸¶Ä¿ Ãâ·Â
ggmap: Áöµµ¸¦ Ãâ·ÂÇÏ´Â ÇÔ¼ö 
'''

## 2°³ ÀÌ»óÀÇ Áö¿ª °Ë»ö 
names <- c("1.ÇùÀçÇØ¼ö¿åÀå","2.ÇÔ´öÇØ¼ö¿åÀå")
addr <- c("Á¦ÁÖÆ¯º°ÀÚÄ¡µµ Á¦ÁÖ½Ã ÇÑ¸²À¾ ÇùÀç¸® 2497-1","Á¦ÁÖÆ¯º°ÀÚÄ¡µµ Á¦ÁÖ½Ã Á¶ÃµÀ¾ ÇÔ´ö¸® 1008")
gc <- geocode(enc2utf8(addr)) ; gc
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat) ; df
cen <- c(mean(df$lon), mean(df$lat)) ; cen

map <- get_googlemap(center = cen, zoom = 10, maptype = "roadmap", markers = gc)
ggmap(map) ### ÀÌ°É ÇØ¾ß Áöµµ º¸¿©ÁÜ!!! 

gc <- geocode(enc2utf8("µµÄìµµ")) 
map <- get_googlemap(center = as.numeric(gc), zoom = 16, maptype = "hybrid", markers = gc)
ggmap(map)

cen <- c(2.294481, 48.85837)
ggmap(get_googlemap(center = cen, maptype = "roadmap", zoom = 15, 
                    markers = data.frame(lon = 2.294481, lat = 48.85837)))

gc <- geocode(enc2utf8("½ÃÄ«°í")) 
map <- get_googlemap(center = as.numeric(gc), zoom = 16, maptype = "hybrid", markers = gc)
ggmap(map)



# Áöµµ¸¦ ÀÌ¿ëÇØ¼­ CCTV À§Ä¡ ÆÄ¾Ç 
## https://www.data.go.kr/
cctv <- read.csv("C://data/cctv.csv")
View(cctv)
cctv2 <- sample_n(cctv, 80)
cen <- c(mean(cctv2$°æµµ), mean(cctv2$À§µµ)) ; cen
map <- get_googlemap(center = cen, zoom = 14, maptype = "roadmap", markers = cctv2[,c("°æµµ","À§µµ")])
ggmap(map)

cctv <- read.csv("C://data/cctv.csv")
View(cctv)
cctv2 <- cctv[grep('»ï¼º·Î',cctv$¼ÒÀçÁöµµ·Î¸íÁÖ¼Ò),] ### ÇØ´ç Áö¿ª¿¡ ÇÑÁ¤Áö¾î¼­ cctv À§Ä¡ ÆÄ¾Ç 
cen <- c(mean(cctv2$°æµµ), mean(cctv2$À§µµ)) ; cen
map <- get_googlemap(center = cen, zoom = 14, maptype = "roadmap", markers = cctv2[,c("°æµµ","À§µµ")])
ggmap(map)

## ggplot2 ÀÌ¿ë
map <- get_googlemap(center = cen, zoom = 14, maptype = "roadmap")
ggmap(map) + geom_point(data = cctv2, aes(x=cctv2$°æµµ, y=cctv2$À§µµ), size=5, alpha = 0.3, color="red")

### Error: max url length is 2048 characters. <- markers·Î ÂïÀ» ¼ö ÀÖ´Â °³¼ö Á¦ÇÑ! 
### BUT ggplot2 ¾²¸é Âï¾î´Â ÁÜ! (ÀÏºÎ µ¥ÀÌÅÍ´Â ÀÚµ¿ÀûÀ¸·Î Áö¿ò)





##################################################################################################
##################################################################################################
##################################################################################################





# 08/13/2018

# Animation
myAni <- function(){
  for (i in 10:0){
    plot.new()
    rect(0,0,1,1,col = "gold") ### rectangle: »ç°¢¼± 
    text(0.5,0.5,i,cex = 10,col = rgb(0,0,1,0.5)) ### rgb: ºûÀÇ »ï¿ø»ö <- rgb(red, green, blue, 0.5) <- 3°³ÀÇ ÀÎÀÚ¸¦ ´Ù 1·Î ÇÏ¸é Èò»ö! 
                                                  ### 0.5: Åõ¸íµµ <- Åõ¸íµµ ¾²Áö ¾Ê¾Æµµ µÊ! 
    ani.pause()
  }
}
myAni() ### countdown °è»ê! 

myAni <- function(){
  for (i in 10:0){
    plot.new()
    rect(0,0,1,1,col = "gold") 
    text(0.5,0.5,i,cex = ifelse(i%%2==0,i,-i),col = rgb(0,0,1)) ### cex¿¡ i º¯¼ö¸¦ ³Ö¾î Å©±â dynamicÇÏ°Ô! 
    ani.pause()
  }
}
myAni()

myAni <- function(){
  for (i in 10:0){
    plot.new()
    rect(0,0,1,1,col = "gold") 
    s <- i-1
    text(0.5,0.5,i,cex = s,col = rgb(0,0,1))
    ani.pause()
  }
}
myAni()

myAni <- function(){
  n <- ani.options("nmax") ### nmax: animation ÇÁ·¹ÀÓÀ» ¸¸µé±â À§ÇÑ ¹İº¹ ¼ö(1ÃÊÀÇ 30°³ ÇÁ·¹ÀÓ) ½ºÆ¿ÄÆ, ±âº»°ª 50 
  x <- sample(1:n) ### random sampling! 
  y <- sample(1:n)
  
  for (i in 1:n){
    plot(x[i],y[i],cex=3,col="red",lwd=2,ylim=c(0,50),xlim=c(0,50)) ### ÁÂÇ¥ »óÀÇ Á¡À» ÂïÀ½! 
    ani.pause()
  }
}
myAni()

## ani.options(): animation option ¼³Á¤ Á¶È¸ÇÏ´Â ÇÔ¼ö
ani.options()

## interval: animationÀÇ ½Ã°£ °£°İ(ÃÊ ´ÜÀ§) ±âº»°ª 1ÃÊ
## nmax: animation ÇÁ·¹ÀÓÀ» ¸¸µé±â À§ÇÑ ¹İº¹ ¼ö(1ÃÊÀÇ 30°³ ÇÁ·¹ÀÓ) ½ºÆ¿ÄÆ, ±âº»°ª 50 

## ani.width(): ÇÁ·¹ÀÓ °¡·Î Å©±â(ÇÈ¼¿)
## ani.height(): ÇÁ·¹ÀÓ ¼¼·Î Å©±â(ÇÈ¼¿)

## ani.pause(): ÁÖ¾îÁø ½Ã°£ µ¿¾È¿¡ ´ë±âÇÏ°í ÇöÀç È­¸éÀ» Áö¿î´Ù. 
ani.pause("interval") ### ±âº»°ª 

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
### xleft: ÀÌ¹ÌÁö Ãâ·Â À§Ä¡(xÃà ¿ŞÂÊ)
### ybottom: ÀÌ¹ÌÁö Ãâ·Â À§Ä¡(yÃà ÇÏ´Ü)
### xright: ÀÌ¹ÌÁö Ãâ·Â À§Ä¡(xÃà ¿À¸¥ÂÊ)
### ytop: ÀÌ¹ÌÁö Ãâ·Â À§Ä¡(yÃà »ó´Ü)





##################################################################################################
##################################################################################################
##################################################################################################





# 08/14/2018

install.packages("RJDBC")
library(RJDBC)
jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="C:/data/ojdbc6.jar")
conn <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@localhost:1521/xe", "hr",  "hr")  ### SID: instance name

emp <- dbGetQuery(conn, "select * from employees")

dept <- dbGetQuery(conn, "select * from departments")

class(emp)
View(emp)

## Path ¼³Á¤ 
### ÀÌ °æ·Î¿¡ install.packages ÀúÀå 
.libPaths() ### Path°¡ ´Ù¸¦ °æ¿ì, ÀÌ ÇÔ¼ö¸¦ ÀÌ¿ëÇØ ¼³Á¤! 



# GIF ÀúÀå 
?saveGIF
for1 <- for (i in gu) {
  img <- paste("c:/data/",i,".jpg",sep="")
  img <- readJPEG(img)
  plot.new()
  rasterImage(img,0,0,1,1)
  ani.pause()
}
saveGIF(for1, movie.name = "animation.gif", img.name = "Rplot", convert = "convert", 
        cmd.fun, clean = TRUE)
install.packages("installr")
library(installr)
install.imagemagick("https://www.imagemagick.org/script/download.php")

saveGIF(for (i in gu) {
  img <- paste("c:/data/",i,".jpg",sep="")
  img <- readJPEG(img)
  plot.new()
  rasterImage(img,0,0,1,1)
  ani.pause()
})

install.packages("devtools")
library(devtools)

dev_mode(on=T)

install.packages('animation', repos = 'http://yihui.name/xran')
library(animation)
saveGIF({
  for (i in 1:10) plot(runif(10), ylim = 0:1)
})

dev_mode(on=F)

install.packages("installr")
library(installr)
install.imagemagick("https://www.imagemagick.org/script/download.php")
install.packages("devtools")
library(devtools)
install_github("yihui/animation")
dev_mode(on=T)
saveGIF(for (i in gu) {
  img <- paste("c:/data/",i,".jpg",sep="")
  img <- readJPEG(img)
  plot.new()
  rasterImage(img,0,0,1,1)
  ani.pause()
})



# ggplot2(package)
library(ggplot2)
df <- read.csv("C://data/exam.csv", header = T, stringsAsFactors = F)
str(df)
x <- df[df$subject == 'SQL',] ; x

## Barplot
ggplot(x, aes(x=name, y=grade)) + 
  geom_bar(stat = "identity", fill = "skyblue", colour = "darkblue") +
  theme(axis.text.x = element_text(angle=45, hjust = 1, vjust = 1, colour = "blue", size = 10)) ### angle: x label °¢µµ Á¶Á¤ 

df1 <- df %>% arrange(name)

## Stacked Barplot("fill = ")
ggplot(df1, aes(x=name, y=grade, fill=subject)) + ### Frame <- "fill=subject": °ú¸ñº°·Î ½×¾Æ³õÀ¸¶ó´Â ¶æ 
  geom_bar(stat = "identity", colour = "darkblue") + ### Stacked Bar
  geom_text(aes(y=grade,label=paste(grade,"Á¡")), col = "black", size = 4, position = position_stack(vjust=0.5)) + ### Á¡¼ö <- "position = position_stack(vjust=0.5)": textÀÇ À§Ä¡ 
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust=1, colour = "blue", size = 10)) +
  ggtitle("itwill ÇĞ»ı ¼ºÀû", subtitle = "Áß°£°í»ç") + ### Title
  labs(x="ÀÌ¸§",y="Á¡¼ö",fill = "°ú¸ñ") ### labelÀÇ ÀÌ¸§ º¯°æ 

### °ú¸ñ ±âÁØÀ¸·Î grouping("group = ") 
ggplot(data = df, aes(subject, grade, group = name)) +
  geom_col(aes(fill = name), position = "stack") + ### geom_bar¿Í geom_colÀº °°Àº ±â´ÉÀÇ ¸Ş¼Òµå! 
  geom_text(aes(label = grade), position = position_stack(vjust=0.5))

### ÀÌ¸§ ±âÁØÀ¸·Î grouping 
ggplot(data = df, aes(name, grade, group = subject)) +
  geom_col(aes(fill = subject), position = "stack") + 
  geom_text(aes(label = grade), position = position_stack(vjust=0.5))

### Grouped barplot("dodge")
ggplot(data = df, aes(name, grade, group = subject)) +
  geom_col(aes(fill = subject), position = "dodge") + 
  geom_text(aes(label = grade), position = position_dodge(.9), vjust = 1.5) ### "position = position_dodge(1)"





##################################################################################################
##################################################################################################
##################################################################################################





# 08/16/2018

# ¼±°úÁ¡ ±×·¡ÇÁ(ggplot + geom_line() + geom_point())
df <- read.csv("C://data/exam.csv", header = TRUE, stringsAsFactors = FALSE)
library(ggplot2)
ggplot(df, aes(x = subject, y = grade, group = name)) + ### color ºÎºĞ »ı·«
  geom_line() +
  geom_point()
ggplot(df, aes(x = subject, y = grade, group = name, color = name)) +  
  geom_line() +
  geom_point()



# Text Mining 
text1 <- "RÀº ¿ÀÇÂ¼Ò½º·Î Åë°è, ±â°èÇĞ½À, ±İÀ¶, »ı¹°Á¤º¸ÇĞ, ±×·¡ÇÈ½º¿¡ ÀÌ¸£´Â ´Ù¾çÇÑ Åë°è ÆĞÅ°Áö¸¦ °®Ãß°í ÀÖ´Â ÁÁÀº ÇÁ·Î±×·¥ÀÌ´Ù." 

strsplit(text1," ")

library(rJava)
install.packages("KoNLP")
library(KoNLP)
??KoNLP
useSejongDic()

extractNoun(text1) ### ÇÑ±Û ¸í»ç¸¸ ÃßÃâÇÏ´Â ÇÔ¼ö: ÇÑ³ª´®ºĞ¼®±â <- ÇÑ°è°¡ ÀÖÀ½! => »çÀü¿¡ ¾ø´Â »õ·Î¿î ´Ü¾îµéÀ» µî·ÏÇØ¾ß ÇÔ! 

SimplePos09(text1) ### Ç°»ç±îÁö ±¸ºĞ! <- 09: 9°³ÀÇ Ç°»ç ÅÂ±×¸¦ ´Ş¾ÆÁÖ´Â ÇÔ¼ö(konlp_tags.png)
SimplePos22(text1) ### 22: 22°³ÀÇ Ç°»ç ÅÂ±×¸¦ ´Ş¾ÆÁÖ´Â ÇÔ(Á» ´õ ¼¼¼¼ÇÏ°Ô!)

text2 <- SimplePos09(text1) 
text2[grep("N", text2)]
str_replace_all(text2[grep("N", text2)],'/N.*','')

## another solution
text_noun <- str_match(text2, '([A-Z°¡-ÆR]+/N)')
na.omit(text_noun[,2]) ### NA ÇÊµå ¸ğµÎ Á¦°Å 
as.vector(na.omit(text_noun[,2])) ### ¹ØÀÇ ºÎ¼ö Á¤º¸µé(attr) Á¦°Å

## ´Ü¾î µî·Ï 
### °íÀ¯¸í»ç, ÀÌ¸§, Áö¸í µî
extractNoun(text1)
.libPaths() ### KoNLP_dicÀ¸·Î ÀÌµ¿! => extractNoun() ¸Ş¼Òµå »ç¿ë ½Ã dic_user ÅØ½ºÆ® ÆÄÀÏÀÇ »çÀü ÀÌ¿ë! 
useSejongDic() ### »çÀü ´Ü¾îµé µî·Ï! 
extractNoun(text1)

### extract ÇßÀ» ¶§, ¿øÇÏ´Â ´Ü¾î°¡ ¾øÀ¸¸é ¾Æ·¡Ã³·³ ¼öµ¿À¸·Î ¼³Ä¡ÇØ¾ß ÇÔ! 
buildDictionary(ext_dic = "sejong", user_dic = data.frame(c("¿ÀÇÂ¼Ò½º","±â°èÇĞ½À","»ı¹°Á¤º¸ÇĞ","´Ù¾çÇÑ"),c("ncn")), replace_usr_dic = T) ### dictionary data cache(shared pool¿¡ row ´ÜÀ§·Î ÀúÀå) <- semantic ±ÇÇÑ Ã¼Å© in Oracle 
extractNoun(text1) ### °á°ú°ªÀÌ ´Ş¶óÁü!! 

## ´Ü¾îµéÀÇ ºóµµ ¼ö Ã¼Å© 
table(str_replace_all(text2[grep("N", text2)],'/N.*','')) ### ÁúÀû ÀÚ·á => Æò±Õ, ºĞ»ê ÀÌ·± °Å ¸ø ±¸ÇÔ! => ¸í»ç º°·Î ºĞ¸® ½ÃÄÑ¼­ ºóµµ ¼ö Ã¼Å©ÇÏ´Â °Ô ³ªÀ½! 

jane <- readLines("C://data/jane.txt")
jane2 <- SimplePos09(jane) 
unlist(jane2[grep("N", jane2)]) ### °¢ ¹®ÀåÀ» µû·Î ºÒ·¯¿À±â ¶§¹®¿¡ list·Î ÀÎ½Ä => unlist¸¦ ÇØ¼­ ÀüÃ¼¸¦ ÇÏ³ªÀÇ ¹®ÀåÀ¸·Î ÀÎ½ÄÇÏ°Ô ¸¸µë! 
str_replace_all(unlist(jane2[grep("N", jane2)]),'/.*','')
janet <- table(str_replace_all(unlist(jane2[grep("N", jane2)]),'/.*','')) ; janet



# Wordcloud
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer) ### ±ÛÀÚ »ö±ò Ç¥Çö

pal <- brewer.pal(8,"Dark2") ### Dark2 »ö»ó ¸ñ·Ï¿¡¼­ 8°³ÀÇ »ö»ó ÃßÃâ
set.seed(1234) ### ³­¼ö °íÁ¤(wordcloud()´Â Ç×»ó ¸Å¹ø ´Ù¸¥ ¸ğ¾çÀÇ ¿öµå Å¬¶ó¿ìµå¸¦ ¸¸µë => µ¿ÀÏÇÑ ¿öµå Å¬¶ó¿ìµå°¡ »ı¼ºµÇµµ·Ï °íÁ¤!)

## ¿öµå Å¬¶ó¿ìµå ¸¸µé±â
wordcloud(words = rownames(janet),
          freq = janet,
          min.freq = 3,
          max.words = 390,
          random.order = F,
          rot.per = .1,
          scale = c(5,.5),
          colors = pal)
'''
names: Ãâ·ÂÇÒ ´Ü¾îµé
freq: ºóµµ ¼ö
scale: ±ÛÀÚÀÇ Å©±â c(Å«°ª, ÀÛÀº°ª)
min.freq: ÃÖ¼Ò ºóµµ ¼ö¸¦ ÁöÁ¤
max.words: ÀÌ °ª ÀÌ»óÀÇ ºóµµ ¼ö¸é »èÁ¦
random.order: Ãâ·ÂµÇ´Â ¼ø¼­¸¦ ÀÓÀÇ·Î ÁöÁ¤ 
rot.per: ´Ü¾î ¹èÄ¡
colors: Ãâ·ÂµÉ ´Ü¾îµéÀÇ »ö»ó 
'''

daily <- readLines("C://data/daily.txt")
daily2 <- SimplePos09(daily) 
unlist(daily2[grep("N", daily2)]) ### °¢ ¹®ÀåÀ» µû·Î ºÒ·¯¿À±â ¶§¹®¿¡ list·Î ÀÎ½Ä => unlist¸¦ ÇØ¼­ ÀüÃ¼¸¦ ÇÏ³ªÀÇ ¹®ÀåÀ¸·Î ÀÎ½ÄÇÏ°Ô ¸¸µë! 
str_replace_all(unlist(daily2[grep("N", daily2)]),'/.*','')
dailyt <- table(str_replace_all(unlist(daily2[grep("N", daily2)]),'/.*','')) ; dailyt

pal <- brewer.pal(10,"Dark2") ### Dark2 »ö»ó ¸ñ·Ï¿¡¼­ 8°³ÀÇ »ö»ó ÃßÃâ
set.seed(1234) ### ³­¼ö °íÁ¤(wordcloud()´Â Ç×»ó ¸Å¹ø ´Ù¸¥ ¸ğ¾çÀÇ ¿öµå Å¬¶ó¿ìµå¸¦ ¸¸µë => µ¿ÀÏÇÑ ¿öµå Å¬¶ó¿ìµå°¡ »ı¼ºµÇµµ·Ï °íÁ¤!)

## ¿öµå Å¬¶ó¿ìµå ¸¸µé±â
wordcloud(words = rownames(dailyt),
          freq = dailyt,
          min.freq = 1,
          max.words = 390,
          random.order = F,
          rot.per = .1,
          scale = c(5,.5),
          colors = pal)

## wordcloud2 
install.packages("wordcloud2")
library(devtools)
devtools::install_github("lchiffon/wordcloud2")
library(wordcloud2)

wordcloud2(dailyt, shape="pentagon")
wordcloud2(dailyt, shape="star")

## brewer.pal(ÆÈ·¹Æ®ÀÇ »öÀÇ ¼ö, ÆÈ·¹Æ® ÀÌ¸§)
library(RColorBrewer)
display.brewer.all() ### »ö»ó È®ÀÎ °¡´É => brewer.pal()¿¡ ÀÌ¿ë! 
display.brewer.pal(8,"Pastel1") ### °³º° ÆÈ·¹Æ®ÀÇ »ö»ó È®ÀÎ 
pie(slices, labels = lbls, main="Pie Chart of Countries")
pie(slices, labels = lbls, main="Pie Chart of Countries", col=c("white", "lightblue", "mistyrose", "lightcyan", 
                                                                "lavender", "cornsilk"))


pie


##################################################################################################
##################################################################################################
##################################################################################################





# 08/20/2018

# Web Scrapping

# Áß¾ÓÀÏº¸¿¡¼­ ºòµ¥ÀÌÅÍ¿Í °ü·ÃµÈ ±â»ç °Ë»ö 
## https://joongang.joins.com/ <- Internet Explorer ÀÌ¿ë 

# ºòµ¥ÀÌÅÍ °Ë»ö -> Áß¾ÓÀÏº¸ ´õ º¸±â -> ÆäÀÌÂ¡ Ã³¸® µÇ¾î ÀÖÀ½(ÁÖ¼ÒÃ¢ È®ÀÎ)
## https://search.joins.com/JoongangNews?page=4&Keyword=%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0&SortType=New&SearchCategoryType=JoongangNews
## Page Number(page=4)¿Í ÇÔ²² ASCII Ã³¸® µÇ¾î ÀÖÀ½ 
## ÀÏÀÏÈ÷ º¹»çÇØ¼­ ºÙ¿©³Ö±â ÇÏ¸é ±ÍÂúÀ½! 
## ÀÚµ¿À¸·Î ±Ü¾î¿À°Ô ÇØ¾ß ÇÔ! (À¥ÆäÀÌÁö¿¡ ´ëÇÑ ¼Ò½º ÀÌ¿ë)

## ¸¶¿ì½º ¿À¸¥ÂÊ Å¬¸¯ -> ¿ä¼Ò °Ë»ç(F12)
## ¿ŞÂÊ »ó´Ü 3°³ÀÇ ¹öÆ° Áß Æ÷ÀÎÅÍ ¸ğ¾ç Å¬¸¯ -> ºĞ¼®ÇÏ°í ½ÍÀº ±â»ç Á¦¸ñ Å¬¸¯ -> ÇØ´ç ±â»ç¿¡ ´ëÇÑ ¼Ò½º È®ÀÎ °¡´É 
## ½ÇÁ¦ ºĞ¼®ÇØ¾ß ÇÒ µ¥ÀÌÅÍ´Â ±â»ç Á¦¸ñÀÌ ¾Æ´Ï¶ó, ±× ¾È¿¡ ÀÖ´Â ³»¿ë! 
## <a href="https://news.joins.com/article/22896642" target="_blank">'Æø¿°'µµ °ßµğ´Â ¿¡³ÊÁö ÀÚ¸³µµ½Ã ¸¸µç´Ù...Àü±âµµ ¾Ë¾Æ¼­ »ı»ê</a>
### (a¶ó´Â ÅÂ±× ¾ÈÀÇ href) 
## À§ÀÇ ¼Ò½º¸¦ ´õºí Å¬¸¯ -> ÁÖ¼Ò º¹»çÇØ¼­ »õ ÅÇ¿¡¼­ ¿­±â 

## À§ÀÇ ÁÖ¼Ò¸¦ º¯¼ö¿¡ ´ã¾Æ, º¯¼ö¿¡ ÀÖ´Â URLÀ» ÇÏ³ª¾¿ ¼öÇà + ÅØ½ºÆ® ±Ü¾î¿È + Á¤Á¦ ÀÛ¾÷ 

install.packages("rvest")
library(rvest)

## Å°¿öµå(ºòµ¥ÀÌÅÍ) °Ë»öÇßÀ» ¶§ ³ª¿Â URL Copy & Paste
### https://search.joins.com/joongangnews?keyword=%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0&searchcategorytype=JoongangNews
### 2¹øÂ° ÆäÀÌÁö °¬´Ù°¡ 1¹øÂ° ÆäÀÌÁö·Î ´Ù½Ã ³Ñ¾î¿À¸é URLÀÌ ¹Ù²ñ!(Page Number Ãß°¡) <- https://search.joins.com/JoongangNews?page=1&Keyword=%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0&SortType=New&SearchCategoryType=JoongangNews

## ÆäÀÌÁö ³Ñ±â°Ô µÇ¸é, URLÀÇ ³ª¸ÓÁö ºÎºĞÀº ´Ù ¶È°°°í, "page=1" ÀÌ ºÎºĞ¸¸ ´Ş¶óÁü 
## -> for¹® ÀÌ¿ë! 

# read_html() <- ³»°¡ ±Ü¾î¿Í¾ß ÇÒ URL ÀÔ·Â! 
html <- read_html("https://search.joins.com/JoongangNews?page=1&Keyword=%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0&SortType=New&SearchCategoryType=JoongangNews")
html ### ½ÇÁ¦ ÁÖ¼Ò ºÎºĞ¸¸ Ã£¾Æ¼­ ¾î¶² º¯¼ö¿¡ ³Ö¾îÁÜ 
str(html)
## °¢ ±â»çÀÇ ¼Ò½º¸¦ º¸¸é, ³»¿ëÀº ¹Ù²î´Âµ¥, ¹Ù²îÁö ¾Ê´Â tag°¡ ÀÖÀ½! 
## ¿À¸¥ÂÊÀÇ "ÀÎ¶óÀÎ ½ºÅ¸ÀÏ" È®ÀÎ -> .list_default .headline a

# html_nodes(¼Ò½º, ÅÂ±×) 
## ºê¶ó¿ìÀú¸¶´Ù ¼Ò½º°¡ ´Ş¶ó¼­, ÄÚµå ÀÛ¼ºÇÒ ¶§ ÁÖÀÇÇÒ °Í! 
url <- html_nodes(html, ".list_default .headline") %>% ### ¿©·¯ °³ÀÇ ÅÂ±×!(".list_default", ".headline")
  html_nodes("a") %>% ### a ÅÂ±×
  html_attr("href") ### href 
url ### ³»°¡ ±Ü¾î¿Í¾ß ÇÒ ±â»çµé ÁÖ¼Ò È®ÀÎ °¡´É! 

## ÀÌÁ¦ ±â»ç¿¡¼­ ±×¸²À» Á¦¿ÜÇÑ ÅØ½ºÆ® ±Ü¾î¿Í¾ß ÇÔ! 
## ÇØ´ç ±â»ç¿¡¼­ ±â»ç º»¹®À» ¿ä¼Ò ¼±ÅÃÇÏ¸é, ÇÏ´Ü¿¡ ¾î´À ÅÂ±×¿¡ ¼ÓÇØÀÖ´ÂÁö ½±°Ô È®ÀÎ °¡´É! 
## -> div#article_body ºÎºĞ±îÁö ±Ü¾î¿À¸é µÊ! (±×°Ô º»¹® ºÎºĞ¿¡ ÇØ´ç)

## https://news.joins.com/article/22896642 
### À§ÀÇ ÁÖ¼Ò°¡ À§ÀÇ url º¯¼ö ¾È¿¡ µé¾î ÀÖ´Â ÁÖ¼Ò -> loop¹® µ¹·Á¼­ div#article_body ºÎºĞ¸¸ Ä¸ÃÄÇÏ¸é µÊ! 

html <- read_html("https://news.joins.com/article/22896642")
html ### ÀÌ ¾È¿¡ #article_body Ã£À¸¸é µÊ! 

# html_nodes(¼Ò½º, "#article_body")
txt <- html_nodes(html, "#article_body") %>% 
  html_text() 
txt ### º»¹® ³»¿ë È®ÀÎ °¡´É! 
str(txt)





# 10ÆäÀÌÁö±îÁö ±â»ç(100°³ÀÇ URL)µéÀ» ±Ü¾î¿Í¼­ º¯¼ö ÀúÀå ÈÄ, º¯¼ö¿¡ ÀÖ´Â ¹®¼­µé¿¡¼­ ¾î¶² ´Ü¾î°¡ °¡Àå ¸¹ÀÌ ³ª¿Ô´ÂÁö È®ÀÎ! 

## 1. ÇÊ¿äÇÑ(ÃßÃâÇØ¾ß ÇÒ) ÄÚµå È®ÀÎ
data <- c()
for (i in 1:10) {
  webpage <- read_html(paste0("https://search.joins.com/JoongangNews?page=",i,"&Keyword=%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0&SortType=New&SearchCategoryType=JoongangNews"))
  data <- c(data, html_nodes(webpage, ".headline") %>% ### ÅÂ±× È®ÀÎ¿¡ ÀÍ¼÷ÇØÁ®¾ß! 
              html_nodes('a') %>% 
              html_attr('href'))
}
length(data)

## 2. ÅØ½ºÆ® ÇüÅÂ·Î º¯¼ö ÀúÀå 
txt <- c()
for (i in 1:length(data)){
  webpage <- read_html(data[i])
  temp <- html_nodes(webpage, "#article_body") %>% 
    html_text()
  txt <- c(txt,temp)
}

txt2 <- extractNoun(paste(unlist(txt),collapse = ""))
txt2 <- unlist(txt2)
txt2 <- str_split(txt2,' ') ; txt2
txt3 <- unlist(Filter(function(x){nchar(x)>=2}, txt2)) ; txt3
txt4 <- table(txt3) ; txt4

txt2 <- SimplePos09(txt) 
txt3 <- str_match(txt2, '([A-Z°¡-ÆR]+/N)') 
txt4 <- str_replace_all(txt3,'/N.*','') ; txt4
txt4 <- Filter(function(x) {nchar(x) >= 2} ,txt4) ; txt4

txt5 <- table(txt4) ; txt5

pal <- brewer.pal(8,"Dark2") ### Dark2 »ö»ó ¸ñ·Ï¿¡¼­ 8°³ÀÇ »ö»ó ÃßÃâ
set.seed(1234) ### ³­¼ö °íÁ¤(wordcloud()´Â Ç×»ó ¸Å¹ø ´Ù¸¥ ¸ğ¾çÀÇ ¿öµå Å¬¶ó¿ìµå¸¦ ¸¸µë => µ¿ÀÏÇÑ ¿öµå Å¬¶ó¿ìµå°¡ »ı¼ºµÇµµ·Ï °íÁ¤!)

## ¿öµå Å¬¶ó¿ìµå ¸¸µé±â
wordcloud(words = txt4,
          freq = txt5,
          min.freq = 1,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(5,.5),
          colors = pal)

# ÅÂ±× Ã£´Â ¹ı
## °¢ ±â»ç¿¡ °øÅëµÇ´Â ÅÂ±× ¸ÕÀú Ã£Àº ´ÙÀ½, Â÷·Ê·Î ¿Ã¶ó°¡±â 

# Scrapping ½Ã ÁÖÀÇ »çÇ×
## Á¶¼±ÀÏº¸ µé¾î°¡ º¸¸é, Çï½ºÁ¶¼±, Á¶¼±°æÁ¦i µî »çÀÌÆ®°¡ ´Ù¸§ -> ÅÂ±×µµ ´Ş¶óÁü!(URLÀÌ ´Ù¸§) -> »çÀÌÆ®°¡ ´Ù¸¦ °æ¿ì´Â µû·Îµû·Î ÀÛ¾÷ ¼öÇàÇØ¾ß! 
## "Á¶¼±ÀÏº¸"¿¡ ÇØ´çµÇ´Â ´º½º ±â»ç¸¸ °Ë»ö
## -> .search_news_box ÅÂ±×·Î °Ë»ö 
## Á¶¼±ÀÏº¸´Â °°Àº URL ¹Ø¿¡µµ ¿©·¯ °³ÀÇ href°¡ ÀÖÀ½! <- .search_news ÅÂ±× ¾È¿¡µµ ¿©·¯ °³ÀÇ URL Á¸Àç(ºÒÇÊ¿äÇÑ scrapping)
## <- <dd class="thumb">¿¡ ÇØ´çµÇ´Â ºÎºĞ¸¸ ÃßÃâÇØ¾ß ÇÔ! 
## .search_news_box => .search_news => .thumb 

## Á¶¼±ÀÏº¸´Â ÇÑ ±â»ç ¾È¿¡ ¿©·¯ URL·Î ºĞ¸®µÇ¼­ Ç¥ÇöµÇ¾î ÀÖÀ½ 
## .news_article -> #news_body_all 

## 1. ÇÊ¿äÇÑ(ÃßÃâÇØ¾ß ÇÒ) ÄÚµå È®ÀÎ
data <- c()
for (i in 1:10) {
  webpage <- read_html(paste0("http://search.chosun.com/search/news.search?query=%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0&pageno=",i,"&orderby=news&naviarraystr=&kind=11000&cont1=&cont2=&cont5=&categoryname=%EC%A1%B0%EC%84%A0%EC%9D%BC%EB%B3%B4&categoryd2=&c_scope=paging&sdate=&edate=&premium="))
  data <- c(data, html_nodes(webpage, ".search_news_box .search_news .thumb") %>% 
              html_nodes('a') %>% 
              html_attr('href'))
}
length(data)
head(data)

## 2. ÅØ½ºÆ® ÇüÅÂ·Î º¯¼ö ÀúÀå 
txt <- c()
for (i in 1:length(data)){
  webpage <- read_html(data[i])
  temp <- html_nodes(webpage, ".news_body_all #news_body_id") %>% 
    html_text()
  txt <- c(txt,temp)
}
head(txt)

txt2 <- extractNoun(txt)
txt2 <- str_split(txt2,' ') ; head(txt2)
txt2 <- str_match(txt2, '([A-Z°¡-ÆR])') ; txt2
txt3 <- unlist(Filter(function(x){nchar(x)>=2}, txt2)) ; tail(txt3)
txt4 <- table(txt3) ; txt4

txt5<-c()
for (i in txt4){
  if (!i %in% c('ÀÔ·Â','Á¦ÈŞ','¾È³»','±¸µ¶','½ÅÃ»')){ 
    txt5<-c(txt2,i)
  }
}
txt5


url2 <- "http://find.mk.co.kr/new/search.php?pageNum=1&cat=&cat1=&media_eco=&pageSize=20&sub=news&dispFlag=OFF&page=news&s_kwd=%BA%F2%B5%A5%C0%CC%C5%CD&s_page=news&go_page=&ord=1&ord1=1&ord2=0&s_keyword=%BA%F2%B5%A5%C0%CC%C5%CD&s_i_keyword=%BA%F2%B5%A5%C0%CC%C5%CD&s_author=&y1=1991&m1=01&d1=01&y2=2018&m2=08&d2=20&ord=1&area=ttbd"
read_html(iconv(url2, to = "latin1"),
          encoding = "latin1")



# ÇÑ°Ü·¹
## ÅÂ±× È®ÀÎÇÒ ¶§´Â, ÀüÈÄ·Î Àß ºÁ¾ßÇÔ! <- <dd class="photo"> 
## Ç®¾îÁ® ÀÖ´Â °Å ´Ù ´İÀ» ¼ö ÀÖ´Â ÅÂ±×¸¦ html_nodes()ÀÇ ÀÎÀÚ·Î »ç¿ë! 
### search-result-section first-child -> .search-result-list -> .photo
### .article-text <- ÀÌ°Í¸¸ 2¹øÂ° html_nodes()¿¡ Áı¾î ³ÖÀ¸¸é, ±â»ç Àü¹®À» ±Ü¾î³»´Â °ÍÀÌ °¡´É! 



# ´ÙÀ½ ¿µÈ­
## ÇØ´ç ¿µÈ­ÀÇ ÆòÁ¡, ¸®ºä ºĞ¼® 
## ¸®ºä ºĞ¼®ÇÒ ¶§, ÇØ´ç ¿µÈ­¿¡ ´ëÇØ¼­¸¸ ÇÒ °ÍÀÎ°¡, ¾Æ´Ô ÇÑ À¯Àú¿¡ ´ëÇØ¼­¸¸ ÇÒ °ÍÀÎ°¡ °áÁ¤ÇÒ °Í! 
url3 <- "https://movie.daum.net/moviedb/grade?movieId=120166&type=netizen&page=1"
read_html(url3)
### .review_info -> .desc_review 

## ÆòÁ¡ÀÌ ÀÏÁ¤ÇÑ ¼öÁØ ÀÌ»óÀÎ °Í¸¸ ºĞ¼®ÇÏ°í ½ÍÀ» °æ¿ì 
### .ranking_grade -> .emph_grade
### ¿©±â¿¡ ³ª¿À´Â ¼ıÀÚ°¡ 5Á¡ ÀÌ»óÀÎ °Íµé¸¸ Ãß·Á¼­ ºĞ¼®! 

## cf) ³×ÀÌ¹ö ¿µÈ­ -> ÁÖ¼ÒÃ¢ÀÌ ¾È ¹Ù²ñ!(page number°¡ ¾È ³ª¿È)
### ÀÌ °æ¿ì´Â ¿ä¼Ò ¼±ÅÃÇØ¼­ ÆäÀÌÁö ¹øÈ£¸¦ Å¬¸¯ÇØº¸¸é, ÄÚµå¿¡ ³Ñ¹ö¸µµÇ¾î ÀÖÀ½! (scrapping ¸ø ÇÏ°Ô ¼û°Ü³õÀ½!) 
### ±×³É paging number°¡ ³ª¿À´Â Ä«Å×°í¸®¿¡¼­ ºĞ¼®! 
### .list_netizen -> (tbody -> tr ->) .title 
### Ã³À½ºÎÅÍ .titleºÎÅÍ ÇÏ¸é ¾È ³ª¿Ã ¼öµµ ÀÖÀ¸´Ï, »óÀ§ Å¬·¡½ºÀÎ .list_netizenºÎÅÍ ½ÃÀÛ! 

## 1. ÇÊ¿äÇÑ(ÃßÃâÇØ¾ß ÇÒ) ÄÚµå È®ÀÎ
data <- c()
for (i in 1:10) {
  webpage <- read_html(paste0("https://movie.daum.net/moviedb/grade?movieId=120166&type=netizen&page=",i))
  data <- c(data, html_nodes(webpage, ".review_info .desc_review "))
}
length(data)
head(data)

## 2. ÅØ½ºÆ® ÇüÅÂ·Î º¯¼ö ÀúÀå 
txt <- c()
for (i in 1:length(data)){
  webpage <- read_html(data[i])
  temp <- html_nodes(webpage, ".news_body_all #news_body_id") %>% 
    html_text()
  txt <- c(txt,temp)
}
head(txt)



## °úÁ¦(~8/22)
### Web Scrapping
### Á¤Á¦ ÀÛ¾÷
### Word Cloud 





##################################################################################################
##################################################################################################
##################################################################################################





# 08/24/2018

# ¸»¹¶Ä¡

¸»¹¶Ä¡(corpus)´Â ÀÚ¿¬¾ğ¾î ¿¬±¸¸¦ À§ÇØ Æ¯Á¤ÇÑ ¸ñÀûÀ» °¡Áö°í ¾ğ¾îÀÇ Ç¥º»À» ÃßÃâÇÑ ÁıÇÕ

```{r}
install.packages('tm')
library(tm)
data1<-readLines('c:/data/tm_example.txt')

corp1<-Corpus(VectorSource(data1)) # documents: 5 -> ¹®¼­ÀÇ °¹¼ö ÀÇ¹Ì (vector Å©±â)

```
# documents

- tm ÆĞÅ°Áö°¡ ÀÛ¾÷ÇÒ ¼ö ÀÖ´Â Æ¯º°ÇÑ ÇüÅÂ¸¦ ÀÇ¹Ì 
ÀÏ¹İÀûÀ¸·Î 1ÁÙÀÌ 1°³ÀÇ document°¡ µÈ´Ù.

```{r}
# corpus ³»¿ë º¸´Â ¹æ¹ı

summary(corp1) 
inspect(corp1) 
corp1[[1]]

Metadata:  7 # °ø¹éÀ» ±âÁØÀ¸·Î µ¢¾î¸®¸¦ ÀÇ¹Ì
Content:  chars: 42 # ±ÛÀÚ¼ö ±¸¼º

corp1[[1]]$meta

#  author       : character(0)
#  datetimestamp: 2018-08-24 01:04:02
#  description  : character(0)
#  heading      : character(0)
#  id           : 1
#  language     : en
#  origin       : character(0)

corp1[[1]]$content # ¹®¼­³»¿ëÀ» º¼ ¼ö ÀÖ´Ù.

```
# ´Ü¾î ºĞ¼® - matrix·Î ¹Ù²ã¼­ »ç¿ëÀ» ÇØ¾ßÇÑ´Ù.
## tm ÆĞÅ°Áö°¡ ºĞ¼®ÇÒ ¼ö ÀÖ´Â Term-Document Çü½ÄÀÇ matrix·Î º¯È¯

```{r}
tdm<-TermDocumentMatrix(corp1)
tdm
m<-as.matrix(tdm) # ÇÑ±ÛÀÚ´Â ¹«Á¶°Ç ¹ö¸°´Ù.
m

```
# ÇÑ±ÛÀÚµµ ºĞ¼®À» ÇÏ°í ½Í´Ù¸é ¿É¼ÇÀ» »ç¿ëÇÑ´Ù.

```{r}
tdm<-TermDocumentMatrix(corp1,control=list(WordLengths=c(1,Inf)))

# WordLengths -> ´Ü¾î ºĞ¼® °¹¼ö¸¦ Á¤ÇØ¼­ ±¸°£À» Á¤ÇÑ´Ù.
m<-as.matrix(tdm)
m
```
# ¡Ú¡Ú  gsub »ç¿ë½Ã  ÁÖÀÇÇØ¾ßÇÑ´Ù.  (corpus »ç¿ë½Ã)

# tm_map : ¸»¹¶Ä¡ Á¤Á¦ ÇÔ¼ö
```{r}
corp2<-tm_map(corp1,stripWhitespace)

corp2<-tm_map(corp2,tolower) # ´ë¹®ÀÚ°¡ ÀÖÀ» °æ¿ì ¼Ò¹®ÀÚ·Î º¯È¯

corp2<-tm_map(corp2,removeNumbers) # ¼ıÀÚÁ¦°Å

corp2<-tm_map(corp2,removePunctuation) # Æ¯¼ö¹®ÀÚ Á¦°Å

inspect(corp2) # °ª È®ÀÎ

```
# ¸»¹¶Ä¡¿¡¼­ gsubÀ» ÀÌ¿ëÇÏ°í ½Í´Ù¸é 

```{r}

corp3<-gsub('~','',corp1) # ÀÌ°Ç ºÒ°¡´ÉÇÏ´Ù 

tostring<-content_transformer(function(x,from,to) gsub(from,to,x)) 

corp3<-tm_map(corp1, tostring,"~","")
corp3<-tm_map(corp3, tostring,"!","")
corp3<-tm_map(corp3, tostring,",","")

inspect(corp3)
```
# ºÒ¿ë¾î Á¦°Å(ÀüÄ¡»ç, °ü»ç µî) 

```{r}
stopwords('en') # Á¦°ÅÇÏ°í ½ÍÀº ¿ë¾î¸¦ ¿©±â´Ù Ãß°¡ (enÀº ¿µ¾î¸¦ ÀÇ¹Ì)

sword<-c('and','but','not')

corp2<-tm_map(corp2,removeWords,sword) # ³»°¡ ¿øÇÏ´Â °ª¸¸ Á¦°ÅÇÏ´Â ¹æ¹ı


sword<-c(stopwords('en'),'and','but','not')

inspect(corp2)
tdm2 <- TermDocumentMatrix(corp2)
m2 <- as.matrix(tdm2)
m2

freq1<-sort(rowSums(m2),decreasing=T) # ºóµµ¼ö Ã¼Å©
freq1

freq2<-sort(colSums(m2),decreasing=T) # ¹®ÀåÀÇ ´Ü¾î ¼ö
freq2


# Æ¯Á¤ È½¼ö ÀÌ»ó ¾ğ±ŞµÈ ´Ü¾îµé¸¸ Ãâ·Â

findFreqTerms(tdm2,2) # ¸»¹¶Ä¡ ¸¸µé¾î ³õÀº °É·Îµµ °¡´ÉÇÏ´Ù.

```
# Æ¯Á¤ ´Ü¾î¿Í »ó°ü°ü°è¸¦ Ã£°í ½ÍÀ» °æ¿ì 

```{r}
findAssocs(tdm,"apple",0.5)

library(RColorBrewer)
library(wordcloud)
palete <- brewer.pal(7,"Set3")
wordcloud(names(freq1),freq=freq1,min.freq=1,colors=palete)

barplot(freq1,main="tm packages",las=2)

ggplot() # Ç¥ÇöÇØº¸±â

```
# ¿¬°üÀÖ´Â ´Ü¾î ±×·¡ÇÁ·Î ¸¸µé±â (°ü°èµµ ±×¸®±â)
```{r}
# Çà·ÄÀÇ °ö »ç¿ëÇÏ¸é ¿¬°üÀÖ´Â ´Ü¾î¸¦ ºĞ¼®ÇÏ´Â °ÍÀÌ °¡´ÉÇÏ´Ù.
mm<-m2%*%t(m2)
mm

m2
t(m2)

install.packages('igraph')
library(igraph)

g<-graph.adjacency(mm,weighted=T,mode="undirected")
plot(g)

# ÀÚ±âÀÚ½Å ¾ø¾Ö±â

g2<-simplify(g) # Àç±Í Á¦°Å
plot(g2)

```





##################################################################################################
##################################################################################################
##################################################################################################





# 08/27/2018

# È÷½ºÅä±×·¥Àº ÀÚ·á°¡ ¸ğ¿© ÀÖ´Â À§Ä¡³ª ÀÚ·áÀÇ ºĞÆ÷¿¡ °üÇÑ ´ë·«ÀûÀÎ Á¤º¸¸¦ ÇÑ ´«¿¡ ÆÄ¾ÇÇÒ ¼ö ÀÖ´Ù´Â ÀåÁ¡Àº ÀÖÁö¸¸, 
# ±¸Ã¼ÀûÀÎ ¼öÄ¡ Á¤º¸¸¦ ½±°Ô ¾Ë¾Æ º¼ ¼ö ¾ø´Ù´Â ´ÜÁ¡ÀÌ ÀÖ´Ù. 

# µû¶ó¼­ ÃÖ¼Ò°ª, Á¦1»çºĞÀ§¼ö, ÁßÀ§¼ö, Á¦3»çºĞÀ§¼ö, ÃÖ´ë°ªÀÇ ´Ù¼¸°¡Áö ¿ä¾à ¼öÄ¡ µîÀ» ÀÌ¿ëÇÑ »óÀÚ±×¸²(boxplot)À¸·Î ³ªÅ¸³¾ ¼ö ÀÖ´Ù. 

boxplot(noise)
boxplot(noise, col = "red", horizontal = T) ### horizontal shape 

mean(noise)
median(noise)
var(noise)
sd(noise)
min(noise)
max(noise)

quantile(noise) ### min, 25%, median, 75%, max È®ÀÎ °¡´É 
quantile(noise, type=2) ### ÇØ´çµÇ´Â ½ÇÁ¦ µ¥ÀÌÅÍ È®ÀÎ °¡´É(type = 2·Î ÇÏ´Â °Ô ÀÏ¹İÀû!)

summary(noise) ### À§(type = 1)¿Í µ¿ÀÏ

quantile(noise, type=2)["25%"] ### 1st Quantile¿¡ ÇØ´çµÇ´Â °ª ÃßÃâ 
quantile(noise, type=2)["75%"] ### 3rd Quantile¿¡ ÇØ´çµÇ´Â °ª ÃßÃâ 
Q3 <- quantile(noise, 0.75) 
Q1 <- quantile(noise, 0.25) 

# median <- length°¡ Â¦¼ö³Ä È¦¼ö³Ä¿¡ µû¶ó °è»ê½ÄÀÌ ´Ş¶óÁü! 



# Interquantile Range <- boxplot¿¡¼­ ±ä Â¦´ë±â »çÀÌÀÇ ±¸°£(outliers Á¦¿Ü)
## IQRÀ» °¡Áö°í outliers È®ÀÎ! 
## IQR = Á¦3»çºĞÀ§¼ö - Á¦1»çºĞÀ§¼ö 
noise_iqr <- IQR(noise, type = 2) ### "type = 2" ²À ³Ö¾îÁà¾ß ÇÔ! 
uf - lf ### »çºĞÀ§¼ö ¹üÀ§: 45.1 ~ 76.3

fivenum(noise)
fivenum(noise)[2]-1.5*IQR(noise) 
fivenum(noise)[2]+1.5*IQR(noise)

# lower fence 
lf <- quantile(noise, type=2)[2] - 1.5*noise_iqr ### µ¥ÀÌÅÍÀÇ ÃÖÀú ±âÁØ(ÀÌ°Å ¹Ì¸¸Àº outliers)
fivenum(noise)[2]-1.5*IQR(noise)

# upper fence
uf <- quantile(noise, type=2)[2] + 1.5*noise_iqr ### µ¥ÀÌÅÍÀÇ ÃÖ°í ±âÁØ(ÀÌ°Å ÃÊ°ú´Â outliers)
fivenum(noise)[2]+1.5*IQR(noise)

## Outliers Ãâ·ÂÇÏ´Â ¹ı
noise[noise < lf]
noise[noise > uf]

## »çºĞÀ§¹üÀ§ ³»ÀÇ ÃÖ¼Ò°ª, ÃÖ´ë°ª Ãâ·Â 
min(noise[noise>=lf & noise<=uf])
max(noise[noise>=lf & noise<=uf])

install.packages("outliers")
library(outliers)
chisq.out.test(noise, variance=var(noise), opposite = FALSE)
chisq.out.test(noise, variance=var(noise), opposite = TRUE)

# boxplot¿¡ ¼ıÀÚ ÀÔ·Â 
text(x=lf,y=1.1,labels=lf,pos=3) 
text(x=uf,y=1.1,labels=uf,pos=3) 
text(x=quantile(noise, type=2)["25%"],y=1.2,labels=quantile(noise, type=2)["25%"],pos=3) 
text(x=quantile(noise, type=2)["75%"],y=1.2,labels=quantile(noise, type=2)["75%"],pos=3) 
text(x=median(noise),y=1.2,labels=median(noise),pos=3)
text(x=44,y=1,labels=44,pos=3)
text(x=77.1,y=1,labels=77.1,pos=3)
text(x=76.5,y=.95,labels=76.5,pos=3)

## Á¦1»çºĞÀ§¼ö Ãâ·Â
boxplot(noise, col = "red", horizontal = T)
text(quantile(noise,.25,type=2)+.5,1,labels=quantile(noise,.25,type=2),col="blue") ### quantile(noise,.25,type=2) <- 1»çºĞÀ§¼ö ÃßÃâÇÏ´Â ¹ı ¿Ü¿ö³õÀ» °Í! 

## ÁßÀ§¼ö Ãâ·Â
text(quantile(noise,.50,type=2)+.5,1,labels=quantile(noise,.50,type=2),col="blue")

## Á¦3»çºĞÀ§¼ö Ãâ·Â
text(quantile(noise,.75,type=2)+.5,1,labels=quantile(noise,.75,type=2),col="blue")

## »çºĞÀ§¹üÀ§ ³»¿¡ ÃÖ¼Ò°ª Ãâ·Â(¿ŞÂÊ Â¦´ë±â)
lf <- quantile(noise,.25,type=2) - 1.5*IQR(noise,type=2)
uf <- quantile(noise,.75,type=2) + 1.5*IQR(noise,type=2)
text(min(noise[noise>=lf & noise<=uf])+.5,1,labels=min(noise[noise>=lf & noise<=uf]),col="blue")

## »çºĞÀ§¹üÀ§ ³»¿¡ ÃÖ´ë°ª Ãâ·Â(¿À¸¥ÂÊ Â¦´ë±â)
text(max(noise[noise>=lf & noise<=uf])+.5,1,labels=max(noise[noise>=lf & noise<=uf]),col="blue")

## ÀÌ»óÄ¡ Ãâ·Â
text(noise[noise < lf], 1.03, labels = noise[noise < lf], col="red", cex=.7)
text(noise[noise > uf], 1.03, labels = noise[noise > uf], col="red", cex=.7)





# Machine Learning <- ¼ÒÇÁÆ®¿ş¾î 
## - ÀÎ°øÁö´É(Artificial Intelligence - ±â°è·Î ¸¸µé¾îÁø Áö´É)ÀÇ ÇÑ ºĞ¾ß·Î¼­ ÄÄÇ»ÅÍ°¡ ÇĞ½ÀÇÒ ¼ö ÀÖµµ·Ï ÇÏ´Â ¾Ë°í¸®Áò°ú ±â¼úÀ» °³¹ßÇÏ´Â ºĞ¾ß 
## - Åë°è, µ¥ÀÌÅÍ °úÇĞ, ÄÄÇ»ÅÍ °úÇĞ 
## - ºĞ·ù(Classification): KNN(K-Nearest Neighbors) ¾Ë°í¸®Áò, ³ªÀÌºêº£ÀÌÁî(naive bayes), °áÁ¤Æ®¸®(decision tree)
### ÇÑ°èÈ®·ü(apply <- margin=1(horiz sum), 2(vert sum)), Á¶°ÇºÎÈ®·ü, °áÁ¤È®·ü
## - ÆĞÅÏ°¨Áö(pattern detection): ¿¬°ü±ÔÄ¢
## - ¼öÄ¡¿¹Ãø(numeric prediction): È¸±Í(regression)
## - ±ºÁıÈ­(clustering): KÆò±Õ(kmeans) ±ºÁıÈ­ 
## - ½Å°æ¸Á(neural network) -> Deep Learning(in Python)

# Learning
## - Supervised Learning(ÁöµµÇĞ½À) -> Classification(ºĞ·ù), Regression(¿¹Ãø)
### "Labels"ÀÌ ´Ş·Á ÀÖ´Â Á¤ÇØÁ® ÀÖ´Â µ¥ÀÌÅÍ¸¦ °¡Áö°í ÇĞ½À, training setÀ» °¡Áö°í ÇĞ½À
### ex. ÀÌ¹ÌÁö(°³, °í¾çÀÌ) °¡Áö°í ÇĞ½À, Spam Mail Ã³¸®, ½ÃÇè ¼ºÀû ¿¹Ãø(Labels - "ÇÕ°İ", "ºÒÇÕ°İ")
### È¸±Í: ½ÃÇè ¼ºÀû ¿¹Ãø
### Binary Classification: "ÇÕ°İ", "ºÒÇÕ°İ" <- µÎ °¡Áö¸¸ ºĞ·ù
### Multi Label Classification: A, B, C, D, F ÇĞÁ¡ <- ¿©·¯ Ä«Å×°í¸®·Î ºĞ·ù 

## - Unsupervised Learning(ºñÁöµµÇĞ½À) -> Clustering 
### LabelsÀÌ ¾ø´Â µ¥ÀÌÅÍ, Á÷Á¢ µ¥ÀÌÅÍ¸¦ °¡Áö°í ÇĞ½À
### ex. À¯»çÇÑ ´º½º¸¦ ±×·ìÀ¸·Î ¸ğÀ¸´Â ÀÛ¾÷, ºñ½ÁÇÑ ´Ü¾îµéÀ» ¸ğÀ¸´Â ÀÛ¾÷ 



# KNN(K-Nearest Neighbors - ÃÖ±ÙÁ¢ÀÌ¿ô) ¾Ë°í¸®Áò <- À¯À¯»óÁ¾ <- °Å¸® °è»ê
## K-NN¿¡¼­ K°ªÀº 
### 1. sqrt(n)
### 2. È¦¼ö 

## »çÈ¸ÀûÀÎ °ü°è¸¦ °üÂûÇØ º¸¸é
## - ´ë·«ÀûÀ¸·Î ºñ½ÁÇÑ »ç¶÷³¢¸® ¸ğÀÌ´Â ¼ºÁú 
## - ºñ½ÁÇÑ ÃëÇâÀÇ »ç¶÷³¢¸® ¸ğ¿©¼­ µ¿È£È¸¸¦ ¸¸µé°í
## - ºñ½ÁÇÑ ºÎ·ùÀÇ °èÃşÀÇ »ç¶÷³¢¸® Ä£ºĞÀ» ¸Î±âµµ ÇÑ´Ù. 
## °ø°£ÀûÀÎ °ü°è¸¦ °üÂûÇØ º¸¸é
## - °¡±¸Á¡ÀÌ ¸ğÀÌ´Â »ó°¡ Áö¿ªÀÌ µû·Î Çü¼ºÀÌ µÇ¾î ÀÖ´Ù. 
## - ÇÑ¾à¹æÀÌ ¹ĞÁıµÇ¾î ÀÖ´Â Áö¿ªÀÌ µû·Î ¸ğ¿© ÀÖ´Â °æ¿ì°¡ ¸¹´Ù. 

## °Å¸® °è»ê(ÇÇÅ¸°í¶ó½ºÀÇ Á¤¸®), À¯Å¬¸®µå °Å¸®(Euclidean Distance) cf. ·çÆ® Á¦¿ÜÇÏ¸é ¸ÇÇÏÅº °Å¸®! 
### -> ±×·¡ÇÁ »ó¿¡ Á¡µéÀ» ±ºÁı½ÃÅ°°í, ÇÑ Á¡ÀÌ ¾î´À cluster¿¡ ´õ °¡±î¿î Áö °Å¸® °è»ê! => °¡Àå °Å¸®°¡ °¡±î¿î cluster·Î ºĞ·ù! 
### K: °³¼ö ex. 1-NN: °¡Àå °¡±î¿î 1°³ÀÇ Á¡À» °¡Áö°í ºĞ·ù 
### cf1. 3-NN: °¡Àå °¡±î¿î 3°³ÀÇ Á¡À» ±âÁØÀ¸·Î ÃÖ±ÙÁ¢ ÀÌ¿ôÀ» Ã£¾Æ, °Å¸®°¡ °¡±î¿î Á¡µéÀÇ ºóµµ ¼ö°¡ °¡Àå ³ôÀº ÂÊÀ¸·Î ºĞ·ù
### cf2. 100-NN: ±×³É ´Ü¼øÈ÷ ºóµµ ¼ö°¡ ³ôÀº cluster¿¡ ºĞ·ù => Á¦´ë·Î ºĞ·ù°¡ ¾È µÊ! <- °úÀûÇÕ
## K°ªÀº ÁÂÇ¥ »ó ÀüÃ¼ Á¡µéÀÇ ¼ö(n)ÀÇ "·çÆ®°ª"À¸·Î Á¤ÇÏ´Â °Ô ÀÏ¹İÀû! <- sqrt(n)
### K°¡ Â¦¼öÀÌ¸é ºĞ·ù°¡ ¾î·Á¿ï ¼ö ÀÖÀ½ => "È¦¼ö" ´ÜÀ§!!

like <- read.csv("C://data/like.csv", stringsAsFactors = F, header = T)
head(like) ### Å¸ÀÔÀ¸·Î ºĞ·ù(¸Ç ¿À¸¥ÂÊÀÇ ÄÃ·³ÀÌ LabelÀÌ µÊ)
str(like)

colnames(like) <- c("talk","book","travel","school","tall","skin","muscle","label")
str(like)

test <- data.frame(talk=70, book=50, travel=30, school=70, tall=70, skin=40, muscle=50) ### test dataset(µ¥ÀÌÅÍÇÁ·¹ÀÓ)
### cf. training dataset -> À§ÀÇ like ÆÄÀÏ¿¡¼­ dataset ¸¸µë(µ¥ÀÌÅÍÀÇ ¾çÀÌ ¸¹À¸¸é ¸¹À» ¼ö·Ï ÁÁÀ½)

# Machine Learning Àü¿ë package 
install.packages("class")
library(class)

train <- like[,-8] ### training dataset <- like¿¡¼­ label Á¦¿Ü! 
group <- like[,8] ### label¸¸ µû·Î »Ì¾Æ³õÀ½ 

## knn(train, test, label, k=n) -> °Å¸® °è»êÇØ¼­ ÇØ´çµÇ´Â labelÀ» ¸®ÅÏÇØÁÖ´Â ¸Ş¼Òµå
knn(train, test, group, k = 1, l = 0, prob = FALSE, use.all = TRUE) ### 1-NN
knn(train, test, group, k = 3, l = 0, prob = FALSE, use.all = TRUE) ### 3-NN
knn(train, test, group, k = 14, l = 0, prob = FALSE, use.all = TRUE) ### 14-NN <- k°ªÀ» ¾î¶»°Ô ¼³Á¤ÇÏ´À³Ä¿¡ µû¶ó ÀÇ»ç°áÁ¤ÀÇ °á°ú°¡ ´Ş¶óÁú ¼ö ÀÖÀ½ 
knn(train, test, group, k = 1, l = 0, prob = TRUE, use.all = TRUE) ### È®·ü°ª±îÁö È®ÀÎ





##################################################################################################
##################################################################################################
##################################################################################################





# 08/28/2018

## ¸Ó½Å·¯´×¿¡ °¡Àå Áß¿äÇÑ °Ç µ¥ÀÌÅÍ!!!
## K-NNÀº ÄÄÇ»ÅÍ »ç¾çÀÌ ÁÁ¾Æ¾ß ÇÔ

## K-NN <- °Å¸® °è»ê => k°ªÀÌ °¡Àå Áß¿ä 



# º¯¼ö Ç¥ÁØÈ­ 
## ¼­·Î ´Ù¸¥ ±âÁØÀ» °¡Áø È®·ü º¯¼öµéÀ» »ó´ëÀûÀ¸·Î ºñ±³ÇÒ ¼ö ÀÖ´Â µµ±¸
## Æò±Õ°ú Ç¥ÁØÆíÂ÷¸¦ N(0,1)·Î µ¿ÀÏÈ­! 
## X ~ N(mean, var)
## Z ~ N(0,1)
## Z = (°üÃø°ª - Æò±Õ)/Ç¥ÁØÆíÂ÷
'''
              ÇÑ±¹      ¹Ì±¹      ÀÏº»
Æò±Õ          200¸¸¿ø   2500´Ş·¯  21¸¸¿£
Ç¥ÁØÆíÂ÷      10¸¸¿ø    300       2.5¸¸
              215¸¸¿ø   2800´Ş·¯  23¸¸¿£
'''
z1 <- (215-200)/10 ; z1
z2 <- (2800-2500)/300 ; z2
z3 <- (23-21)/2.5 ; z3

# [¹®Á¦185]  ³ªÀÌ, ¿ù¼öÀÔ, »óÇ°±¸¸Å¿©ºÎ¸¦ °®´Â µ¥ÀÌÅÍ°¡ ÀÖ´Ù.
# ÀÌ µ¥ÀÌÅÍ¸¦ ÀÌ¿ëÇØ¼­ ³ªÀÌ°¡ 44 ÀÌ°í ¿ù±ŞÀÌ 400 ¸¸¿øÀÎ »ç¶÷ÀÌ
# »óÇ°À» ±¸¸ÅÇÒÁö ºñ±¸¸ÅÇÒÁö¸¦ knn ºĞ·ù ¾Ë°í¸®ÁòÀ¸·Î ºĞ¼®ÇÏ¼¼¿ä.

## ³ªÀÌ¿Í ¿ù¼öÀÔÀÇ "´ÜÀ§"¸¦ ½Å°æ½áÁà¾ß ÇÔ! 
## º¯¼öµéÀÌ µ¿ÀÏÇÑ ¼öÄ¡°¡ ¾Æ´Ô -> Á¦´ë·Î µÈ ºñ±³, ºĞ¼® ºÒ°¡´É! 

## º¯¼ö¸¦ Ç¥ÁØÈ­ÇÏ´Â ÀÌÀ¯

## Degree of Freedom
### 3:3 ¹ÌÆÃ¿¡¼­, Ã¹¹øÂ° µÎ »ç¶÷ÀÌ ¿©ÀÚ ¼±ÅÃÇÏ°í, ¸¶Áö¸· »ç¶÷Àº ¼±ÅÃÀÇ ¿©Áö°¡ ¾øÀ½
### 3¸íÀÇ »ç¶÷ Áß¿¡, ½ÇÁúÀûÀ¸·Î 2¸í¿¡°Ô¸¸ ¼±ÅÃ±ÇÀÌ ÀÖ´Â °Í 
### -> DF = n-1 = 2

## scale ¸Ş¼Òµå(ÀÌ°É·Î Z°ª ±¸ÇÒ ¼ö ÀÖÀ½!)
### scaled:center <- Æò±Õ
### scaled:scale <- Ç¥ÁØÆíÂ÷
buy <- read.csv("c:/data/buy.csv" , stringsAsFactors = F , header = T)
buy$age <- scale(buy$³ªÀÌ)
buy$pay <- scale(buy$¿ù¼öÀÔ)

# Ç¥ÁØÈ­
# 0~1¿¡ ÇØ´çÇÏ´Â °ª¸¸ Ç¥ÁØÈ­ ½ÃÅ°°í ½ÍÀ» ¶§ 
'''
             x - ÃÖ¼Ò°ª
Ç¥ÁØÈ­ = -----------------
          ÃÖ´ë°ª - ÃÖ¼Ò°ª
'''
range01 <- function(x){(x-min(x))/(max(x)-min(x))} ### ¸Ş¼Òµå ±¸Çö 

x <- c(1:5)
y <- seq(10,50,10)
(x-min(x))/(max(x)-min(x))
(y-min(y))/(max(y)-min(y))
?scale



# ÀÌ¹Ì ºĞ·ù°¡ Àß µÇ¾î ÀÖ´Â Áö °ËÁõ
## º×²É µ¥ÀÌÅÍ
## SepalLength : ²É¹ŞÄ§ÀÇ ±æÀÌ
## SepalWidth  : ²É¹ŞÄ§ÀÇ Æø
## PetalLength : ²ÉÀÙÀÇ ±æÀÌ
## PetalWidth  : ²ÉÀÙÀÇ ³Êºñ
## º×²ÉÀÇ Á¾·ù : Iris-setosa, Iris-versicolor, Iris-virginica
iris <- read.csv("c:/data/iris.csv" , stringsAsFactors = F , header = T)
iris
str(iris)
summary(iris)

sample_n(iris,10)

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

iris_n <- as.data.frame(lapply(iris[1:4], normalize))

summary(iris_n)
table(iris$Name)
set.seed(1234) ### ³­¼ö °íÁ¤ <- sampling ÇÒ ¶§ °°ÀÌ ¼öÇà(ÀÌ°Å ¾È ÇÏ¸é ¸Å¹ø °á°ú°¡ ¹Ù²ñ!)

## Training Set(67%), Test Set(33%)
### Á¤È®ÇÏ°Ô(°ñ°í·ç) Àß ºĞ·ùµÇ¾î¾ß! 
### ÇÏ³ªÀÇ Ä«Å×°í¸®ÀÇ µ¥ÀÌÅÍ¸¸ samplingµÇ¸é ºĞ¼® °á°ú¿¡ ¹®Á¦°¡ »ı±æ ¼ö ÀÖÀ½!! 
### sample(n, data, replace=TRUE, percentage) <- ³­¼ö¸¦ »Ì¾Æ³»´Â ¸Ş¼Òµå(n: »ùÇÃ ¼ö, "replace=TRUE": ¹İº¹ ¿©ºÎ)
iris_sample <- sample(2,nrow(iris), replace=TRUE, prob = c(0.67,0.33)) ### standardisation ÇÏÁö ¾Ê¾ÒÀ» ¶§ sampling 
iris_training <- iris[iris_sample == 1, 1:4]
iris_training
iris_train_label <- iris[iris_sample == 1, 5]
iris_train_label

iris_test <- iris[iris_sample == 2, 1:4]
iris_test
iris_test_label <- iris[iris_sample == 2, 5]
iris_test_label

library(class)

iris_model <- knn(iris_training,iris_test,iris_train_label, k=3)
iris_model

install.packages("gmodels")
library(gmodels)

CrossTable(x = iris_test_label, y = iris_model, prop.chisq=FALSE) ### test data(iris_model(knn), yÃà)¿Í ½ÇÁ¦ data(iris_test_label, xÃà)°¡ matchingÀÌ Àß µÇ´Â Áö Ã¼Å©
'''
                | iris_model 
iris_test_label |     setosa | versicolor |  virginica |  Row Total | 
----------------|------------|------------|------------|------------|
setosa |         13 |          0 |          0 |         13 |              <- sentosa 13°³ ¿¹Ãø Àß µÊ
|      1.000 |      0.000 |      0.000 |      0.325 | 
|      1.000 |      0.000 |      0.000 |            | 
|      0.325 |      0.000 |      0.000 |            | 
----------------|------------|------------|------------|------------|
versicolor |          0 |          9 |          1 |         10 |          <- 1°³°¡ »à½Î¸® ³² => ¿¹ÃøÀÌ Àß ¾È µÊ! => ÀÌ°Å¿¡ ´ëÇØ °í¹ÎÇØºÁ¾ß ÇÔ
|      0.000 |      0.900 |      0.100 |      0.250 |                        => °³¼±!(Standardisation)
|      0.000 |      0.750 |      0.067 |            | 
|      0.000 |      0.225 |      0.025 |            | 
----------------|------------|------------|------------|------------|
virginica |          0 |          3 |         14 |         17 |           <- 3°³ ¿¹Ãø Àß¸øµÊ(¾î¶² µ¥ÀÌÅÍ°¡ Àß¸øµÇ¾ú´Â Áö´Â È®ÀÎÇÒ ¼ö ¾øÀ½)
|      0.000 |      0.176 |      0.824 |      0.425 |                        => 3°³°¡ ¸Â°í 14°³°¡ Æ²¸± ¼öµµ ÀÖÀ½! 
|      0.000 |      0.250 |      0.933 |            | 
|      0.000 |      0.075 |      0.350 |            | 
----------------|------------|------------|------------|------------|
Column Total |         13 |         12 |         15 |         40 | 
|      0.325 |      0.300 |      0.375 |            | 
----------------|------------|------------|------------|------------|
'''

## Standardisation 
iris_sample_n <- sample(2,nrow(iris_n), replace=TRUE,prob = c(0.67,0.33)) ### sample(2, replace=TRUE): µ¥ÀÌÅÍ¸¦ ·£´ıÇÏ°Ô 1,2·Î ÂïÀ½! 
iris_training_n <- iris_n[iris_sample_n == 1, 1:4] ### 1¿¡ ÇØ´çµÇ´Â µ¥ÀÌÅÍ ÃßÃâ 
iris_training_n
iris_train_label <- iris[iris_sample_n == 1, 5]
iris_train_label
str(iris_train_label)

iris_test_n <- iris_n[iris_sample_n == 2, 1:4] ### 2¿¡ ÇØ´çµÇ´Â µ¥ÀÌÅÍ ÃßÃâ 
iris_test_n
iris_test_label <- iris[iris_sample_n == 2, 5]
iris_test_label

iris_model_n <- knn(iris_training_n,iris_test_n,iris_train_label, k=3)
iris_model_n

CrossTable(x = iris_test_label, y = iris_model_n, prop.chisq=FALSE)

## sample()
x <- 10:20

s1 <- sample(2, length(x), replace=T, prob=c(.60,.40)) ### 6:4ÀÇ ºñÀ²·Î ¾È »ÌÈ÷´Â °æ¿ìµµ ÀÖÀ½! 
x[s1==1]
x[s1==2]

set.seed(1234)
s2 <- sample(1:10, 6) ### ÀÌ°Ô ´õ ³ªÀ½! 
x[s2]
x[-s2]





##################################################################################################
##################################################################################################
##################################################################################################





# 08/29/2018

# ÀÚ·áÀÇ Áß½É 

# Áß½ÉÀ§Ä¡(central location)
## - °üÂûµÈ ÀÚ·áµéÀÌ ¾îµğ¿¡ ÁıÁßµÇ¾î ÀÖ´Â°¡¸¦ ³ªÅ¸³½´Ù.
## - ´ëÇ¥°ª(´ëÇ¥ÇÒ ¼ö ÀÖ´Â °ª)
## - mean, median, mode

# Æò±Õ
## »ê¼úÆò±Õ(arithmetic mean)
## ±âÇÏÆò±Õ(geometric mean) 

# »ê¼úÆò±Õ(mean)
## - ÀÚ·áµéÀÇ ¹«°Ô Áß½É
### Àü¼öÁ¶»ç(population) vs Ç¥º»Á¶»ç(sample) => samplingÀ» ÅëÇØ ÀüÃ¼¸¦ ¿¹Ãø!(Åë°è)
### population mean = mu // sample mean = xbar
## - ¥ì(¸ğÁı´Ü Æò±Õ)
## - xbar(Ç¥º»Æò±Õ)

# °¡ÁßÆò±Õ(weighted mean)
## - °¢ Ç×ÀÇ ¼öÄ¡¿¡ ±× Áß¿äµµ¿¡ ºñ·ÊÇÏ´Â °è¼ö¸¦ °öÇÑ ´ÙÀ½ »êÃâÇÑ Æò±Õ 
## - Á¤¹Ğµµ³ª µé¾î¿Â ¾çÀÌ °°Áö ¾ÊÀº ¹°Ç°ÀÇ Æò±Õ °¡°İÃ³·³ ¿ø·¡ÀÇ ¼öÄ¡°¡ µ¿µîÇÏÁö ¾Ê´Ù°í »ı°¢µÇ´Â °æ¿ì »ç¿ë 
### ex. Áß°£°í»ç ±â¸»°í»ç ÇÕ
### ((70*±â¸»°í»ç)+(30*Áß°£°í»ç))/(70+30)

# ±âÇÏÆò±Õ(Geometric mean)
## - °öÀÇ ÇüÅÂ·Î º¯È­ÇÏ´Â ÀÚ·á
## - ºñÀ²ÀÇ Æò±Õ°è»ê¿¡ ¸¹ÀÌ »ç¿ë
## - ¹°°¡»ó½Â·ü, ÀÎ±¸º¯µ¿·ü, ¿¬Æò±ÕÁõ°¡À²

# Á¶È­Æò±Õ(harmonic mean)
## - ¼Óµµ µî°ú °°ÀÌ ¿©·¯ ´ÜÀ§°¡ °áÇÕµÇ¾î ÀÖÀ»¶§ °è»ê

# Àı»çÆò±Õ, Àı´ÜÆò±Õ(trimmed mean)
## - ÀÚ·á Áß¿¡¼­ Å« °üÃø°ªÀÌ³ª ÀÛÀº °üÃø°ªÀ» °¢°¢ ¸î ¸¸Å­ ¹ö¸° ³ª¸ÓÁö °üÃø°ªµé·ÎºÎÅÍ ±¸ÇÑ Æò±Õ 
## - Æò±ÕÀº ¾çÂÊ ³¡°ªÀÇ (ÃÖ¼Ò, ÃÖ´ë) º¯È­¿¡ ¹Î°¨
## - ÃÖ¼Ò, ÃÖ´ë¸¦ Á¦°ÅÇÑ ÈÄ Æò±Õ 
## - ½ºÆ÷Ã÷ °æ±â¿¡ ¸¹ÀÌ »ç¿ë 
## - 2014³â ±¹È¸ÀÇ¿ø Àç»ê °ø°³ -> 97¾ï 5667¸¸¿ø => 500¾ï ÀÌ»ó Àı»çÇÑ Æò±Õ -> 18¾ï 686¸¸¿ø 

# Áß¾Ó°ª(median)
## - Áß½ÉÀ¸·Î ÁÂ¿ì ºĞÆ÷ ¸éÀûÀÌ °°´Ù. (Á¤Áß¾Ó)
## - ÀÌ»óÄ¡ÀÇ ¿µÇâÀ» ¹ŞÁö ¾ÊÀ½ 
## - ÀÚ·á¸¦ ¼ø¼­´ë·Î ´Ã¾î ³õ°í ÀüÃ¼ ÀÚ·á °¹¼ö Áß¿¡ 50% µÇ´Â °ª 
### length°¡ È¦¼öÀÎÁö Â¦¼öÀÎÁö¿¡ µû¶ó ´Ù¸§! 

# ÃÖºó°ª(mode)
## - ºóµµ ¼ö°¡ °¡Àå ³ôÀº °ª 
### Á¤±ÔºĞÆ÷: Áß¾Ó°ª°ú ÃÖºó°ªÀÌ °°À½? 

# ÀÚ·áÀÇ ÆÛÁø Á¤µµ
## - ´ëÇ¥°ªÀ» Áß½ÉÀ¸·Î ¾ó¸¶³ª ÀÚ·áµéÀÌ ÆÛÁ®ÀÖ´Â Áö¸¦ ³ªÅ¸³½´Ù. 
## - ¹üÀ§(range): max - min 
## - ÆíÂ÷(deviation): observation - mean <- ÆíÂ÷ÀÇ ÇÕÀº 0

h <- c(168, 174, 171, 165, 177)
max(h) - min(h)
mean(h)
h-mean(h)
sum(h-mean(h))

# ºĞ»ê(variance)
## - °³º° ÀÚ·áµéÀÌ Æò±Õ¿¡ ´ëÇØ ¾ó¸¶¸¸Å­ ¶³¾îÁúÁö ±â´ëÇÏ´Â °ª(±â´ë°ª <- Æò±Õ)
### ¸ğÆò±Õ <- nÀ¸·Î ³ª´® // Ç¥º»Æò±Õ <- ÀÚÀ¯µµ(n-1)·Î ³ª´®

# ¸ğºĞ»ê
### N: ¸ğÁı´ÜÀÇ Å©±â // n: Ç¥º»Áı´ÜÀÇ Å©±â <- length()
sum((h - mean(h))^2) / length(h)

# Ç¥º»ºĞ»ê
sum((h - mean(h))^2) / (length(h) - 1)
var(h) ### Ç¥º»ºĞ»êÀÇ °ªÀ¸·Î ³ª¿È! (Degree of Freedom »ç¿ë)

# Ç¥ÁØÆíÂ÷
sqrt(sum((h - mean(h))^2) / (length(h) - 1))
sd(h)

## mean ¡¾ sd
### 171 ¡¾ 4.74 (Æò±Õ 171 ±âÁØÀ¸·Î ºÎÅÍ 4.74 ¸¸Å­ ¶³¾îÁ® ÀÖ´Ù.)
### µ¥ÀÌÅÍ°¡ 171À» ±âÁØÀ¸·Î, ¾Æ¹«¸® Ä¿µµ 4.74¸¦ ³ÑÁö ¸ø ÇÏ°í, ¾Æ¹«¸® ÀÛ¾Æµµ 4.74¸¦ »« °ªÀÇ ¹Ì¸¸ÀÌ ¾Æ´Ï´Ù. 
### ex. ¿ÀÂ÷ ¹üÀ§





##################################################################################################
##################################################################################################
##################################################################################################





# 08/30/2018

# Ç¥ÁØÈ­
## ºñ±³ÇØ¾ß ÇÒ µ¥ÀÌÅÍÀÇ ±âÁØÀÌ ¼­·Î ´Ù¸£¹Ç·Î °°Àº ±âÁØÀ» ¸¸µé¾î¼­ ºñ±³

## Ç¥ÁØ°ª = (°üÃø°ª - Æò±Õ) / Ç¥ÁØÆíÂ÷

# Ç¥ÁØÁ¡¼ö(tÁ¡¼ö)
## Ç¥ÁØ°ª * Ç¥ÁØÆíÂ÷ + Æò±Õ 



# È®·ü(probability)
## ¸ğÁı´Ü ÀüÃ¼¸¦ ºĞ¼®ÇÏ´Â °Ô ¾Æ´Ï¶ó ¸ğÁı´ÜÀ¸·Î ºÎÅÍ ÃßÃâÇÑ Ç¥º»ÀÇ ÀÚ·á¸¦ ºĞ¼®ÇÏ±â ¶§¹®¿¡ ¸ğ¼ö¸¦ ÃßÁ¤ÇÏ°í °¡¼³À» °ËÁ¤ÇÏ±â ¶§¹®¿¡ È®·üÀÌ Áß¿äÇÏ´Ù. 
### ÀüÃ¼ µ¥ÀÌÅÍ¸¦ ´Ù È®ÀÎÇÒ ¼ö ¾ø±â ¶§¹®¿¡, Ç¥º»À¸·Î ÃßÁ¤
### ex. ¾î¶² °øÀå¿¡¼­ ºÒ·®Ç°ÀÌ ¾î´À Á¤µµ ³ª¿Ô´ÂÁö È®ÀÎ <- »çÀü È®·ü(ÀÌ¸¦ ÅëÇØ ÀÌÈÄÀÇ ºÒ·®Ç° Á¦Á¶¸¦ ¿¹Ãø)

# È®·üÀÇ °³³ä
## - °æÇè È¤Àº ½ÇÇè °á°ú·Î Æ¯Á¤ÇÑ »ç°ÇÀÌ³ª °á°ú°¡ ¹ß»ıÇÒ °¡´É¼º
## - ³»ÀÏ ºñ°¡ ¿Ã È®·ü? 
## - ·Î¶Ç°¡ ´çÃ·µÉ È®·üÀº? 
## - ÇÑ±¹ Ãà±¸°¡ ¿ì½ÂÇÒ È®·üÀº? 

## ÁÖ»çÀ§ = {1,2,3,4,5,6} -> 1/6
### ÁÖ»çÀ§ ´øÁö±â(½ÇÇè)
### S(Ç¥º»°ø°£) = {1,2,3,4,5,6} -> 1/6

## ½ÇÇè: ¾î¶² ÇàÀ§ÀÇ °á°ú¸¦ °üÂûÇÏ°í ÃøÁ¤ÇÏ¿© ±× °á°ú¿¡ ´ëÇØ ±¸Ã¼ÀûÀÎ °ªÀ» ºÎ¿©ÇÏ´Â ÇàÀ§ 
## Ç¥º»°ø°£: ½ÇÇè °á°ú·Î ¹ß»ıÇÒ ¼ö ÀÖ´Â ¸ğµç °¡´ÉÇÑ °á°úÀÇ ÁıÇÕ 
## Ç¥º»Á¡: ÇÑ¹øÀÇ ½ÇÇè°á°ú 1

# ÁÖ°üÀûÀÎ È®·ü
## - ³»ÀÏ ºñ°¡ ¿Ã È®·üÀº ¾î´À Á¤µµÀÏ±î?
## - È«±æµ¿ÀÌ ³»ÀÏ Áö°¢ÇÒ È®·ü?

# °´°üÀûÀÎ È®·ü
# °íÀüÀû È®·ü
## - ÁÖ»çÀ§¸¦ ´øÁ³À» ¶§ ¹«Á¶°Ç 1/6
## - ¿¹ÀüºÎÅÍ ¾Ë·ÁÁ® ÀÖ´Â È®·ü
# »ó´ëµµ¼ö È®·ü
## - °°Àº ½ÇÇèÀ» ¼ö¾øÀÌ ¸¹ÀÌ ¹İº¹ÇßÀ» ¶§ Æ¯Á¤ »ç°ÇÀÌ ¹ß»ıÇÒ ¼ö ÀÖ´Â »ó´ëÀû °¡´É¼º
## - µ¿ÀüÀ» ´øÁö´Â ½ÇÇèÀ» ¹İº¹ÀûÀ¸·Î ¹«¼öÈ÷ ½ÇÇàÇÒ °æ¿ì ¾Õ¸éÀÌ ³ª¿Ã È®·ü 1/2

# È®·üÀÇ Á¾·ù
## 1. ÇÑ°èÈ®·ü(marginal probability), ÁÖº¯È®·ü <- "»ó´ëµµ¼ö"ÀÇ °³³ä!!  
### - ¾Æ¹«·± Á¶°ÇÀÌ ¾ø´Â »óÅÂ¿¡¼­ A¶ó´Â »ç°ÇÀÌ ¹ß»ıÇÒ È®·ü
### - P(A)
### - Çà°ú ¿­ÀÇ ÇÕÀ» ºóµµ ÀüÃ¼ ÇÕÀ¸·Î ³ª´©¸é ÇÑ°èÈ®·üÀ» ±¸ÇÒ ¼ö ÀÖ´Ù. 
### - 10¸í Áß¿¡ ÇÑ ¸íÀ» »Ì¾ÒÀ» ¶§ ³²ÀÚÀÏ È®·ü? 4/10 <- ÀÌ°Ô ÇÑ°è È®·ü
### - 10¸í Áß¿¡ ÇÑ ¸íÀ» »Ì¾ÒÀ» ¶§ ºÒ¸¸Á·ÀÏ È®·ü? 3/10
'''
          ¸¸Á·      º¸Åë      ºÒ¸¸Á·      ÇàÀÇÇÕ      ÇÑ°èÈ®·ü
³²¼º      2         1         1           4           4/10
¿©¼º      0         4         2           6           6/10
¿­ÀÇÇÕ    2         5         3           10          10/10
ÇÑ°èÈ®·ü  2/10      5/10      3/10        10/10
'''

## 2. °áÇÕÈ®·ü(joint probability) <- For Bayesian! 
### - 2°³ ÀÌ»óÀÇ »ç°ÇÀÌ µ¿½Ã¿¡ ¹ß»ıÇÒ °¡´É¼ºÀ» ³ªÅ¸³»´Â È®·ü 
### - »ç°Ç A¿Í »ç°Ç B°¡ µ¿½Ã¿¡ ¹ß»ıÇÒ È®·ü
### - P(A¡ûB)
### - 10¸í Áß¿¡¼­ ³²¼ºÀÌ¸é¼­ ¸¸Á·ÇÒ È®·ü?
### - 10¸í Áß¿¡¼­ ¿©¼ºÀÌ¸é¼­ ºÒ¸¸Á·ÇÒ È®·ü?
'''
          ¸¸Á·  º¸Åë ºÒ¸¸Á· ÇàÀÇÇÕ ÇÑ°èÈ®·ü
³²        0.2  0.1    0.1    0.4      0.4
¿©        0.0  0.4    0.2    0.6      0.6
¿­ÀÇÇÕ    0.2  0.5    0.3     10      1.0
ÇÑ°èÈ®·ü  0.2  0.5    0.3      1      0.1
'''

## 3. Á¶°ÇºÎÈ®·ü(conditional probability)
### - ÀÌ¹Ì ÇÏ³ªÀÇ »ç°ÇÀÌ ¹ß»ıÇÑ »óÅÂ¿¡¼­ ¶Ç ´Ù¸¥ »ç°ÇÀÌ ¹ß»ıÇÒ °¡´É¼ºÀ» ³ªÅ¸³»´Â È®·ü
### - ³²¼ºÀÌ¶ó´Â ÀüÁ¦ Á¶°Ç ÇÏ¿¡¼­ ¸¸Á·ÇÒ È®·ü? 
'''
            P(A¡ûB)
P(A|B) = -------------
             P(B)
'''

0.2/0.4 ### P(¸¸Á·|³²¼º)

'''
            P(A¡ûB)
P(A|B) = -------------
             P(B)

P(A¡ûB) = P(A|B) * P(B)
       = P(B|A) * P(A) <- ±³È¯¹ıÄ¢! 

P(B¡ûA) = P(B|A) * P(A)



È®·üÀÇ µ¡¼À ¹ıÄ¢
P(AUB) = P(A) + P(B) - P(A¡ûB)

S = {1,2,3,4,5,6}

ÁıÇÕ
A = {1,2,3}
B = {2,3,4}

n(AUB) = 3 + 3 - 2 = 4

È®·ü
P(AUB) = 3/6 + 3/6 - 2/6 = 4/6



¹è¹İ»ç°Ç(Mutually Independent)
»ç°Ç A¿Í »ç°Ç B°¡ ¼­·Î ¹è¹İÀûÀÏ °æ¿ìÀÇ µ¡¼À¹ıÄ¢ <- ±³ÁıÇÕ = 0

ÁıÇÕ
A = {1,2,3}
B = {4,5,6}

n(AUB) = 3 + 3 - 0 = 6

È®·ü
P(AUB) = 3/6 + 3/6 - 0/6 = 6/6



È®·üÀÇ °ö¼À ¹ıÄ¢
- È®·üÀÇ °ö¼À ¹ıÄ¢Àº Á¶°ÇºÎ È®·üÀ» ÀÌ¿ëÇÏ¿© ¼³¸íÇÑ´Ù. 
- Á¶°ÇºÎÈ®·üÀº ÇÏ³ªÀÇ »ç°ÇÀÌ ¹ß»ıÇÑ »óÅÂ¿¡¼­ ¶Ç ´Ù¸¥ »ç°ÇÀÌ ¹ß»ıÇÒ °¡´É¼ºÀ» ³ªÅ¸³»´Â È®·ü <- µ¿½Ã¿¡ µÎ »ç°ÇÀÌ ¹ß»ı 

»ç°Ç A°¡ ¹ß»ıÇÑ Á¶°Ç ÇÏ¿¡¼­ »ç°Ç B°¡ ¹ß»ıÇÒ Á¶°ÇºÎ È®·ü
            P(A¡ûB)
P(B|A) = -------------
             P(A)



            »ç°ú      µş±â      ÇàÀÇÇÕ      ÇÑ°èÈ®·ü
³²          4         3
¿©          2         1
¿­ÀÇÇÕ
ÇÑ°èÈ®·ü
'''

# Á¶ÇÕ(combination)
## ¼­·Î ´Ù¸¥ n°³ÀÇ °³Ã¼¿¡¼­ k¸¦ ¼±ÅÃÇÏ´Â °æ¿ìÀÇ ¼ö
'''
            n!
nCk = -------------
        k! (n-k)!
'''

# ¼ø¿­(permutation)
## Á¶ÇÕ + ¼ø¼­
'''
          n!
nPk = ---------
        (n-k)!
'''





##################################################################################################
##################################################################################################
##################################################################################################





# 08/31/2018

install.packages("BayesianTools")
library(BayesianTools)

# º£ÀÌÁö¾È ÀÌ·Ğ
## »çÀü È®·üÀ» ¹ÙÅÁÀ¸·Î »çÈÄ È®·üÀ» ¿¹Ãø! 
## - ÁÖ¾îÁø »çÀüÈ®·ü Á¤º¸¸¦ ÀÌ¿ëÇÏ¿© »çÈÄÈ®·üÀ» ¿¹ÃøÇÏ´Â ÀÌ·Ğ
## - »ç°ÇÀÌ ¹ß»ıÇÏ°í ³­ ÈÄ »ç°Ç ¹ß»ıÀÇ ¿øÀÎ¿¡ ´ëÇÑ »çÈÄ È®·üÀ» »ç°Ç ¹ß»ı °Ç¿¡ ÀÌ¹Ì ¾Ë°í ÀÖ´Â »çÀü È®·ü(Á¤º¸)À» ÀÌ¿ëÇÏ¿© ±¸ÇÏ´Â ÀÌ·ĞÀÌ´Ù. 
## ex. ±â»ó ¿¹º¸, ½ºÆÔ ¸ŞÀÏ ¹æÁö, ÃßÃµ ¿µÈ­ 
'''
»çÀü È®·ü <- ÀÌ¸¦ ¹ÙÅÁÀ¸·Î »çÈÄ È®·ü ¿¹Ãø
            »ı»êºñÀ²      »ı»êÈ®·ü            ºÒ·®È®·ü
A °øÀå      30%           p(A) = .3           P(ºÒ·®|A) = .1
B °øÀå      50%           p(B) = .5           P(ºÒ·®|B) = .05
C °øÀå      20%           p(C) = .2           P(ºÒ·®|C) = .04



»çÈÄ È®·ü <- ÀÌ ºÒ·®Ç°Àº ¾î´À °øÀå¿¡¼­ ³ª¿Â ºÒ·®Ç°ÀÎÁö ÃßÁ¤ÇØºÁ¾ß!(»çÀü È®·ü ÀÌ¿ë)
P(A|ºÒ·®)
P(B|ºÒ·®)
P(C|ºÒ·®)
                               P(A)*P(ºÒ·®|A)
P(A|ºÒ·®) = ---------------------------------------------------
              p(A)*P(ºÒ·®|A) + p(B)*P(ºÒ·®|B) + p(C)*P(ºÒ·®|C)

P(A|ºÒ·®) = P(A¡ûºÒ·®)/P(ºÒ·®) = P(A)*P(ºÒ·®|A)/P(ºÒ·®) = P(A)*P(ºÒ·®|A)/(p(A)*P(ºÒ·®|A)+p(B)*P(ºÒ·®|B)+p(C)*P(ºÒ·®|C)) 
          = .3*.1/(.3*.1+.5*.05+.2*.04) = .48

P(B|ºÒ·®) = P(B¡ûºÒ·®)/P(ºÒ·®) = P(B)*P(ºÒ·®|B)/P(ºÒ·®) = P(B)*P(ºÒ·®|B)/(p(A)*P(ºÒ·®|A)+p(B)*P(ºÒ·®|B)+p(C)*P(ºÒ·®|C)) 
          = .5*.05/(.3*.1+.5*.05+.2*.04) = .40
P(C|ºÒ·®) = P(C¡ûºÒ·®)/P(ºÒ·®) = P(C)*P(ºÒ·®|C)/P(ºÒ·®) = P(C)*P(ºÒ·®|C)/(p(A)*P(ºÒ·®|A)+p(B)*P(ºÒ·®|B)+p(C)*P(ºÒ·®|C)) 
          = .2*.04/(.3*.1+.5*.05+.2*.04) = .13

=> A °øÀå¿¡¼­ ºÒ·®Ç°ÀÌ ³ª¿ÔÀ» È®·üÀÌ ³ô´Ù°í ÃßÁ¤! 
'''



# Naive Bayes ¸Ş¼Òµå 
install.packages("e1071")
library(e1071)

movie <- read.csv("C://data/movie.csv", header = T)
head(movie)
str(movie)

## knn()Àº ¸ğµ¨À» ¸¸µé ¼ö ¾øÀ½ -> ¸Å¹ø ºĞ·ùÇØ¾ß ÇÔ! 
## e1071Àº ¸ğµ¨À» ¸¸µé¾î¼­ ÃßÃø, ¿¹ÃøÇÏ´Â °ÍÀÌ °¡´É!! 

## 1. naiveBayes(»çÀüÈ®·ü(ºĞ¸ğ), )
### laplace=0 ÃßÁ¤±â <- È®·ü°ªÀÌ 0ÀÌ µÇ´Â °ÍÀ» ¹æÁö 
### ¸Ş¼Òµå°¡ ¾Ë¾Æ¼­ ºĞ·ùÇØÁÜ! 
model <- naiveBayes(movie[1:5], movie$Àå¸£, laplace=0) 
model

## 2. predict() <- Àß ºĞ·ùµÇ¾ú´Â Áö È®ÀÎ
result <- predict(model, movie[1:5])
result
