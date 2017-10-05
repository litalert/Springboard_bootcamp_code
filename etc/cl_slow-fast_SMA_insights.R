#slow and fast moving average comparision offers useful information for directional trading

library(quantmod)
library(TTR)

getSymbols(c('EWP', 'SPY'), src='google')
chartSeries(EWP$EWP.Close, theme='white', TA="addEMA(50, col='black');addEMA(200, col='blue')")


EWP.EMA.10 <- EMA(EWP$EWP.Close, n=10, ) 
EWP.EMA.50 <- EMA(EWP$EWP.Close, n=50, ) 
EWP.EMA.200 <- EMA(EWP$EWP.Close, n=200, ) 
Fast.Diff <- EWP.EMA.10 - EWP.EMA.50
Slow.Diff <- EWP.EMA.50 - EWP.EMA.200
addTA(Fast.Diff, col='blue', type='h',legend="10-50 MA")
#anything under 0, you should short sell. anything above 0, you should long sell

addTA(Slow.Diff, col='red', type='h',legend="50-200 MA")
#compare slow and fast MA. if the fast crosses the 0 line, confirm your action with the slow

