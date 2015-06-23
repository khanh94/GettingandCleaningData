#Quiz 3

#Question 1
setwd('/Users/knguyen1/Downloads')
fileUrl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile='survey.csv', method='curl')
survey = read.csv('survey.csv')

#Set a logical vector
logicalvector = survey$ACR==3 & survey$AGS==6
first3 = which(logicalvector)[1:3]
first3

#Question 2
library(jpeg)
fileUrl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
fileName = "jeff.jpg"
download.file(fileUrl2, fileName, method="curl")
photo = readJPEG("jeff.jpg", native=TRUE)
quantile(photo, probs=c(0.3, 0.8))

#Question 3
library(data.table)

fileUrl3 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileName3 = "GDP.csv"
download.file(fileUrl3, fileName3, method="curl")
GDP = data.table(read.csv("GDP.csv", skip=4, nrows=191))
GDP <- GDP[X != ""]
GDP <- GDP[, list(X, X.1, X.3, X.4)]
setnames(GDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "GDP"))

fileUrl4 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
fileName4 = "EDSTATS_Country.csv"
download.file(fileUrl4, fileName4, method="curl")
EDSTATS = data.table(read.csv("EDSTATS_Country.csv"))
data2 <- merge(GDP, EDSTATS, all = TRUE, by = c("CountryCode"))
sum(!is.na(unique(data2$rankingGDP)))
data2[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y, rankingGDP, GDP)][13]

#Question 4
data2[, mean(rankingGDP, na.rm = TRUE), by=Income.Group]

#Question 5
breaks <- quantile(data2$rankingGDP, probs = seq(0, 1, 0.2), na.rm = TRUE)
data2$quantileGDP <- cut(data2$rankingGDP, breaks = breaks)

data2[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]

