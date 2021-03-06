#Getting data from the web
fileUrl = "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="restaurants.csv", method="curl")
restData = read.csv("restaurants.csv")

#Look at a bit of the data
head(restData, n=3)

tail(restData, n=3)

summary(restData)

str(restData)

quantile(restData$councilDistrict, na.rm=TRUE)
quantile(restData$councilDistrict, probs=c(0.5, 0.75, 0.9))

table(restData$zipCode, useNA="ifany")

table(restData$councilDistrict, restData$zipCode)

sum(is.na(restData$councilDistrict))

any(is.na(restData$councilDistrict))

all(restData$zipCode > 0)

colSums(is.na(restData))
all(colSums(is.na(restData))==0)

table(restData$zipCode %in% c("21212"))

table(restDat$zipCode, %in% c("21212", "21213"))

restData[restData$zipCode %in% c("21212", "21213"),]

dat(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt = xtabs(Freq ~ Gender + Admit, data=DF)
xt

#Flat tables
warpbreaks$replicate = rep(1:9, len=54)
xt = xtabs(breaks ~., data=warpbreaks)
xt
ftable(xt)

fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units="Mb")

