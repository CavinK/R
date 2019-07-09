# Ch.1 Introduction of Time Series Analysis 

'''
분석자료 - 횡단면 자료(Cross Sectional Data) vs 시계열 자료(Time Series Data)

시계열 자료: 동일한 시간 구분(Fixed Time Interval)에 따라 관측 자료를 요약 <- 독립이 아니라 상호 연관! 
시계열 분석: 인과성 없음, 빈약한 과거 정보 but 유의한 수준 

시간별 구분 - 이산형(Discrete) 시간 시계열 / 연속형(Continuous) 시간 시계열 
변량별 구분 - 단일변량(Uni-Variable) 시계열 / 다변량(Multi-Variable) 시계열 
정상성 구분 - 정상(Stationary) 시계열 / 비정상(Non-Stationary) 시계열 
선형성 구분 - 선형(Linear) 시계열 / 비선형(Non-Linear) 시계열

=> 계통변동(Systematic Variation) vs 우연변동(Random Variation)으로 구분되어 모형화 => 미래 상황 예측! 
'''

'''
* 시계열 분석의 개념 
1. 대부분의 시계열 자료는 Trend가 없는 독립적인 것 <- Trend가 있다면 제거! 
2. 연속의존성(Serial Dependence): 대부분 시계열 자료는 인접한 자료 사이에 상관성이 없는 것으로 가정(있으면 통제) 
3. 정상성(Stationary): 시계열은 어디에서 살펴보든지 같은 성질을 가짐 

* 시계열 분석의 접근방법
1. 진동수 영역(Frequency Domain) 분석법: 정상적인(과거의 관계식이 미래로 일반화) 시계열의 경우, 스펙트럴 밀도함수를 추정 => 변화주기 등 파악 
2. 시간영역(Time Domain) 분석법: 자기상관함수 이용 => 시계열 자료 사이의 상관구조 파악 <- 계량경제학!! 
=> 자기상관과 부분 자기상관을 토대로 한 확률모형을 적용! 

* 자기상관(Auto Correlation)
동일한 시간구간으로 나눠진 벡터로 구성된 시계열 자료 <- 현재의 개체수가 이전의 개체수와 어떤 연관? 
ex. 이번 달 개체수와 지난 달 개체수의 연관성 => 1차 자기상관 // k 시간차의 개체수와의 연관성 => k차 자기상관 

* 부분 자기상관(Partial Auto Correlation)
다른 시간 구간의 개체수와의 상관관계를 통제, 현재의 개체수가 시간차 k의 개체수와 어떤 연관이 되어 있는지 파악 

=> 현재 자료가 과거 자료로부터 얼마나 영향을 받는가의 "기억"으로 평가 
'''

'''
* 시계열 분석
과거를 이해하고, 미래를 예측 
Random한 변동(Variation)을 파악하여 System 분석 수행 => 확률모형! 
yt = a + b1*x1t + b2*x2t + ... + bk*xkt + et <- 관측시간(t; x축)에 대한 관측자료(x; y축)의 관계 

AR: 자기회귀 모형(Auto Regressive Model)
MA: 이동평균 모형(Moving Average Model)
ARMA: 자기회귀 이동평균 모형(Auto Regressive Moving Average Model)
ARIMA: 자기회귀 결합평균 모형(Auto Regressive Integrated Moving Average Model)
AECT: 오차수정 자기회귀모형(Autoregressive Error Correction Model)
ARCH: 분산 자기회귀모형(Auto Regressive Conditional Heteroscedastic Model)
GARCH: 일반화 분산 자기회귀모형(Generalised ARCH Model)
SV: 확률적 변동 모형(Stochastic Volatility Model)
tsDyn: 비선형 시계열 분석모형(Nonlinear Time Series Analysis Model)
MSM: 마르코프 다중 프랙탈모형(Markov Switching Multifractal Model)
'''

help(ts)
ts(1:10, frequency = 4, start = c(2001,2)) # 분기 자료 // 조사 자료는 1부터 10까지 

'''
* 시계열 자료의 정상성(Stationary)
- 모든 시간 t에 대하여, 평균이 일정
- 모든 시간 t에 대하여, 분산이 일정
- 시계열 자료 xt1, xt2의 자기상관함수(ACF: Autocovariance Function) 및 편자기상관함수(PACF: Partial ACF)는 시간 t1, t2에만 의존 

=> 위 조건을 만족시키면, 자료의 확률적 성질이 시간에 따라 일정! 

정상성 가정 검증 <- ACF와 PACF 등 2개의 지표가 적용됨(R을 이용하여 산정됨!)

ACF: 동일한 변수를 시점을 달리하여 관찰 => 시점에 따라 자료 간 상호 연관관계 나타냄 
PACF: 두 변수 제외한 모든 변수의 영향 제거 => 두 변수 사이의 순수한 상호 연관관계 
'''

# 시계열 자료의 형태
# 1. 우연변동 시계열(Random Variation Time Series)
# 2. 계절변동 시계열(Seasonal Variation Time Series)
# 3. 추세변동 시계열(Trend Variation Time Series)
# 4. 계절적 추세변동 시계열(Seasonal-Trend Variation Time Series)
# 5. 순환변동 시계열(Cyclical Variation Time Series)
# 6. 영구적 변화의 우연변동 시계열(Permanent Change Random Variation Time Series)

# 1. 우연변동 시계열(Random Variation Time Series)
## 시계열 자료가 일정한 수준에 머무르면서 우연변동(Randome)이나 기저변동(Underlying)에 의한 변화만 나타내는 경우
## 확률오차에 의한 예측이 가능한 시계열 모형! 
## ex. 분기별 차이가 없는 상품 판매량, 생산량
## yt = a + et <- a: 미지의 모수(자료에서 추정)
dd1 <- matrix(c(1342,1442,1252,1343,1425,1362,1272,1243,1359,1412,1253,1201,1478,1322,1406,1254,1289,1497,1208))
dd1.ts <- ts(data=dd1, start = c(2006,1), frequency = 4)
plot(dd1.ts, mai="Random Variation Time Series")

# 2. 계절변동 시계열(Seasonal Variation Time Series)
## 주기적 성격의 계절적 변동(Seasonal Variation, Seasonal Fluctuation)
## 계절적 변동 <- 1년의 월별 변동(Monthly), 1달의 요일별 변동(Weekly), 1일의 시간별 변동(Timely) 등으로 세분화 
## 순환변동(Cyclical Variation): 주기가 1년 이상, 장기적인 시간 흐름에 따라 주기적으로 변화 
## yt = St + et <- St: 계절변동 
## yt = a + b1*sin(2*pi*t/f) + b2*cos(2*pi*t/f) + et <- f:주기 // a,b: 미지의 모수(자료에서 추정)
dd2 <- matrix(c(1142,1242,1452,1543,1125,1262,1456,1572,1143,1259,1462,1553,1121,1258,1472,1546,1154,1249,1477,1548))
dd2.ts <- ts(data=dd2, start = c(2006,1), frequency = 4)
plot(dd2.ts, mai="Seasonal Variation Time Series")

# 3. 추세변동 시계열(Trend Variation Time Series)
## 시간에 따라 증가하거나 감소 => 추세변동(Trend Variation, Trend Fluctuation)
## yt = Tt + et <- Tt: 추세변동 
## yt = a + b*t + et <- a+b1*t: 선형의 추세변동(Linear Trend Variation)
## yt = a + b1*t + b2*t + et <- a+b1*t+b2*t: 2차식의 비선형에 따른 추세변동(Non-Linear Trend Variation)
dd3 <- matrix(c(1142,1242,1252,1343,1225,1562,1356,1572,1343,1459,1412,1453,1401,1478,1322,1606,1554,1589,1597,1408))
dd3.ts <- ts(data=dd3, start = c(2006,1), frequency = 4)
plot(dd3.ts, mai="Trend Variation Time Series")

# 4. 계절적 추세변동 시계열(Seasonal-Trend Variation Time Series) 
## 추세변동(Trend Variation)과 계절적 변동(Seasonal Variation)을 동시에 보여줌 
## yt = Tt + St + et <- 선형의 추세변동 
## yt = a + b1*t + b2*sin(2*pi*t/f) + b3*cos(2*pi*t/f) + et <- 시계열의 주기성 
dd4 <- matrix(c(1142,1242,1452,1543,1225,1362,1556,1672,1343,1459,1662,1753,1421,1558,1772,1846,1554,1649,1877,1948))
dd4.ts <- ts(data=dd4, start = c(2006,1), frequency = 4)
plot(dd4.ts, mai="Seasonal Trend Variation Time Series")

# 5. 순환변동 시계열(Cyclical Variation Time Series) 
## 1년 이상의 장기적 시간에서 반복적인 형태를 보여주는 시계열 
## cf. 1년 이하의 단기적 반복: 계절변동 
## ex. 경제순환(Business Cycle)
## 장기적 시계열 자료라서 순환변동과 추세변동 등이 함께 나타나기 때문에 주의! 
## yt = Ct + et 
dd5 <- matrix(c(1142,1242,1452,1543,1225,1362,1556,1672,1343,1459,1662,1753,1221,1358,1572,1646,1154,1249,1477,1548))
dd5.ts <- ts(data=dd5, start = c(2006,1), frequency = 4)
plot(dd5.ts, main="Cyclical Variation Time Series")

# 6. 영구적 변화의 우연변동 시계열(Permanent Change Random Variation Time Series)
## 영구적 변화 => 변화된 상태에서 우연변동(Random Variation) 또는 계절변동(Seasonal Variation)을 보여주는 시계열 
## yt = a1 + et 
## yt = a2 + etprime 
dd6 <- matrix(c(1342,1442,1252,1343,1425,1362,1456,1272,1243,1359,1812,1653,1601,1878,1722,1806,1654,1689,1897,1608))
dd6.ts <- ts(data=dd6, start = c(2006,1), frequency = 4)
plot(dd6.ts, mai="Permanent Change Rendom Variation Time Series")





# Ch.2 Structure of Time Series Data 

# 시계열 자료의 특징 
## a. 이산적(Discrete), 유한한 자료(Finite Series) 
## b. 자기유사적(Fractal/Self-Similar) 
## c. 크고 작은 변동이 다중적 구조로 중첩 <- 주기적 변동, 비주기적 변동, Noise 

# 1. 시계열 자료의 속성 
## class, start, end, frequency, cycle, tsp 
dd <- matrix( c(1342,1442,1252,1343,1425,1362,1456,1272,1243,1359,1412,1253,1202,1478,1322,1406,1254,1289,1497,1208) )
dd.ts <- ts(data=dd, start = c(2006,1), frequency = 4)
class(dd.ts) # 시계열 자료의 Class 
start(dd.ts) # 시작 시간 
end(dd.ts) # 종료 시간 
frequency(dd.ts) # 시계열 자료 구분(주기)
window(dd.ts, c(2007,2), c(2008,3)) # 자료 추출(2007년 2분기부터 2008년 3분기까지)
cycle(dd.ts) # 시계열 자료의 주기 
tsp(dd.ts) # 자료 개요 <- 시작시간, 종료시간, 주기 

# 2. 기본적 연산 
## matrix 연산과 유사! 
zz <- ts(matrix(1:24, 8, 3), s=c(2001,1), f=4, n=c('a','b','c')) # 8x3의 matrix 작성 
class(zz) # mts: multiple time series 
zz[,'a'] # n='a'의 자료만 추출 
zz[,'a'] + zz[,'b'] # n='a' 자료와 n='b' 자료의 합 
zz[,'a']^2 / zz[,'b']
ts.plot(zz, lty=1:3, main="Multiple Time Series Data") # ts.plot(): 시계열 자료의 그래프 작성 프로그램 
legend("bottomright", c('a','b','c'), lty=1:3) # lty: Line Type 

# 3. Time Lag의 처리: lag 
## Time Lag: 시차(어떤 자극이 주어졌을 때, 이에 대한 반응이 나타나기까지의 시간적 지체) 
## yt-1: yt의 1차 Lag // yt-2: yt의 2차 Lag // yt-k: yt의 k차 Lag 
## lag 프로그램 사용! 
dd.ts # yt
lag(dd.ts, k=2) # yt-2: yt의 2차 Lag 
lag(dd.ts, k=-3) # yt+3: yt의 -3차 Lag 

# 4. 차분(Difference)의 산정: diff 
## 차분: 특정시점 자료에서 그 앞에 있는 자료와의 차이 
## 시계열 자료가 추세를 내포하고 있을 경우, 이를 제거할 때 적용! 
## 1차 차분: Dyt = yt - yt-1 
## 2차 차분: D2yt = Dyt - Dyt-1 = yt - 2yt-1 + yt-2 
## 계절변동 차분: D12yt = Dyt - Dyt-12 
dd.ts # yt
diff(dd.ts) # lag=1, 1차 차분(Dyt = yt - yt-1)
diff(dd.ts,2) # lag=2, 2차 차분(D2yt = Dyt - Dyt-1)
diff(dd.ts, 1,2) # lag=1, 2차 차분 <- ex. 2006년 3분기: 1442-1342=100 => -190-100=-290 <- 1차 차분에서 한 번 더 차분한 거! 
diff(diff(dd.ts)) # 2차 차분 

# 5. 역차분(Inverse Difference)의 산정: diffinv 
## 역차분: 차분 산정값을 토대로 본래의 조사자료를 환원하여 산정하는 과정 
## yt = Dyt + yt-1 
dd.ts # yt
d1 <- diff(dd.ts) # lag=1, 1차 차분 산정(Dyt = yt - yt-1) 
d2 <- diffinv(d1) # lag=1, 1차 역차분 산정(yt = Dyt + yt-1)
for (i in 1:length(dd.ts)) d3 <- d2+1342 # 본래의 조사 자료로 환원(초기값 = 1342)

# 6. Box-Cox 변환: BoxCox 
## 시계열 자료의 특수한 변환을 나타내는 방식 
## f(x:λ) = (x^λ - 1)/λ (λ!=0)
## f(x:0) = log(x) (λ=0) 
dd.ts
library(forecast)
lambda <- BoxCox.lambda(dd.ts)
new <- BoxCox(dd.ts, lambda)
(dd.ts^lambda-1)/lambda # BoxCox()로 계산한 것과 결과가 같음! 
InvBoxCox(new, lambda) # 역변환 

# 7. 시계열 자료의 합병(합집합): ts.union 
## frequency가 같은 복수의 시계열 자료에 대해 합병 수행 <- 합집합 
## 자료가 없을 경우에는 NA로 나타남 
zz1 <- ts(matrix(1:24,8,3), s=c(2001,1), f=4, n=c('a','b','c'))
zz2 <- ts(matrix(11:22,4,3), s=c(2002,1), f=4, n=c('a','b','c'))
union(zz1,zz2) # 일반적 합집합 
ts.union(zz1, zz2) # 시계열 합집합(결측값은 NA) <- cbind! 

# 8. 시계열 자료의 공통부분(교집합): ts.intersect 
## frequency가 같은 복수의 시계열 자료에 대해 공통부분을 수행 <- 교집합 
## 자료가 없을 경우에는 공집합(NULL) 
zz1 <- ts(matrix(1:24,8,3), s=c(2001,1), f=4, n=c('a','b','c'))
zz2 <- ts(matrix(11:22,4,3), s=c(2002,1), f=4, n=c('a','b','c'))
zz3 <- ts(matrix(21:32,4,3), s=c(2003,1), f=4, n=c('a','b','c'))
intersect(zz1,zz2) # 일반적 교집합 
ts.intersect(zz1,zz2) # 시계열 자료 교집합 
ts.intersect(zz2,zz3) # NULL 

# 9. 시계열 자료의 부분 추출 및 수정: window 
## 시계열 자료(matrix)에 대한 부분 추출 및 수정 => window 프로그램을 통하여 수행 
zz1
window(zz1, s=c(2001,3), delta=1) # 3분기 자료만 추출 
window(zz1, c(2001,3), c(2002,2)) # 2001년 3분기 자료부터 2002년 2분기 자료까지 
window(zz1, c(2001,1), c(2001,2)) <- c(11,12) # 2001년 1분기 자료와 2분기 자료 수정 

# 10. 자료의 통합: aggregate 
## 시계열 자료가 data.frame인 경우 => aggregate 프로그램을 이용하여 통합! 
zz1 <- ts(matrix(1:24, 8,3), s=c(2001,1), f=4, n=c('a','b','c'))
aggregate(zz1) # f=4를 f=1으로 통합!!(연도별 자료가 됨)
aggregate(zz1, nf=2, FUN = mean) # f=4를 f=2로 통합(상/하반기 평균 자료)



# 시계열 예측과정에서 고려하여야 할 요인 
## 시계열 분석은 과거의 자료를 토대로 장래에 대한 상황을 예측 => 예측의 신뢰성(Reliability)이 중요! 
## 시계열 자료에 의한 예측은 시간의 종속성에 기인 <- 미래는 현재로부터, 현재는 과거로부터 자유로울 수 없는 차연적인 연계성! 

# A. 예측결과의 표현방법 <- 점예측(Point Forecast) 방법과 구간예측(Interval Forecast) 방법 
# B. 예측시간의 단위 <- 장기(연간, 다년간), 중기(분기, 연간), 단기(일간, 주간, 월간, 분기) 
# C. 시계열 자료의 형태 <- 우연변동, 계절변동, 추세변동, 계절적 추세변동, 영구적 변화의 우연변동 => 예측방법과 산정 알고리즘의 적용에 큰 영향! 
# D. 예측결과의 허용오차 <- 유의수준 a(0.05) // MSE, MAPE 등 

# 시계열 자료의 예측오차와 평가 
## 예측방법의 신뢰성(Reliability) 평가 <- 예측오차 et = Yt - Yhatt

# i. ME(Mean of Errors): 예측오차의 산술평균 
# ii. RMSE(Root Mean of Squared Errors): 예측오차의 제곱 산정 => 평균 제곱오차(MSE)를 제곱근 
# iii. MAE(Mean of Absolute Errors): 예측오차의 절대값 
# iv. MPE(Mean of Percentage Errors): 상대적인 의미의 예측오차! <- ex. 조사값 10에 대한 예측오차 1 vs 100에 대한 오차 1 
# v. MAPE(Mean of Absolute Percentage Errors): 예측오차의 절대값으로 상대적인 오차 크기 측정 
# vi. MASE(Mean of Absolute Scaled Errors): 조사자료를 척도화 => 예측오차의 절대값에 대한 평균을 산정 

# 차분 & Box-Cox 변환 
## 차분(Difference) or Box-Cox 변환 수행 => 정상(Stationary) 시계열로 변환!! 
plot(AirPassengers, main="Air Passengers")
plot(diff(AirPassengers), main="Difference - Air Passengers") # 차분(Difference): 정상적인 시계열로 바뀜! 
lambda <- BoxCox.lambda(AirPassengers) # Box-Cox 변환을 위한 lambda 계수 
new <- BoxCox(AirPassengers, lambda)
plot(new, main="Box Cox - Air Passengers") # Box-Cox 변환: 시간에 따른 증폭이 줄어듬 
plot(diff(new), main="Diff./Box Cox - Air Passengers") # 변환 결과를 차분 => 정상 시계열이 됨! 

# Random Walk Forecast에 따른 예측과 평가 <- Ch.10  
dd <- matrix(c(1342,1442,1252,1343,1425,1362,1456,1272,1243,1359,1412,1253,1201,1478,1322,1406,1254,1289,1497,1208))
dd.ts <- ts(data=dd, s=c(2006,1), f=4) # 시계열 자료 입력 
ff.ts <- rwf(dd.ts) # Random Walk Forecast <- default: h=10(장래 10분기의 예측!) 
plot(ff.ts)

accuracy(ff.ts) # 예측결과의 지표 
qq1 <- matrix(dd.ts) # 입력자료 Matrix 변환 
qq2 <- matrix(ff.ts$fitted) # 예측결과 Matrix 변환 
qq3 <- matrix(ff.ts$residuals) # 예측오차 Matrix 변환 
qq1 <- qq1[-1,] ; qq2 <- qq2[-1,] ; qq3 <- qq3[-1,] # 첫 번째 값을 제외 

mean(qq3) # ME 값 산정 
sqrt(mean(qq3^2)) # RMSE 
mean(abs(qq3)) # MAE 
mean(qq3/qq1 * 100) # MPE 
mean(abs(qq3/qq1*100)) # MAPE 





# Ch.3 Graphics of Time Series Data 

dd1 <- matrix(c(1342,1442,1252,1343,1425,1362,1456,1272,1243,1359,1412,1201,1478,1322,1406,1254,1289,1497,1208))
dd2 <- matrix(c(1142,1242,1452,1543,1125,1262,1456,1572,1143,1259,1462,1553,1121,1258,1472,1546,1154,1249,1477,1548))
dd4 <- matrix(c(1142,1242,1452,1543,1225,1362,1556,1672,1343,1459,1662,1753,1421,1558,1772,1846,1554,1649,1877,1948))

# 1. cpgram: 시계열 자료의 구간 누적 그래프 
ts.plot(dd1)
ts.plot(dd2)
cpgram(dd1, main="Cumulative Periodogram : dd1") # random variation <- 지속적 계단형 
cpgram(dd2, main="Cumulative Periodogram : dd2") # seasonal variation <- 특정 구간에서 큰 변화 

# 2. monthplot: 구간별 그래프 
dd1.ts <- ts(data = dd1, start = c(2006,1), frequency = 4)
dd4.ts <- ts(data = dd4, start = c(2006,1), frequency = 4)
monthplot(dd1.ts, main="Month Plot : dd1", xlab="Quarter : 2006-2010", ylab="Sales") # horizontal line: mean value 
monthplot(dd4.ts, main="Month Plot : dd4", xlab="Quarter : 2006-2010", ylab="Sales")

# 3. spec.taper: Cosine Bell 함수(1-cos(x)/2) 적용 => 시계열 자료의 양 극단값을 Zero에 가깝게 조정 
ddb.ts <- spec.taper(dd1.ts, p=.1)
plot(ddb.ts, main="Taper a Time Series by a Cosine Bell: ddb")
ddc.ts <- spec.taper(dd4.ts, p=.1)
plot(ddc.ts, main="Taper a Time Series by a Cosine Bell: ddc")

# 4. decompose, tsdisplay: 요소분해법 & ACF, PACF 적용 
## ACF: Autocorrelation Function // PACF: Partial Autocorrelation Function 
decompose(dd1.ts)
library(forecast)
tsdisplay(dd1.ts, main = "Time Series Display: dd1.ts") # 점선: 추정값의 95% 신뢰구간 범위 // 자기상관이 없는 것으로 판단됨 

# 5. lag.plot: Time Lag Plot 
milk <- readLines("C://data/milk.txt")
milk <- as.integer(milk)
lag.plot(milk, set=c(1:12), pch=".", main="Milk - Time Lag Plot", diag.col = "red", do.lines = T)

# 6. wapply: Local Mean에 의한 적용 
library(gplots)
x <- 1:1000
y <- rnorm(1000, mean=1, sd=1+x/1000)
(ww <- wapply(x,y, fun = mean))
plot(x,y, main="Wapply Plot by Local Mean")
lines(wapply(x,y, fun = mean), col="red", lwd=2)
CL <- function(x,sd) mean(x)+sd*sqrt(var(x))
lines(wapply(x,y,CL, sd=1), col="blue", lwd=2)
lines(wapply(x,y,CL, sd=-1), col="blue", lwd=2)
lines(wapply(x,y,CL, sd=2), col="green", lwd=2)
lines(wapply(x,y,CL, sd=-2), col="green", lwd=2)
legend("bottomleft", c("m +/- 2d", "m +/- d", "Local Mean"), col = c(3,4,2), lwd = c(2,2,2), cex = .6)

# 7. bandplot: Fraction Mean에 의한 Band Plot 적용 
## Fraction Mean: 시계열 자료를 몇 개의 부분으로 구분 => 평활화 
## Band Plot: 표준편차 산정 => 산정 범위 표현 
library(gplots)
x <- 1:1000
y <- rnorm(1000, mean=1, sd=1+x/1000)
bandplot(x,y, main="Band Plot by Fraction")
legend("bottomleft", c("m +/- 2d", "m +/- d", "Mean"), col = c("magenta","blue","red"), lwd=c(2,2,2), cex=.6)

# 8. Bivariate Time Series Plots <- 2개의 Time Lag 
install.packages("tsDyn")
library(tsDyn)
install.packages("sm")
library(sm)
(xx <- lynx)
autopairs(xx, type = "levels")
autopairs(xx, type = "persp")
autopairs(xx, type = "image")
autopairs(xx, type = "lines")
autopairs(xx, type = "points")
autopairs(xx, type = "regression")

# 9. Trivariate Time Series Plots <- 3개의 Time Lag(after log-transformation)
head(log(lynx),5)
autotriples(log(lynx), lags=0:1, type="levels")
autotriples(log(lynx), lags=0:2, type="levels")
autotriples(log(lynx), lags=1:2, type="levels")
autotriples(log(lynx), type="persp")
autotriples(log(lynx), type="image")
autotriples(log(lynx), type="points")

# 10. LOESS 회귀선 <- forecast, ggplot2 이용 
install.packages("TSA")
library(TSA)
library(ggplot2)
data(airpass)
p <- autoplot(airpass, main="Airpassengers / Loess Line")
p <- p+geom_ribbon(aes(ymin=airpass-50, ymax=airpass+50), fill="lightblue")
p <- p+geom_line(aes(y=airpass))
p <- p+stat_smooth(method="loess", se=F, col="red")
p

# 11. Seasonal 요소 제외 
plot(airpass, main="Airpassengers / Seasonal Adjustment")
lines(seasadj(decompose(airpass)), col=2, lwd=2)
data(milk)
plot(milk, main="Milk Sales / Seasonal Adjustment")
lines(seasadj(decompose(milk)), col=2, lwd=2)

# 12. Seasonal Plot 구성 
seasonplot(AirPassengers, col=rainbow(12), year.labels = T)
ggseasonplot(AirPassengers, year.labels = T, continuous = T)
seasonplot(milk, col = rainbow(12), year.labels = T)
ggseasonplot(milk, year.labels = T, continuous = T)
