library(Quandl)

newProduct = Quandl("ISM/MAN_PROD", api_key="YourKeyHere")

plot(newProduct$Date,newProduct$Index,type = c("l"),xlab="Date",ylab="Manufacturing Production Index")

productTs<-ts(newProduct$Index, freq=10)

plot(decompose(productTs,"additive"))


export2=ts(newProduct$Index,start=c(1948,1),frequency = 12)
plot(decompose(export2,"additive"))



library(forecast)


auto.arima(export2)

export2.arima <- auto.arima(export2)

export2.forecast <- forecast(export2.arima, h=30)

plot(export2.forecast)


