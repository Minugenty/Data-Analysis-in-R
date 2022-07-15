kings <- scan("kings.txt",skip=3)
kings
kingstimeseries <- ts(kings)
kingstimeseries

births <- scan("nybirths.txt")
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
birthstimeseries

souvenir <- scan("fancy.txt")
souvenirtimeseries <- ts(souvenir, frequency=12, start=c(1987,1))
souvenirtimeseries

plot.ts(kingstimeseries)
plot.ts(birthstimeseries)
plot.ts(souvenirtimeseries)
logsouvenirtimeseries <- log(souvenirtimeseries)
plot.ts(logsouvenirtimeseries)

#install.packages("TTR")
library("TTR")
kingstimeseriesSMA3 <- SMA(kingstimeseries,n=3)
plot.ts(kingstimeseriesSMA3)
kingstimeseriesSMA8 <- SMA(kingstimeseries,n=8)
plot.ts(kingstimeseriesSMA8)

#Seasonal Data decomposition
birthstimeseriescomponents <- decompose(birthstimeseries)
birthstimeseriescomponents$seasonal
plot(birthstimeseriescomponents)


#Seasonal Adjustment - difference method
birthstimeseriescomponents <- decompose(birthstimeseries)
birthstimeseriesseasonallyadjusted <- birthstimeseries - birthstimeseriescomponents$seasonal
plot(birthstimeseriesseasonallyadjusted)

#Forecasts using Exponential Smoothing
#Simple Exponential Smoothing
rain <- scan("precip1.txt",skip=1)
rainseries <- ts(rain,start=c(1813))
plot.ts(rainseries)

rainseriesforecasts <- HoltWinters(rainseries, beta=FALSE, gamma=FALSE)
rainseriesforecasts
rainseriesforecasts$fitted
plot(rainseriesforecasts)
rainseriesforecasts$SSE

#install.packages("forecast")
library("forecast")
#rainseriesforecasts2 <- forecast.HoltWinters(rainseriesforecasts, h=8)
rainseriesforecasts2 <- forecast(rainseriesforecasts, h=8)
rainseriesforecasts2
#plot.forecast(rainseriesforecasts2)
plot(rainseriesforecasts2)

#Holt's Exponential Smoothing
skirts <- scan("skirts.txt",skip=5)
skirtsseries <- ts(skirts,start=c(1866))
plot.ts(skirtsseries)
skirtsseriesforecasts <- HoltWinters(skirtsseries, gamma=FALSE)
skirtsseriesforecasts
skirtsseriesforecasts$SSE
plot(skirtsseriesforecasts)
skirtsseriesforecasts2 <- forecast(skirtsseriesforecasts, h=19)
plot(skirtsseriesforecasts2)

#Holt-Winters Exponential Smoothing
logsouvenirtimeseries <- log(souvenirtimeseries)
souvenirtimeseriesforecasts <- HoltWinters(logsouvenirtimeseries)
souvenirtimeseriesforecasts
plot(souvenirtimeseriesforecasts)
souvenirtimeseriesforecasts2 <- forecast(souvenirtimeseriesforecasts,h=48)
plot(souvenirtimeseriesforecasts2)

#ARIMA Models - p,d,q
#AR - p - PACF - Partial Correlogram
#MA - q - ACF - Correlogram
#ARMA - (p,q) - only on stationary
#ARIMA - 
#Differencing
skirtsseriesdiff1 <- diff(skirtsseries, differences=1)
plot.ts(skirtsseriesdiff1)
skirtsseriesdiff2 <- diff(skirtsseries, differences=2)
plot.ts(skirtsseriesdiff2)
arima (p, d = 2, q)

kingtimeseriesdiff1 <- diff(kingstimeseries, differences=1)
plot.ts(kingtimeseriesdiff1)
#d = 1

Acf(kingtimeseriesdiff1, lag.max=20) # plot a correlogram
Acf(kingtimeseriesdiff1, lag.max=20, plot=FALSE)
# q = 1
Pacf(kingtimeseriesdiff1, lag.max=20) # plot a partial correlogram
Pacf(kingtimeseriesdiff1, lag.max=20, plot=FALSE)
# p = 3
#ARMA(p,q)
#1. ARMA(3,0) #3
#2. ARMA(0,1) #1
#3. ARMA(p,q) #2
#Rule -> Min no. of parameters
#ARIMA -> (0,1,1)

library(forecast)
auto.arima(kings)

kingstimeseriesarima <- arima(kingstimeseries, order=c(0,1,1))
kingstimeseriesforecasts <- forecast(kingstimeseriesarima, h=5)
kingstimeseriesforecasts
plot(kingstimeseriesforecasts)


volcanodust <- scan("dvi.txt", skip=1)
volcanodustseries <- ts(volcanodust,start=c(1500))
plot.ts(volcanodustseries)
# d = 0
Acf(volcanodustseries, lag.max=20) # plot a correlogram
Acf(volcanodustseries, lag.max=20, plot=FALSE)
# q = 3
Pacf(volcanodustseries, lag.max=20)
Pacf(volcanodustseries, lag.max=20, plot=FALSE)
# p = 2

#1. ARMA(2,0) #2
#2. ARMA(0,3) #3
#3. ARMA(p,q) #2
#Rule -> Min no. of parameters
#ARIMA -> (2,0,0)

auto.arima(volcanodust)
volcanodustseriesarima <- arima(volcanodustseries, order=c(2,0,0))
volcanodustseriesarima
volcanodustseriesforecasts <- forecast(volcanodustseriesarima, h=31)
plot(volcanodustseriesforecasts)
