#Reading data from API

#Authentication and fetching data from Twitter
library(httr)
myapp = oauth_app("twitter", key="yourConsumerKeyHere", secret="yourConsumerSecretHere")
sig = sign_oauth1.0(myapp, token = "yourTokenHere", token_secret = "yourTokenSecretHere")
homeTL - GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

#Reading Data from other sources
#data storage mechanism R Package

read.foo
read.arff(Weka)
read.dta(Stata)
read.mtp(Minitab)
read.spss(SPSS)
read.xport(SAS)


           