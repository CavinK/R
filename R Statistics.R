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
## shapito.test => p<a => wilcox.test 
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
## cf. 변환하지 않고 nonlinear model을 그대로 회귀분석 => Ch.20 
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





# Ch.17 Tables 

## xtabs(도수 ~ 가로 + 세로)
## xtabs(도수 ~ TreatA + TreatB)
## xtabs(도수 ~ 로우 + 컬럼)
respire <- read.csv("C://data/respire.csv")
resp <- xtabs(count~treat+outcome, data=respire) # 도수가 count 변수로 요약되어 있는 경우 
respire2 <- read.csv("C://data/respire2.csv")
resp2 <- xtabs(~treat+outcome, data=respire2) # 요약되어 있지 않은 경우(count가 없는 경우)



# Chi-square Test(카이제곱 검정) 
## Table에서 많이 사용하는 검정 
## 가로와 세로가 독립인지 검정! 

## 기대도수가 5 이하인 cell이 전체의 20% => Fisher의 exact test 사용 
## 모든 cell의 도수가 큰 경우 => Chi-square와 exact test는 거의 차이 없음 

## chisq.test(table) or chisq.test(행렬)
chisq.test(resp) # 치료 방법(test, placebo)의 차이가 결과(1: favorable, 0: unfavorable)에 영향 주는지 검정 => p<a: statistically significant!(치료방법의 차이는 결과에 영향을 준다)
chisq.test(matrix(c(48,20,16,40),ncol=2)) # 이렇게 matrix에 값을 직접 입력해도 분석 가능! 

# Fisher의 Exact Test 
## fisher.test(table)
## 초기하분포(hypergeometric distribution)를 이용하여 p-value 계산 
## 테이블의 도수들이 큰 경우 exact test는 많은 계산이 요구됨 => Chi-square Test 사용! 
tea <- read.csv("C://data/tea.csv")
teat <- xtabs(count ~ poured+guessed, data=tea) # poured: 실제 // guessed: 추측 
fisher.test(teat) # p>a => statistically insignificant(실제와 추측은 연관성이 없다 => 독립적이다)
chisq.test(teat) # similar to the result of Fisher's Exact Test(Warning이 출력되면 fisher.test() 실행!)
fisher.test(matrix(c(3,1,1,3),ncol=2)) # matrix 사용 



# Cochran-Armitage Trend Test 
## prop.trend.test(c(),c())
## 컬럼의 level별(low, medium, high)로 "추세"가 있는 지 파악 

'''
(테이블 형태)
              low   medium    high
favorable     13      7       21
unfavorable   29      7       7
total         42      14      28

- 투여한 신경안정제의 용량(low, medium, high)이 정신병 증상에 미치는 영향(favorable, unfavorable) 조사 
- favorable의 확률은 점차 증가(low:0.21 // medium:0.5 // high:0.75)
- unfavorable의 확률은 점차 감소(low:0.69 // medium:0.5 // high:0.25)

=> 컬럼의 level별(low, medium, high)로 "추세"가 있는 지 알아보기 위해 Cochran-Armitage Trend Test 시행! 
H0: 추세가 없다 // H1: 추세가 있다 
'''
prop.trend.test(c(13,7,21),c(42,14,28)) # p<a => reject H0!(신경안정제를 많이 투여할 수록 효과가 좋다)

## cf. medium 용량이 가장 좋은 효과를 주는 경우(high는 부작용 줄 수 있음)
## => 컬럼의 level별로 추세가 없음
## => Cochran-Armitage trend test로는 연관성 찾아내기 힘듬! 
## => Chi-square test 이용!! 
'''
(테이블 형태)
              low   medium    high
favorable     13      10      10
unfavorable   29      4       18
total         42      14      28
'''
prop.trend.test(c(13,10,10),c(42,14,28)) # p>a => DNR H0!(Cochran-Armitage trend test로는 연관성이 파악되지 않음)

trend <- read.csv("C://data/trend.csv")
trendt <- xtabs(count ~ resp+dose, data=trend) # 컬럼 이름 앞에 숫자를 붙이면(ex. 1:low) table이 바람직하게 배열됨 
chisq.test(trendt) # p<a => statistically significant!!(연관성 파악됨)
chisq.test(matrix(c(13,29,10,4,10,18),ncol=3)) # matrix 이용 



# McNemar Test 
## mcnemar.test(Table)
## 연관된 두 binary 변수의 일치도 조사 
## Chi-square: t-test // McNemar: paired t-test 

## ex. 광고 효과가 상품 판매에 영향을 미치는 지 조사 
'''
상품A 광고
광고 전 -> 광고 후
    A         B
A   5(A->A)   5(A->B)
B   15(B->A)  7(B->B)
'''
yuna <- read.csv("C://data/yuna.csv")
yunat <- xtabs(count ~ before+after, data=yuna)
mcnemar.test(yunat) # p<a => statistically significant 



# Simulation 
## r2dtable() <- 초기하분포(hypergeometric distribution) 
r2dtable(n=1, c(33,51), c(42,14,28))
r2dtable(n=1, rowSums(trendt), colSums(trendt)) # 위에 처럼 굳이 로우와 컬럼의 합을 일일히 계산할 필요 없이, 이렇게 함수를 쓰는 게 간편! 





# Ch.18 Logistic Regression 
## 종속변수가 binary! <- cf. 회귀분석, 분산분석: 연속형 종속변수 
## Odds의 log-변환을 종속변수로 모형화 

respire <- read.csv("C://data/respire.csv")
xtabs(count~treat+outcome, data = respire )

# Odds 
## 일어날 확률과 일어나지 않을 확률의 비 <- p/(1-p) 
'''
         outcome
treat      0  1
  placebo 48 16
  test    20 40

placebo의 odds = (16/64)/(48/64) = 16/48
test의 odds = 40/20
'''

# Odds Ratio 
## test의 odds가 placebo의 odds의 몇 배인지 보고 싶을 때 사용 
## Odds Ratio = OddsTest/OddsPlacebo = (40/20)/(16/48) = 6 

# Logistic Regression 
## odds를 log-변환시킨 log(odds)를 모형화 
## log(odds) = log(1/(1-p)) = b0 + b1*x1 + b2*x2 + ... bk*xk 
## odds = 1/(1-p) = e^(b0 + b1*x1 + b2*x2 + ... bk*xk) <- odds는 exp의 형태로 표현! 
### xi가 연속형 -> e^bi는 (xi + 1 vs xi)의 odds ratio 
### xi가 binary 변수 -> e^bi 자체가 odds ratio 

# Ex.1 독립변수가 이산형 <- treat(placebo vs test) 
## 회귀분석과 형식은 동일 BUT lm() 대신 glm() 사용 
## 종속변수인 outcome이 binary 
## glm(종속변수 ~ 독립변수들, family=binomial) 
respire <- read.csv("C://data/respire.csv")
respire2 <- read.csv("C://data/respire2.csv")
out <- glm(outcome ~ treat, family = binomial, data=respire2) # count가 요약되지 않은 경우 
out <- glm(outcome ~ treat, weights = count, family = binomial, data=respire) # weights = count: count가 요약된 경우 
summary(out) # test-placebo인 treattest의 p-value < a => statistically significant! 

## Odds Ratio 
### treattest(test-placebo) = 1.7918 => 대조군(placebo)에 비해 test군이 1.7918만큼 높다는 뜻 
coef(out)["treattest"] # 1.791759
exp(coef(out)["treattest"]) # odds ratio = e^1.791759 = 6 => test군의 odds가 placebo군의 그것보다 6배 높다!! 
### 각 그룹의 odds 구하는 과정 -> page 178 참고! 

## Odds Ratio의 95% Confidence Interval 
confint(out, parm = "treattest") # log(odds ratio)의 CI 
exp(confint(out, parm = "treattest")) # odds ratio의 CI <- 1을 포함하지 않음 

## tapply() 이용 
with(respire, tapply(count, treat, sum)) # 각 그룹의 총 도수 
with(respire, tapply(count*outcome, treat, sum)) # outcome=1에 해당하는 도수(count와 outcome을 곱하면 outcome=0에 해당되는 도수는 사라짐) 
p <- with(respire, tapply(count*outcome, treat, sum)/tapply(count, treat, sum)) # 각 그룹의 outcome이 1일 확률(p) 
odds <- p/(1-p) # 각 그룹의 odds 
odds[2]/odds[1] # odds ratio 

### cf. count가 없는 경우 
with(respire2, tapply(outcome, treat, sum)/tapply(outcome, treat, length)) # length(): 각 그룹의 도수 // sum(): outcome(=1)의 합 



# Ex.2 독립변수가 연속형 <- dose 
toxic <- read.csv("C://data/toxic2.csv")
toxic <- data.frame(dose = c(0,0,1,1,2,2),
                    response = c(0,1,0,1,0,1), # binary <- 0(생존) vs 1(사망) 
                    count = c(7,3,5,5,2,8)) # ex. dose=0 => 10마리 중 3마리 사망, 7마리 생존 
out <- glm(response ~ dose, weights = count, family = binomial, data=toxic)
summary(out) # b=1.1051 <- dose 1 증가 => 쥐가 죽을 odds는 e^1.1051배 증가 
exp(confint(out, parm="dose")) # odds ratio의 95% 신뢰구간 



# Ex.3 2개의 독립변수 
## 인종차별에 대한 데이터 <- 희생자의 인종(victim)과 피고의 인종(defendant)이 사형 판결(death)에 어떤 영향을 주는 지 조사 
dpen <- read.csv("C://data/death_penalty2.csv")

## 피고가 흑인인 경우 사형 판결 받을 확률이 높은 지 파악
defend <- xtabs(count ~ defendant+death, data=dpen) # table 구성 <- odds ratio = 1.181(White의 Black에 대한 odds ratio) 
chisq.test(defend) # p>a => statistically insignificant 

## 피해자의 인종이 사형 판결에 중요한 요인인 지? 
vic <- xtabs(count ~ victim+death, data=dpen) # odds ratio = 2.88(피해자가 백인인 경우, 흑인일 때보다 사형 판결 받을 odd가 거의 3배가 됨) 
chisq.test(vic) # p<a => statistically significant 

## interaction term(victim*defendant) 사용해서 glm()에 적용 
out1 <- glm(death ~ victim*defendant, weights = count, family = binomial, data=dpen)
summary(out1) # victim만 통계적으로 유의 => victim만 모형에 넣음! 

out2 <- glm(death ~ victim, weights = count, family = binomial, data=dpen)
summary(out2)

## 두 모형을 anova()로 비교 
### anova(작은 모형, 큰 모형, test="Chisq") <- glm()일 때는 test="Chisq" 넣어줌! 
anova(out2, out1, test = "Chisq") # p>a => statistically insignificant => 작은 모형이 정당성을 가짐!(변수 제거가 옳음!) 
exp(confint(out2, parm = "victimWhite")) # confidence interval of 95% 



# Ex.4 여러 개의 독립변수 
bw <- read.csv("C://data/birthwt.csv")
colnames(bw) # binary인 low를 종속변수로 사용 <- low: bwt가 2.5kg보다 작으면 1, 크거나 같으면 0 

library(MASS)
out <- glm(low ~ lwt+factor(race)+smoke+ht+ui, data=bw, family = binomial) 
summary(out) # all statistically significant! 
exp(coef(out)) # odds ratio 
## 산모의 흡연(smoke)은 저체중의 odds를 2.8174471배 높임 
## 산모의 몸무게(lwt)가 1 증가하면 신생아 저체중의 odds는 0.9834068배 증가, 즉, 1.016873(=1/0.9834068)배 감소 



# 요약된 자료와 요약되지 않은 자료의 통계치 비교 
## 데이터 구조의 차이 때문에 추정치, 잔차 등이 다름! 
out1 <- glm(outcome ~ treat, weights = count, family = binomial, data=respire) # 요약된 경우 
out2 <- glm(outcome ~ treat, family = binomial, data=respire2) # count가 요약되지 않은 경우 

## 1. 회귀계수(b) 
B <- coef(out1)
### log-odds = log(p/(1-p)) = b0 + b1*x 
### test:1 // placebo:0 
B[1]+B[2]*(respire$treat=="test") # log-odds 
exp(B[1]+B[2]*(respire$treat=="test")) # odds <- log-odds를 exp()로 변환 

## 2. Pr(Y=1)의 추정치 p 
fitted(out1)
fitted(out2) # 모든 124개의 phat이 출력됨!! 
p = unique(fitted(out1)) # 중복 제거 
p/(1-p) # odds 
log(1/(1-p)) # log-odds 

# Simulation 
## 요약된 자료 
total <- with(respire, tapply(count,treat,sum)) # 각 treat(placebo & test)의 도수합 계산 
xtabs(count~treat+outcome, data=respire) 
### treat의 outcome=1인 count를 시뮬레이션 
### 각 treat의 합인 total을 size에 넣고, 각 treat의 Pr(outcome=1)을 p에 넣음 
rbinom(n=length(total), size=total, p=unique(fitted(out1))) # 실제 outcome=1의 데이터와 비교! 

## 요약되지 않은 자료 
rbinom(n=nrow(respire2), size=1, p=fitted(out2)) # 124명 각각의 outcome이 0인지 1인지 시뮬레이션 => size=1 

## toxic 
out <- glm(response~dose, weights=count, family=binomial, data=toxic)
total <- with(toxic, tapply(count, dose, sum))
p = unique(fitted(out))
rbinom(3,total,p) # 이항분포로부터 각 dose별로 죽은 쥐의 수를 시뮬레이션 
'''
[1] 3 5 8

dose    response
0       3/10
1       5/10
2       8/10
'''





# Ch.19 Possion Regression 
## 암으로 인한 사망률: 인구 10만명 당 161명 <- 발생률이 낮음 
## 발생률이 낮은 비율이나 도수가 종속변수인 경우 => Poisson regression 

# 도수의 모형화 
## log(mu) = b0 + b1*x1 + b2*x2 + ... + bk*xk 

# 비율의 모형화 
## log(mu/N) = b0 + b1*x1 + b2*x2 + ... + bk*xk 
## 일정 기간 동안 단위 인구당 새로 발생한 개체 수를 사용하는 경우 
## ex. 2010년 1000명당 위암 발생 환자 수가 3.2명(비율) 

# A. log-linear model 
## ex1. 도수 
bicycle <- read.csv("C://data/bicycle.csv") # 자전거 종류(type)와 안전모 작용 여부(helmet)의 연관성 조사 
bike <- xtabs(count~type+helmet, data=bicycle) # xtabs(count ~ x+y) 
chisq.test(bike) # p<a => statistically significant between type and helmet 

## glm(count ~ 독립변수들, family=poisson) 
summary(glm(count ~ type*helmet, data = bicycle, family=poisson)) # interaction term 
### -> interaction(typeOther:helmetyes)의 p<a => Chi-square의 결과와 동일! 

## ex2. 비율 
melanoma <- read.csv("C://data/melanoma.csv") 
### total: 각 지역(region)과 나이(age) 그룹의 총 인구수 // cases: 피부암 발생 수 

## tapply()를 이용해서 각 age 그룹의 피부암 발생 "비율" 계산 
10000*with(melanoma, tapply(cases, age, sum)/tapply(total, age, sum)) # 인구 10000명당 피부암 발생 비율 
10000*with(melanoma, tapply(cases, region, sum)/tapply(total, region, sum)) # 각 region의 인구 만명당 비율 

## 비율의 경우, glm()에 offset 추가! <- log(mu/N) = log(mu)-log(N) <- 도수일 때는 log(N)를 뺄 필요 없음! 
## glm(count ~ 독립변수들, family=poisson, offset=log(total))
summary(glm(cases~age+region, family=poisson, offset=log(total), data=melanoma))
### -> reference(age<=35)와 비교된 모든 age 그룹이 유의! region도 유의! 
### reference를 비꾸고 싶으면 relevel() 사용(from Ch.15) 



# B. Logistic Regression 
respire <- read.csv("C://data/respire.csv") # placebo에서 총 64명, test에서 총 60명 뽑아서 outcome이 0 or 1인지 관찰 
res <- xtabs(count~treat+outcome, data=respire) # 행의 합이 각각 64, 60으로 고정! 
## => 치료의 종류(treat)가 병의 outcome에 어떤 영향을 미치는지 알아보는 것이 목적 

# cf. Log-linear Models 
bicycle <- read.csv("C://data/bicycle.csv") # 80명을 관찰하여 자전거 종류(type)와 안전모 착용 여부(helmet)의 연관성을 보는 것 
bike <- xtabs(count~type+helmet, data=bicycle) # 열의 합, 행의 합이 고정된 게 아니라, 총합 80이 고정된 값! 
## => type과 helmet 중 어느 변수가 종속 변수이고 어떤 변수가 설명 변수인 지 말할 수 없음! 



# Simulation 
out <- glm(cases~age+region, family=poisson, offset = log(total), data=melanoma)
mu <- fitted(out) # 모형에서 추정된 기대값 mu를 이용해 Poisson 분포에서 사망자 수 시뮬레이션 
rpois(n=length(mu), mu)
cbind(melanoma[,c(1,2)], cases=rpois(12,mu)) # age, region 구분해서 표시 





# Ch.20 비선형 회귀분석(Nonlinear Regression) 
## Pharmacokinetics 모형 사용 
## nonlinear 형태의 두 변수 => 선형으로 변환(log-linearisation)시키지 않고 nonlinear regression 사용! 

# A. One-compartment Model 
one.comp <- read.csv("C://data/one_comp.csv") # 약을 투여한 후, 경과 시간(time)에 따른 혈중 농도(conc) 측정 
## one-compartment model: 혈중 농도가 지수적으로 감소 <- Ct = C0*exp(-K*t) 
## <- C0: 혈중 농도의 최대치(시간이 지남에 따라 땀, 소변 등으로 배출되고 간에 의해 분해되어 지수적ㅇ로 혈중 농도 감소) 
## <- Ct: 시간 t에서의 혈중 농도 // K: elimination rate 

### Ch.10: log-변환으로 정규분포 따르는 log-normal 분포 가정 
### Ch.20: 변환 없이 Nonlinear 함수 형태 그대로 정규분포 따른다고 가정 

# ex1. IV Dose 
## 0. 초기값 추정 
### Ch.10의 log-변환 후 선형회귀분석 결과 참조 

## 1. nonlinear least square 
## nlm(y ~ 함수식, start=list(초기값들)) <- nonlinear regression은 초기값 추정이 필요!! 
one <- nls(conc~C0*exp(-K*time), start = list(C0=41.3, K=0.64), data = one.comp) # 초기값: Ch.10에서 회귀분석으로 얻은 값을 exp로 변형 
### => 추정된 식이 Ch.10(log-변환 후 선형회귀분석)의 추정된 식과 차이가 있음! 
ㅔ
## 2. Visualisation 
install.packages("NRAIA", repos="http://R-Forge.R-project.org")
library(NRAIA)
plotfit(one)

## ex2. Oral Dose 
oral.dose <- read.csv("C://data/oral_dose.csv") 
### 구강 복용 후 약이 소장에서 흡수 => 간을 거쳐 혈중 농도가 측정되는 정맥으로 이동 
### => 약 복용 직후 혈중 농도는 0 => 흡수됨에 따라 가파르게 증가 => 어느 순간에 서서히 감소 
oral <- nls(conc ~ SSfol(Dose=4.4, time, lKe, lKa, lCl), data=oral.dose) # SSfol() 이용해 초기값 추정 // D에 약의 복용량 지정 
summary(oral)
plotfit(oral, xlim=c(0,35))



# B. Two-compartment Model 
two.comp <- read.csv("C://data/two_comp.csv") # Indomethacin: 정맥에 주입한 약의 시간(time:hour)에 따른 혈중 농도(conc:ng/ml)의 변화 
## two-compartment model: one-compartment model보다 약의 농도가 더 가파르게 감소 
## One-compartment model에 지수항이 하나 더 추가 => 초기에 농도가 더 가파르게 감소! 
## <- Ct = A1*exp(-b1*t) + A2*exp(-b2*t) <- SSbiexp(): 적절한 초기값 추정! 

## nls(y변수 ~ SSbiexp(x변수,A1,lrc1,A2,lrc2))
two <- nls(conc~SSbiexp(time,A1,lrc1,A2,lrc2), data = two.comp) # 초기값 없이 SSbiexp()를 이용! 
plotfit(two)



# C. Michaelis-Menten model 
## Pharmacodynamics: 약의 혈중 농도 변화에 몸이 어떻게 반응하는지 연구 
## v = Vm*x / (K+x) <- Vm: v의 이론상 최대값 // K: v=Vm/2를 만족시키는 농도(conc) 
MM <- read.csv("C://data/MM.csv")
mm <- nls(rate ~ SSmicmen(conc,Vm,K), data=MM)
summary(mm)
plotfit(mm, ylim=c(0,130), xlim=c(0,400))

'''
* Self-Starting Functions 

SSbiexp(): Biexponential model 
SSfol(): First-order Compartment Model
SSmicmen(): Michaelis-Menten Model 

SSasymp(): Asymptotic Regression Model 
SSasympOff(): Asymptotic Regression Model with an Offset 
SSasympOrig(): Asymptotic Regression Model through the Origin 
SSfpl(): Four-Parameter Logistic Model 
SSgompertz(): Gompertz Growth Model 
SSlogis(): Logistic Model 
SSweibull(): Weibull Growth Curve Model 
'''

# Simulation 
## 1. fitted()로 yhat 구함 => mean 
## 2. summary(out)$sigma로 sigma_hat 구함 => sd 
## 3. rnorm()으로 정규분포에서 자료를 시뮬레이션 
out <- nls(conc ~ C0*exp(-K*time), start = list(C0=41.3,K=0.64), data=one.comp)
rnorm(n=nrow(one.comp), mean=fitted(out), sd=summary(out)$sigma) 





# Ch.21 생존분석(Survival Data Analysis) 

## 절단된 자료 <- ex. 10년 동안 매월 초 환자에게 연락해서 생존 확인했는데, 5년차 부터는 연락이 두절된 경우 
## => 정확한 생존기간은 알 수 없지만 생존 기간이 최소 5년 이상임을 알 수 있음 
## 생존분석: 이런 절단된 자료를 버리지 않고 분석에 최대한 활용! 

## 생존함수(survival function: S(t))
### t 시점에 살아 있을 확률 

## 위험함수(hazard function: h(t))
### h(t) = - (dS(t)/dt)/S(t) 
### t 시점에 살아 있지만 아주 짧은 시간 안에 죽을 확률 

## 생존함수 추정 방법 
### 1. Kaplan-Meier의 Log-rank test <- 두 생존함수의 차이 검정 
### 2. Cox regression <- hazard function 모형화 

## survival::Surv() <- 생존시간과 절단 정보를 결합하여 종속변수로 이용 

'''
Library                 survival 
Survival object         Surv(time,status)   종속변수 생성 
Kaplan-Meier estimates  survfit()           생존함수 S(t) 추정 
Log-rank test           survdiff            두 생존함수의 차이 검정 
Cox regression          coxph()             위험함수 h(t) 추정 
'''

# ex1. 

# 0. 종속변수 생성 
library(survival)
attach(aml) # time: 백혈병 환자들의 생존시간 // status: 생존시간이 절단되었는 지의 여부(0 or 1)
### status==1 <- 환자가 연구기간 이내에 사망 // status==0 <- 추적 안 되거나 아직 살아있어서 실제 생존시간이 time보다 더 길 가능성이 있음 
Surv(time, status==1) # 사망한 환자의 status 값이 1임을 명시 // status==0의 경우 "+"를 추가하여 실제 생존시간이 더 길 수 있음을 암시 
### <- 이를 종속변수로 사용!!! 

# 1. Kaplan-Meier Curve 
## survfit() 
## y~1 <- 모든 그룹을 합친 전체 데이터를 사용하라는 의미(cf. 기존에는 y-절편만 넣으라는 의미였음) 
out <- survfit(Surv(time,status==1)~1, data=aml)
summary(out)
plot(out) # 가운데 선이 K-M Curve, 옆의 두 점선은 95% 신뢰구간 
plot(out, conf.int = FALSE) # CI 없앰 

out.x <- survfit(Surv(time,status==1)~x, data=aml) # x컬럼: 환자가 항암 치료 받았는지 아닌지의 여부 => 이를 그룹변수로 사용!(y~x)
plot(out.x, lty=1:2, col=c("red","blue")) # lty(1:실선, 2:점선) // 항암 치료를 받은 환자들(Maintained)의 생존확률이 확연히 높음 

# 2. Log-rank test 
## survdiff() 
## 항암 치료 받은 환자들의 생존확률이 모든 구간에 걸쳐 높음 => 이 차이가 통계적으로 유의한 지 log-rank test 수행 
survdiff(Surv(time, status==1)~x, data=aml) # Chi-square(df=1)=3.4 // p>=a <- 그래도 의미 있음! 

# 3. Cox regression 
## coxph() 
## log-hazard를 회귀분석처럼 선형모형화 => 위험함수 h(t)를 추정 
summary(coxph(Surv(time,status==1)~x, data=aml)) # hazard ratio exp(coef) = 2.4981 
### <- 항암 치료 받지 않은 그룹의 순간사망위험(hazard)이 2.4981배 더 높음 
### <- 통계적으로 유의미하진 않지만(p>a), 상당히 의미 있음 



# ex2. 

?lung # 폐암 환자들의 생존 데이터 => 생존시간(time)과 절단정보(status)가 포함되어 있음을 확인! 
### status==1: censored // status==2: dead 

# 1. Kaplan-Meier Curve 
Surv(time, status==2) # 종속변수 생성 
lung$sex # 그룹변수1 <- level이 둘인 경우 연속형으로 입력돼도 상관 없지만, 둘 이상인 경우 factor()를 이용하여 이산형으로 바꿔줘야 함! 
out.sex <- survfit(Surv(time,status==2)~sex, data=lung)
plot(out.sex, lty=1:2, col=c("red","blue")) # K-M Curve 

lung$age # 그룹변수2 <- 연속형 변수 => 이산형 변수로 바꿔줘야 함! => median보다 큰 그룹은 TRUE(1), 작은 그룹은 FALSE(0) 
age2 <- (lung$age > median(lung$age))
out.age <- survfit(Surv(time,status==2)~age2, data=lung)
out.age <- survfit(Surv(time,status==2)~(age>median(age)), data=lung) # 따로 변수(age2) 생성하지 않고 이렇게 정의해줘도 됨! 
plot(out.age, lty=1:2, col=c("red","blue"))

# 2. Log-rank Test 
survdiff(Surv(time,status==2)~sex, data=lung) # p<a => statistically significant 

# 3. Cox Regression 
out <- coxph(Surv(time,status==2)~sex, data=lung)
summary(out) # 남자(sex=1)를 reference로 한 여자(sex=2)의 hazard ratio: exp(coef)=0.5880 

out2 <- coxph(Surv(time,status==2) ~ age+sex, data=lung) # age와 sex를 동시에 넣고 모형 적합 
summary(out2) # age의 hazard ratio: p>a // 남자에 대한 여자의 hazard ratio: p<a 

anova(out,out2) # 두 모형 비교 <- Cox regression의 모형을 비교할 때 LRT(likelihood ratio test) 사용 
### age의 p-value>a => not statistically significant, but still meaningful(quite close to a(0.05)) 





# Ch.22 검정력(Power)과 표본 수(Sample Size) 
