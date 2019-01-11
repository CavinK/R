# Ch.2 기술 통계 
length(trees$Volume) # trees의 표본 수 

attach(trees) # 매번 trees$ 입력하지 않기 위해
mean(Volume)
var(Volume)

var(Volume)*(length(Volume)-1)/length(Volume) # 표본분산 

sd(Volume)
sqrt(var(Volume)) # 위 sd()와 동일

# 표준오차(Standard Error) <- 추정치의 표준편차
sd(Volume)/sqrt(length(Volume))

# 변동계수(Coefficient of Variation)
sd(Volume)/mean(Volume) ## 평균이 증가하면 분산도 같이 증가 => 변동계수로 보정

# 사분위수(Quartiles)
quantile(Volume) # minimum, Q1, median, Q3, maximum
fivenum(Volume) # 위와 동일
IQR(Volume) # interquartile range(Q3 - Q1)

1:31
fivenum(1:31) # 사분위수 계산(자료를 sort한 다음, 해당되는 위치에 있는 값 골라서 구함)
sort(Volume)

# Boxplot <- 사분위수를 효율적으로 표현 
boxplot(Volume, col="red") # default: black
colors() ## 어떤 컬러를 선택할 수 있는 지 확인(총 657개)

# Outlier의 결정이 되는 기준 
fivenum(Volume)[2]-1.5*IQR(Volume)
fivenum(Volume)[2]+1.5*IQR(Volume)

# 히스토그램 
hist(Volume, probability = TRUE) # "probability = TRUE" 빠지면 도수로 표현 => 아래의 분포선과 일치하지 않게 됨 
lines(density(Volume), col="blue") # 확률로 표현된, 추정된 분포선 

# 줄기-잎 그림(Stem-and-Leaf plot)
stem(Volume) # | 왼쪽: 첫번째 자리수, 오른쪽: 두번째 자리수

# Q-Q Normality plot <- Volume이 정규분포에 얼마나 근접한지 표현
## 직선: 정확한 정규분포 수식에서 나오는 값
## 점들이 직선에서 크게 벗어나지 않으면 Volume이 정규분포를 따른다고 해석
qqnorm(Volume)
qqline(Volume, col = "blue")

## Volume과 같은 수인 31개의 random number를 정규분포로부터 발생시킨 수, 위의 결과와 비교
rnorm(n=31,mean=0,sd=1)
x <- rnorm(31)
qqnorm(x)
qqline(x)

# 표준오차 함수
se = function(x) sd(x)/sqrt(length(x))
se(trees$Volume)

# 변동계수 함수
cv = function(x) sd(x)/mean(x)
cv(trees$Volume)





# Ch.3 
## H0: 버리고 싶은 거 // H1: 얻고 싶은 거
## a: support H1 // p-value: support H0 





# Ch.4 One-Sample T-Test
## 한 모집단의 평균이 어떤 특정한 값과 같은지 검증
## 자료가 "정규분포"를 따른다고 가정 cf. Wilcoxon signed-rank test

x <- c(15.5, 11.21, 12.67, 8.87, 12.15, 9.88, 2.06, 14.5, 0, 4.97) # Vector(not data.frame)

# T-Distribution
## z vs. t <- (xbar - mu)/(delta/rootN) 
## 표본평균(X bar)과 모평균(m)의 차이 파악!

## t = sqrt(length(x))*(mean(x)-8.1)/sd(x) <- mu0 = 8.1(mean(x)와 비교해야 할 값!)
## p-value = 2*(1-pt(t값,DegreeofFreedom))

# 정규성 검정
shapiro.test(x)
### p > a(0.05) => DNR H0(Normally Distributed)
### Otherwise, use nonparametric method!(See Ch.6)

# t-test
## t.test(변수명, mu = mu0)
## t.test(변수명, mu = mu0, alter = 'two.sided')
t.test(x, mu=8.1) # mu=8.1 <- 특정값(비교해야될 값)
### If p>a, DNR H0 => Statistically Insignificant

# One-tailed
t.test(x, mu=8.1, alternative = "greater")
### half of p-value!

# 통계값 추출 
out = t.test(x, mu=8.1)
names(out) # 어떤 결과물들이 out에 저장되어 있는 지 확인!
out$statistic # t-value & p-value 확인 가능
out$p.value

t.test(x, mu=8.1)[c('statistic','p.value')] # t-value & p-value 확인 가능

# Simulation
rnorm(n=length(x), mean=mean(x), sd=sd(x)) # 위의 x와 같은 관찰 수(length(x)), 평균, 표준편차를 갖는 데이터 
P = NULL
for(i in 1:10000){
  P[i] <- shapiro.test(rnorm(n=length(x), mean=mean(x), sd=sd(x)))$p.value
}
P<0.05
mean(P<0.05) # p-value가 a(0.05)보다 작아 H0이 기각되는 비율 => a에 근접!!!





# Ch.5 Paired T-Test
## t.test(사후열 - 사전열)
## 한 집단을 대상으로 어떤 개입(intervention)의 효과를 보기 위해 개입 전-후값을 비교(Before/After) => effect of treatment
## 사후열과 사전열의 차이의 평균이 0인지 검정 => H0: mu = 0

# Case 1
## with(데이터, shapiro.test(사후-사전))
FT = read.csv("C://data/FT.csv")
with(FT, shapiro.test(Postwt-Prewt)) # p-value와 a를 비교하여 정규분포를 따르는 지 체크

## t.test(사후-사전)
## with(데이터, t.test(사후-사전))
with(FT, t.test(Postwt-Prewt))
### p<a => Reject H0 => Statistically Significant
t.test(FT$Postwt-FT$Prewt) # 위와 동일한 결과 

# Case 2
anorexia = read.csv("C://data/anorexia.csv") ; anorexia
anorexia[c(1,3),] # 첫번째 관찰치와 세번째 관찰치(첫번째 row와 세번째 row)
anorexia[,c(1,2)] # 첫번째 변수와 두번째 변수
anorexia[c(1,3),c(1,2)]

anorexia$Treat == "FT"
anorexia[anorexia$Treat == "FT",] # anorexia$Treat == "FT"가 TRUE인 관찰치만 선택
anorexia$Treat %in% c("Cont","FT")
anorexia$Treat != "CBT" ### 바로 위와 같은 결과

## 위의 작업을 바탕으로 Subset 분석
with(FT, t.test(Postwt-Prewt))
with(anorexia[anorexia$Treat=="FT",], t.test(Postwt-Prewt)) # 전체 데이터프레임인 anorexia에서 해당 row들만 제한, 추출해서 t-test 실행 

# Simulation
## Paired t-test => 두 변수 간에 "상관관계"가 존재 => multivariate normal 분포!
library(MASS)
## mvrnorm(n = 표본수, mu = c(각각의 평균), Sigma = 공분산행렬)
matrix(c(10,6,6,10),ncol=2) ### 공분산행렬 
x <- mvrnorm(n=10, mu=c(94,93), Sigma = matrix(c(10,6,6,10),ncol=2)) ; x # 첫번째 컬럼(x[,1])과 두번째 컬럼(x[,2])을 대상으로 paired t-test 실행
t.test(x[,2]-x[,1])





# Ch.6 Wilcoxon Signed-Rank Test
## non-parametric method of one-sample test and paired t-test
## shapiro.test에서 H0(정규분포 따름)을 reject할 경우
## 분포에 대한 가정 없이 데이터의 순서에만 의존 

# Wilcoxon signed-rank test
## 자료의 순서를 사용하여 자료의 median이 0인지 검정 <- 양수인 데이터의 수와 음수인 데이터의 수가 같다면 median = 0

## with(데이터, wilcox.test(사후열-사전열))
CBT = read.csv("C://data/CBT.csv")
with(CBT, wilcox.test(Postwt-Prewt))
### Warning message <- 동일 값 존재 => 자료의 순서를 정하는 데에 문제가 생김! 
with(CBT, wilcox.test(Postwt-Prewt), exact = FALSE) # exact test를 시도하지 않게 해서 정규분포에 근사 => Warning 없앰

## 하나의 값이 비정상적으로 바뀔 경우
### 1. t-test: p-value 변화(데이터값 증가 => 표준편차 증가 => p-value 증가)
### 2. wilcox.test: p-value 변화 안 함 <- better! 





# Ch.7 Two-Sample T-Test
## 서로 독립적인 두 집단의 평균 차이가 0인지를 검정 <- 두 집단에 서로 다른 intervention을 적용 
## cf. Paired test: 하나의 집단에만 treatment => before/after 비교

# two-sample t-test의 순서 
## 1. 두 집단의 분산이 같은지 검정 -> H0: var1 = var2
## 2-1. 분산이 다르면(Reject H0) Welch의 t.test() 적용 -> H0: mu1 = mu2
## 2-2. 분산이 같으면(DNR H0) pooled variance를 이용한 t-test(var.equal = TRUE) 

dental = read.csv("C://data/dental.csv") ; dental
### 생물학 실험에서 박테리아를 배양하면 박테리아는 지수적 증가 => 비대칭 데이터 => log 변환해야 정규분포를 따름! 

# Boxplot
## 두 그룹의 분포 차이 확인
boxplot(resp ~ treatment, data=dental, col='red')
boxplot(log(resp) ~ treatment, data=dental, col='red') # 두 집단의 분산 차이가 많이 좁혀짐! 

# 등분산 검정(Variance Equality Test)
## var.test로 두 집단의 분산이 같은지 검정
## var.test(log(y) ~ 그룹변수, data = 데이터명)
## log 변환 안 하면 결과값이 아예 다르게 나올 수가 있음!!! 
var.test(log(resp) ~ treatment, data = dental)
### p>a => DNR H0 => pooled variance 이용! 

# 분산이 같은 경우(DNR H0) => pooled variance 이용
## t.test(log(y) ~ treatment, var.equal = TRUE, data = 데이터명)
t.test(log(resp) ~ treatment, var.equal = TRUE, data = dental)
### p<a => Reject H0 => mu1 != mu2

# 분산이 다른 경우(Reject H0) => Welch의 t-test
## t.test(y ~ 그룹변수)
t.test(resp ~ treatment, data = dental)
### p>a => effect of treatment is statistically insignificant

# 정규성 검정
## 각 그룹의 평균을 빼준 잔차를 shapiro.test()에 넣어줌!(잔차분석) => resid() 이용!
out = lm(log(resp) ~ treatment, data = dental)
shapiro.test(resid(out))

# Basically, Paired T-Test is better than Two Sample T-Test.
# However, paired T-Test is subject to "time difference" and it's difficult to fully erase the effect of the 1st treatment.

# Simulation
## 표본 수 증가 => p-value 감소(more likely to reject H0)

## rlnorm(n = 표본수, meanlog = "log(x)의 평균", sdlog("log(x)의 표준편차")
rlnorm(n=10, meanlog = 2.5, sdlog=0.5) # 평균 2.5, 표준편차 0.5인 log-normal 분포를 따르는 값 10개 시뮬레이션 
exp(rnorm(n=10,mean=2.5,sd=0.5)) # exp으로 변환

## 정규성 검정
P <- NULL
set.seed(1234)
for(i in 1:10000){
  P[i] <- shapiro.test(rlnorm(10,2.5,0.5))$p.value
}
mean(P<0.05) ### prob to reject H0(p<a) => 정규성 가정이 기각될 확률이 24%, 통과할 확률이 75%

x = rlnorm(n=10, meanlog=2.5, sdlog=0.5)
qqnorm(x)
qqline(x)

for(i in 1:10000) {
  P[i] <- shapiro.test(rlnorm(20,2.5,0.5))$p.value
}
mean(P<0.05) ### 표본 수(n) 증가 => 기각율 증가! 

# two-sample t-test에서도 wilcox.test 사용 가능! (from Ch.8)





# Ch.9 상관분석(Correlation Analysis)

# 공분산(Covariance): 두 변수가 같은 방향으로 움직이는지 <- 측정된 값의 단위(scale)에 영향! 
# 피어슨의 상관계수(correlation coefficient): 공분산을 두 변수의 표준편차로 나누어 (-1,1) 사이의 값을 갖도록 조정 
## -> 두 변수의 "직선관계" 정도를 측정! 
## cf. 비모수방법: Kendall, Spearman <- 측정값 크기 무시하고 "순위"만을 이용 => 직선관계가 아니어도 완벽한 상관관계가 있으면 1의 값 가짐 

# cor(x,y) -> Pearson 
# cor(x,y, method='kendall') -> Kendall
# cor(x,y, method='spearman') -> Spearman 

x <- 1:10
y <- x^2
cor(x,y)
cor(x,y, method='kendall')
cor(x,y, method='spearman')

cov(attitude) ### 공분산행렬(모든 변수의 쌍에 대한 공분산) <- 대각선은 분산! 
cor(attitude) ### 상관계수행렬 <- 대각선은 1 
with(attitude, cor(rating, complaints))

cor(x,y, use="pairwise.complete.obs") # 결측치로 인해 NA값이 나오는 거 방지 

with(attitude, cor.test(rating, complaints)) ### p-value 확인! 
with(attitude, cor.test(rating, complaints, method='kendall'))
with(attitude, cor.test(rating, complaints, method='kendall', exact=FALSE)) # Warning Message 제거 

# Simulation 
library(MASS)
mvrnorm(n=nrow(attitude), mu=colMeans(attitude), Sigma = cov(attitude)) 
### 평균과 공분산행렬 이용해서 multivaiate normal 분포로부터 같은 수의 데이터를 시뮬레이션 





# Ch.10 단순회귀분석(Simple Linear Regression) 

# y변수와 x변수의 관계를 "직선"으로 표현 
# b0, b1 <- least-squares estimation of residuals(yi-yhat)
cars <- read.csv("C://data/cars.csv")
cars

out <- lm(dist ~ speed, data=cars)
out
summary(out) # p<a => reject H0 

# R2(결정계수, coefficient of determination): 모형의 설명력을 평가 
## 다중회귀분석에서는 설명력 없는 독립변수를 추가시켜도 R2가 커짐 => adjusted R2에서 독립변수의 수를 벌칙으로 적용하여 보정 

# F값: 모형의 적합성을 나타냄 

# 단순회귀분석에서만 성립 
## 1. cor()로 구한 Pearson 상관계수를 제곱하면 R2와 동일 
with(cars, cor(speed,dist))^2
## 2. cor.test()로 구한 Pearson 상관계수의 t값, p값은 위 회귀분석의 t값, p값과 일치 
with(cars, cor.test(speed,dist))
## 3. 단순회귀분석의 t값의 제곱은 F값과 일치 <- 단순회귀모형에서 변수의 유의성은 모형 자체의 유의성과 동일 
plot(dist ~ speed, data=cars, col='blue')
abline(out, col='red')

# No intercept Model 
## ex. 차의 속도(speed)가 0일 때는 차가 정지 상태이므로 distance도 0 -> y-절편 필요 없음 
## "-1"로 모형에서 y-절편 제거 
summary(lm(dist ~ speed-1, data=cars))

# log변환 & sqrt변환 -> 분산 일정화(linearisation) 
## speed가 증가하면서 distance의 퍼진 정도도 증가 
## log변환보다 sqrt변환이 선형에 가깝고 분산도 많이 평평해졌음 
plot(log(dist) ~ speed, data=cars)
plot(sqrt(dist) ~ speed, data=cars)

out2 <- lm(sqrt(dist) ~ speed-1, data=cars)
summary(out2)

# 회귀진단
## residuals <- 1. 정규분포 2. 분산 일정 3. 특별한 추세를 보이지 말아야 함!(잔차에 추세가 보인다는 건, 모형에 포함되어야 할 정보가 빠졌다는 증거)
par(mfrow = c(2,2))
plot(out2)

## resid(): 회귀분석 결과물로부터 잔차를 얻을 수 있음 
qqnorm(resid(out2)) # Normal Q-Q plot 
qqline(resid(out2))

## shapiro.test(): 잔차가 정규분포를 따르는지 검정
shapiro.test(resid(out2)) # p>a => normally distributed! 



# 0. plot 
par(mfrow=c(1,1))
one_comp <- read.csv("C://data/one_comp.csv")
plot(conc ~ time, data=one_comp) # nonlinear! <- one-compartment model(Ct = C0*e^(-K*t)) <- Ch.20 

# 1. log-linearisation 
plot(log(conc) ~ time, data=one_comp)
plot(conc ~ time, data=one_comp, log='y') # y axis에 log 변환되기 전의 값들을 표현 

# 2. model fitting/regression 
summary(lm(log(conc) ~ time, data=one_comp))
## cf. without linearisation 
out <- lm(conc ~ time, data=one_comp)
par(mfrow=c(2,2))
plot(out) # can't figure out the certain trend! 

# 3. simulation 
## rnorm(n=표본수, mean=yhat, sd=RSE)
out <- lm(log(conc) ~ time, data=one_comp)
conc=exp(rnorm(n=nrow(one_comp), mean=fitted(out), sd=summary(out)$sigma)) # ln(Ct)를 시뮬레이션하고, exp로 변환 
plot(conc ~ one_comp$time)



# extract statistical values 
out <- lm(dist ~ speed, data=cars)
names(out) # 결과물 out에서 어떤 값들을 얻을 수 있는지 확인 
out$rank
out$df.residual

coef(out) # 회귀계수 
out$coefficients
out$coef # same! 

fitted(out) # Predicted Value(yhat)
yhat <- coef(out)[1] + coef(out)[2]*cars$speed # yhat = B0+B1*x
yhat # same! 

resid(out) # residuals(y - yhat)
cars$dist - yhat # same! 

summary(out)$sigma # residual standard error

# Simulation 
## rnorm(n=표본수, mean=yhat, sd=RSE)
out <- lm(sqrt(dist) ~ speed-1, data=cars)
dist <- rnorm(n=nrow(cars), mean=fitted(out), sd=summary(out)$sigma)^2
plot(dist ~ cars$speed)





# Ch.11 다중회귀분석(Multiple Regression) 
## 독립변수가 2개 이상
## confirmatory analysis: 모형 선택이 적용하고자 하는 이론에 근거를 둔 경우 
## exploratory analysis: 적용할 이론을 사전에 정해놓지 않고 가능한 여러 모형을 고려한 후 가장 적절한 모형을 고르는 분석 
### <- 모형의 설명력은 높지만, 그 모형을 다른 데이터에 적용하여 일반화시켰을 때 잘 맞으리라는 보장이 없음(overfitting)

# Exploratory Analysis
## 모형선택 <- 꼭 필요한 독립변수만 모형에 집어넣음 
## 1. 종속변수와 상관관계가 높아야 한다 
## 2. 선택된 독립변수들 간에는 상관관계가 낮아야 한다(중복된 정보 => 변수 낭비!) <- multicollinearity 
## 3. 소수정예의 원칙을 따른다 

## a. all possible regressions
## b. forward selection: 가장 유의한 변수부터 덜 유의한 변수 순으로 하나씩 추가 <- 중요 변수라도 기존 변수들과 상관관계가 높으면 아예 최종 모형에 채택되지 않을 수도 있음 
## c. backward elimination: 모든 변수를 넣고 가장 기여도가 낮은 변수부터 하나씩 제거 <- recommended! 
## d. stepwise selection: 위 둘을 조합 

# pairs(): 모든 변수의 쌍 
pairs(attitude)

# Backward Elimination 
## 1. 종속변수(rating) 제외 다른 모든 변수들을 독립변수로 집어넣고(~.) 회귀분석 실행 
out <- lm(rating ~ ., data=attitude)
## 2. anova(단수): 분산분석표 출력 => p-value가 큰 변수들 제거! 
anova(out)
## 3. p-value가 큰 변수들 제거 => 다시 회귀분석 
out2 <- lm(rating ~ complaints+learning+advance, data=attitude)
## 4. anova(복수): F-test <- 두 모형의 설명력 비교(제거된 변수들의 기여도 평가!) 
anova(out2,out) # p>a => 제거된 변수들의 기여도가 거의 없음
out3 <- lm(rating ~ complaints+learning, data=attitude) # 추가적으로 변수 제거
anova(out3,out2,out) # 추가적으로 제거된 변수도 기여도가 크지 않음 => 제거 가능! 
## 5. summary(): R2 <- 모형의 설명력! 
summary(out3) # 0.708 <- 모형이 종속변수 rating을 70.8% 설명 
## cf. Adjusted-R2
### 독립변수의 수가 많을 수록 R2가 커짐 => 모형선택의 기준으로 문제가 있음 
summary(out) # R2=0.7326 // Adj-R2=0.6628 <- R2 highest 
summary(out2) # R2=0.7256 // Adj-R2=0.6939 <- Adj-R2 highest 
summary(out3) # R2=0.708 // Adj-R2=0.6864 <- F-test로 선택됨! 

# Multiple Regression with discrete variables 
library(MASS)
out <- lm(bwt ~ age+lwt+factor(race)+smoke+ptl+ht+ui, data=birthwt) # race(1:white,2:black,3:other) <- factor()를 이용해 이산형 처리! 
anova(out)
out2 <- lm(bwt ~ lwt+factor(race)+smoke+ht+ui, data=birthwt)
anova(out2,out) # F-test => p>a => 변수 제거 가능! 
anova(out2) # all independent variables are statistically significant! 
summary(out2) # R2=0.2404 <- 실제 연구에서는 결코 작은 게 아님! 

# 다항회귀모형(Polynomial Regression)
## 종속변수와 독립변수가 2차식 관계! 
## y = b0 + b1*x + b2*x^2 <- 독립변수가 하나 더 늘어, 단순회귀분석이 아닌 다중회귀분석의 특수한 경우가 됨 
## lm(y ~ x + I(x^2))
summary(lm(dist ~ speed + I(speed^2), data=cars))
## 일차항이 유의하지 않다고, 일차항만 제거하고 이차항만을 모형에 넣어서는 안 됨! 
with(cars, cor(speed,speed^2)) # 다항회귀모형의 문제점 <- x와 x^2의 상관계수가 높음 

summary(lm(dist ~ I(speed^2) -1, data=cars)) # y = b2*x^2 (y가 정규분포를 따른다고 가정) => R2=0.9044
summary(lm(sqrt(dist) ~ speed-1, data=cars)) # sqrt-linearisation from Ch.10 (sqrt(y)가 정규분포를 따른다고 가정) => R2=0.9689 <- better! 





# Ch.12 일원분산분석(One-way ANOVA)

# 일원분산분석 <- Two-sample t-test의 확장 // "세 그룹" 이상의 평균이 모두 같은지 검정 <- cf. Two-sample t-test: 두 그룹(control vs treatment)
# H0: 모든 그룹의 평균이 같다 => 다중비교(multiple comparisons): 어느 그룹에서 차이가 있는지 파악! 
# 설명변수(group variable)가 연속형(continuous)이 아닌 이산형(discrete)!!! <- ex. group: (ctrl,trt1,trt2)
# 회귀분석과 동일하게 lm()을 사용 

PlantGrowth
tapply(PlantGrowth$weight, PlantGrowth$group, mean)
# H0: 세 그룹 ctrl, trt1, trt2의 weight 평균은 같다. 
# H1: 최소한 한 그룹 평균이 다른 한 그룹 평균과 다르다. (세 쌍의 그룹 중에 차이가 있는 쌍이 최소한 하나는 있다)
## => 다중비교: 이 세 쌍 중 어느 쌍이 차이가 있는지 조사하는 것! 

# 대조군(ctrl): 기존에 있는 방법 그대로 사용, 또는 아무런 처리도 안한 그룹 
# 실험군(trt): 대조군과 비교하고 싶은 새로운 방법이 도입된 그룹 
## 대조군과 각 실험군을 비교하는 게 일반적 <- (ctrl vs trt1), (ctrl vs trt2) 

# a. 그룹 간 변동량(Between-Group Variability)
## 일원분산분석은 비교해야 할 그룹이 세 쌍 이상 => 각 쌍의 평균의 차이를 비교하여 모두 같은지, 한 쌍이라도 차이가 있는지 파악! 
## 모든 쌍의 평균이 모두 같다면, "표본"평균의 차이들의 제곱합도 "작을" 것!(H0)

# b. 그룹 내 변동량(Within-Group Variability)
## 개별의 데이터(yij)를 각 그룹의 평균(yi)으로 뺀 "잔차"들의 제곱합 
## 이를 이용해서 오차의 분산(모분산)을 추정! 

# c. F-test 
## 그룹 간 변동량(BGV)과 그룹 내 변동량(WGV)의 비 
## 각 쌍의 평균 차이(BGV)가 정상적인 표본추출 과정에서 발생할 수 있는 오차(WGV)에 비해 얼마나 큰지 평가 
## small F => H0: 관찰된 평균 간의 차이가 우연히 발생한다고 생각 // big F => H1: 그룹 간에 유의한 차이 

# Reference Coding 
## 일원분산분석 할 때, 컬럼들 중 가장 알파벳 순서가 낮은 컬럼명이 자동적으로 비교 대상(reference)으로 지정됨 
## relevel()을 통해 reference 변경 가능! 

# 일원분산분석 
# 0. 기술통계 
with(PlantGrowth, tapply(weight, group, mean)) # 각 그룹의 평균 
with(PlantGrowth, tapply(weight, group, sd)) # 각 그룹의 표준편차 
boxplot(weight ~ group, col='red', data=PlantGrowth) # Boxplot을 이용하여 각 그룹의 차이 확인 => 정규분포 가정 체크 

# 1. 모형적합 
## lm(y ~ 그룹변수)
out <- lm(weight ~ group, data=PlantGrowth) 
## Intercept = 5.032 <- mean of reference(ctrl) 
## grouptrt1(b0) = -0.371 = 4.661-5.032 <- mean(trt1)-mean(ctrl) <- ctrl와 trt1 비교 
## grouptrt2(b1) = 0.494 = 5.526-5.032 <- mean(trt2)-mean(ctrl) <- ctrl와 trt2 비교 

# 2. 분산분석(ANOVA) 
## anova() 
anova(out) # p<a => reject H0(그룹 평균 간에 차이가 존재!) => 어느 쌍에 차이가 있는지 "다중비교"로 좀 더 조사! 

# cf. 회귀진단(잔차의 추세 및 정규성 검정) 
par(mfrow=c(2,2))
plot(out) # 잔차의 추세가 없음 => no problem! 
shapiro.test(resid(out)) # 잔차의 정규성검정 결과 => p>a => 정규분포 가정 만족!(residuals are normally distributed)
## 일원분산분석(one-way ANOVA)의 비모수 방법(p<a) => Ch.13 Kurskal-Wallis test <- Wilcoxon rank-sum test의 확장! 
## Kurskal-Wallis test: 데이터의 순위에서 구한 집단 간 변동량(WGV)으로 검정통계량을 만듬 
### kurskal.test(y ~ 그룹변수)
kruskal.test(weight ~ group, data=PlantGrowth) # p<a => Statistically Significant!(각 그룹의 median에는 적어도 한 쌍 이상에 차이가 있다)

# 3. 다중비교(Multiple Comparisons)
## reject H0 => 각 쌍의 평균 차이 중에 0이 아닌 쌍이 적어도 하나는 있다는 뜻 
## => 다중비교를 통해 어떤 쌍의 차이로 H0이 기각되었는 지 조사! 
## i) Tukey: 가능한 모든 조합의 쌍을 조사  
## ii) Dunnett: 하나의 대조군(reference)을 나머지 비교군(treatment)들과 비교할 때 사용 
### 비교하는 쌍이 늘어나면 검정 수가 늘어나, 실제로 유의하지 않은데 우연히 유의하게 나올 가능성이 높아짐 
### => 유의수준(a)을 0.05보다 낮추거나, p-value를 높게 조정해야 함
### => Tukey의 p-value가 Dunnett의 그것보다 높게 조정되어 있는 것! 
### => 꼭 관심 있는 쌍만 미리 정해놓고 비교해야 유의한 결과를 얻을 가능성이 높음!(Dunnett) 

# 3-1. Dunnett 
install.packages("multcomp")
library(multcomp)
## glht(lm(), linfct = mcp(그룹변수="Dunnett"))
## glht()의 결과를 변수에 저장 => summary()로 자세한 결과물 출력 => plot()으로 confidence interval 확인  
out <- lm(weight~group, data = PlantGrowth)
dunnett <- glht(out, linfct=mcp(group="Dunnett"))
summary(dunnett) # (ctrl - trt1), (ctrl - trt2) 둘 다 유의하지 않음!(p>a) 
plot(dunnett) # 95% 신뢰구간(confidence interval)이 0 포함 => 유의수준 0.05에서 유의하지 않음 

# 3-2. Tukey
## glht(lm(), linfct = mcp(그룹변수="Tukey"))
tukey <- glht(out, linfct=mcp(group="Tukey"))
summary(tukey) # (trt1 - trt2)에 유의한 차이! <- 위의 Dunnett과 비교해보면, 전반적으로 p-value가 커졌음 => 유의한 차이가 있다는 결론을 내리기 더 힘들어짐(두 treatment 간의 비교가 관심 대상이 아닐 때는 Dunnett를 써야 함!) 
plot(tukey)

# Simulation 
out <- lm(weight ~ group, data=PlantGrowth)
weight <- rnorm(n=nrow(PlantGrowth), mean=fitted(out), sd=summary(out)$sigma)





# Ch.14 이원분산분석(Two-way ANOVA)
## 2개의 그룹변수!(cf. 일원분산분석: 1개의 그룹변수) 
## 두 그룹변수(discrete)들이 서로 어떤 영향을 미치는지에 대한 교호작용(interaction)까지 볼 수 있음 
warpbreaks # two types of group variables(wool & tension)

levels(warpbreaks$tension)
levels(warpbreaks$wool)
## level의 순서가 잘못 지정되어 있는 경우 => factor() 이용해서 재정렬! 
## factor(해당컬럼, levels=c())
warpbreaks$tension <- factor(warpbreaks$tension, levels = c("L","M","H"))

# 이원분산분석 
# 1. 기술통계 
attach(warpbreaks)
tapply(breaks,wool,mean)
tapply(breaks,tension,mean)
tapply(breaks,list(wool,tension),mean)
boxplot(breaks ~ wool+tension, col='red', data=warpbreaks) # 각 wool과 tension 조합의 breaks의 분포 차이 표현 

# 2. 교호작용(Interaction) 
## interaction plot을 그려서, tension과 wool의 interaction이 있는지 확인 
## interaction.plot("x축에 올 그룹변수", "두번째 그룹변수", 데이터)
interaction.plot(tension, wool, breaks, col=c('red','blue')) # 두 개의 선이 서로 만남 => interaction이 존재! 
## tension = L or H => wool A의 breaks 평균 > wool B의 breaks 평균 
## tension = M => wool A의 breaks 평균 < wool B의 breaks 평균 => interaction!(아래의 분산분석 결과를 통해 정확히 확인) 
## cf. interaction이 없다면 두 개의 선이 평행에 가까울 것 

# 3. 분산분석(ANOVA) 
## interaction이 존재 => interaction term(wool*tension)을 모형에 설명변수로 포함! 
## lm(데이터 ~ 그룹변수1+그룹변수2+interaction term) 
## lm(데이터 ~ interaction term) <- interaction term만 넣어도 동일! 
out <- lm(breaks ~ wool*tension, data=warpbreaks)
anova(out) # tension과 interaction term이 유의(p<a)
## interaction이 있을 때는 두 그룹변수의 효과를 각각 분리해서 해석할 수 없음! 
## cf. 교호작용이 없는 경우 => interaction term 제외! 
summary(lm(breaks ~ wool+tension, data=warpbreaks))
## woolB(B-A)의 추정치 = -5.778 => 유의하지 않음(p>a), wool A의 breaks 평균이 wool B의 그것보다 더 높음 
## tension(M-L, H-L)의 경우, 두 차이 모두 유의(p<a) => 두 차이만 비교하고 싶으면 Dunnett, (H-M)도 비교하고 싶으면 Tukey를 사용하여 p-value 조정! 

# 4. 회귀진단 
par(mfrow=c(2,2))
plot(out) # 등분산 가정의 성립 의심? 





# Ch.15 공분산분석(ANCOVA: Analysis of Covariance) 
## 일원분산분석에 covariate(continuous variable) 추가! 

# 실험에서 철저한 통제가 쉽지 않아 그룹변수 만으로 종속변수의 변동이 설명 안 되는 경우
# => 여러 다른 변인들을 통제해줘서 조사하려는 변수만의 효과를 조사해야 함! 
# => 공분산분석: 분산분석에 "연속형 변수(continuous variables)"를 추가한 것! 
# => 각 그룹 간 평균들의 차이가 있는지 검정하는 건 분산분석과 동일 
# BUT 통제가 안 되는 연속형 변수(covariate)를 추가하여 오차를 줄이고 검정력을 높임! 

anorexia
ano <- anorexia
ano$Diff <- ano$Postwt-ano$Prewt # 치료 전후의 몸무게 차이를 표현하는 컬럼 추가 
ano

# a. 일원분산분석 
## Diff(데이터) = Treat(그룹변수) + Error(설명되지 않는 종속변수) 
## Diff를 종속변수로 해서, 각 치료 방법에 대해 일원분산분석을 하여, 각 치료 방법 간에 몸무게 변화의 차이가 있는지 분석 

# b .공분산분석 
## Diff = Prewt + Treat + Error 
## 몸무게(Prewt)가 큰 사람일 수록 치료와 상관없이 전후의 차이(Diff)도 크다는 사실을 적용! 
## 일원분산분석에 Prewt(공변량: covariate)를 추가 => 목적: 설명력을 높여(Error의 비중을 낮춰) p<a의 가능성을 높여주는 것!! 

## 치료 효과에 의해 설명되는 종속변수의 변동량이, 설명되지 않는 종속변수(Error)의 변동량보다 크면 치료 효과는 유의하다고 봄 
## 공분산분석은 covariate를 추가하여 설명력을 높임 => 설명되지 않는 Error를 줄임 => 치료 효과가 유의하게 나올 가능성을 높여줌! 
## Diff 대신 Postwt를 종속변수로 사용해도 Treat의 p-value는 동일 <- Postwt = Prewt + Treat + Error 

# 0. Reference Coding 
## 대조군(control)을 맨 앞 순서로 이동 
## 컬럼 <- relevel(컬럼, ref="대조군")
## 컬럼 <- factor(컬럼, levels=c())
levels(ano$Treat)
ano$Treat <- relevel(ano$Treat, ref = "Cont")
ano$Treat <- factor(ano$Treat, levels = c("Cont","CBT","FT")) # relevel()과 factor() 중 어느 방법을 사용해도 상관 없음 
levels(ano$Treat)

# 1. 분산분석(ANOVA) 
## lm(y ~ covariate + 그룹변수) <- covariate를 먼저 넣고, 그 다음에 그룹변수를 넣어야 함! 
out <- lm(Postwt ~ Prewt+Treat, data=ano)
anova(out) # p<a => 치료 효과(Treat)의 차이가 있다! 
summary(out) # (CBT-Cont)와 (FT-Cont) 둘 다 유의하다고 나오지만, 이 p-value들을 조정없이 사용하여 결론을 내리진 않음 

# 2. 다중비교 
## Dunnett: 1개의 대조군(Cont)을 2개의 비교군(CBT, FT)과 비교 
library(multcomp)
dunnett <- glht(out, linfct=mcp(Treat="Dunnett"))
summary(dunnett) # p-value 조정 => FT는 Cont와 여전히 유의한 차이 BUT CBT는 Cont와 유의한 차이가 없음! 
plot(dunnett)

# Another Example 
tri <- read.csv("C://data/tri.csv")
out <- lm(trichg ~ hgba1c + trt, data=tri) # covatiate = hgba1c
anova(out) # ANOVA => p<a => 결론: 두 치료 방법에 유의한 차이가 있다! 





# Ch.16 비율(Proportions) 

# 자료가 범주형(categorical) => 기술통계는 "비율"의 형태로! => 비율을 가지고 가설 검증해야 하는 경우가 생김 

# I. 하나의 비율(p)이 기대되는 값(p0)과 같은지 검정 
# a. Binomial Test 
## 하나의 비율(p)이 어떤 값 p0와 같은지 검정
## binom.test(): exact test // prop.test(): 정규분포에 근사 
## 가설 -> H0: p=p0 // H1: p!=p0 

# a-1. binom.test() 
## 동전을 100번 던졌는데 앞면이 44번 나옴 => 이 동전의 앞면이 나올 확률이 0.5인지 검정!(H0: p=0.5 // H1: p!=0.5)
## binom.test(결과, 행동): 이항분포로부터 "직접" p-value를 구하는 exact test 
binom.test(44,100) # p>a => DNR H0! 
'''
H1(Alt. Hyp.)       R 명령어 
p != 0.5(default)   binom.test(x,n)
p != p0             binom.test(x,n,p0)
p > p0(one-tailed)  binom.test(x,n,p0, alter="greater")
p < p0              binom.test(x,n,p0, alter="less")
'''

# a-2. prop.test()
## p를 정규분포에 근사! 
## binom.test()의 모든 옵션들은 prop.test()에도 그대로 적용 
prop.test(44,100) # binom.test()와 근사한 결과! 
## 도수가 커질 수록 binom.test()와 prop.test()와의 차이는 적어짐 
## exact test가 많은 계산이 요구되서, 과거에는 도수가 커지면 정규분포에 근사 => BUT 요즘에는 컴퓨터가 좋아져서 그냥 exact test 수행해도 상관 없음 

# a-3. 연속성 수정(Continuity Corection)
## prop.test(x,n, correct=TRUE) <- default!!
## 이산형 분포를 연속형인 정규분포나 Chi-square 분포에 근사시켜 생시는 오차 보정! 
## 연속성 수정을 한 검정이 exact test에 좀 더 가까움 
prop.test(44,100, correct=FALSE) # cf. 연속성 수정을 하지 않은 결과 <- binom.test()의 결과와 조금 차이가 있음 

# b. 적합성 검정(Goodness of Fit) 
## chisq.test(c(도수), p=c(확률)) 이용하여 적합성 검정 
## H0: p1=p10, p2=p20, ... , pk=pk0 (p10+p20+...+pk0 = 1) // H1: not H0 

## ex. 멘델의 법칙 -> p(노랑&둥글, 노랑&주름, 녹색&둥글, 녹색&주름) = 9:3:3:1 
c(9,3,3,1)/sum(9,3,3,1) # p의 합을 1로 만듬! 
chisq.test(c(216,79,65,21), p=c(9,3,3,1)/sum(9,3,3,1)) # p>a => DNR H0(각 강낭콩 표현형의 비율이 9:3:3:1이다)



# II. 두 비율(p1,p2)의 차이를 검정 
## 종속관계: 동전을 100번 던졌는데 앞면이 44번 나옴 => 뒷면은 자동적으로 56(100-44)번!  
## 독립관계: 두 사람이 동전을 100번 던짐 => 한 사람의 앞면 나오는 횟수와 다른 사람의 앞면 나오는 횟수는 "독립"관계! 

## prop.test() <- 독립적인 두 비율의 차이 검정
'''
H1          R 명령어
p1 != p2    prop.test(c(x1,x2), c(n1,n2))
p1 > p2     prop.test(c(x1,x2), c(n1,n2), alter="greater")
p1 < p2     prop.test(c(x1,x2), c(n1,n2), alter="less")
'''
## ex. A는 주사위 50번 던져 1의 눈이 9번 나옴 // B는 주사위 60번 던져 1의 눈이 8번 나옴 
## => 두 사람의 1의 눈이 나오는 비율이 같은지 검정! 
prop.test(c(9,8), c(50,60)) # p>a => DNR H0(두 비율은 유의한 차이가 없다)

# III. 셋 이상 비율의 차이 
## ex. A,B,C 세 사람이 주사위를 각각 100번씩 던져 1의 눈이 나올 비율이 각각 14,18,15번이었음 
## => 위 세 사람의 1의 눈이 나오게 던지는 확률이 같은지 검정 
prop.test(c(14,18,15), c(100,100,100)) # p>a => DNR H0(세 비율 간에 유의한 차이가 없다)



# Simulation 
# i. 이항분포(binomial distribution) -> 동전(H or T)
## rbinom(n=횟수, size=동전/주사위 개수, p=확률)
rbinom(n=10, size=1, p=.5) # 동전을 10번 던져(n=10) 앞면이 나올 확률이 0.5인 이항분포로부터 시뮬레이션 <- 각각이 앞면(1)인지 뒷면(0)인지 기록
rbinom(n=1, size=10, p=.5) # 동전 10개(size=10)를 한꺼번에 던져 앞면이 몇개 나오는지 시뮬레이션
rbinom(n=5, size=10, p=.5) # 동전 10개(size=10)를 던져 앞면이 나오는 동전 수를 세는 시행을 5번 반복(n=5)

# ii. 다항분포(multinomial distribution) -> 주사위(1~6) 
## 주사위를 한번 던져 각 눈이 나올 확률은 모두 1/6
rmultinom(n=1, size=1, p=c(1,1,1,1,1,1)/6) # 어느 눈이 나왔는지 확인! 
rmultinom(n=1, size=10, p=c(1,1,1,1,1,1)/6) # 10개의 주사위(size=10)를 동시에 던짐 
rmultinom(n=5, size=10, p=c(1,1,1,1,1,1)/6) # 10개의 주사위(size=10)를 5번 시행(n=5)
rmultinom(n=1, size=381, p=c(9,3,3,1)/6) # 멘델의 강낭콩 교배 시뮬레이션 
