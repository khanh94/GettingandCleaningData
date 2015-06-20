#Reshaping the data

library(reshape2)
head(mtcars)

#Melting data frames
mtcars$carname = rownames(mtcars)
carMelt = melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
head(carMelt)

tail(carMelt, n=3)

#Casting data frames
cylData = dcast(carMelt, cyl~variable)
cylData

cylData = dcast(carMelt, cyl~variable,mean)
cylData

#Averaging values
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

spIns = split(InsectSprays$count, InsectSprays$spray)
spIns

sprCount = lapply(spIns, sum)
sprCount

unlist(sprCount)
sapply(spIns, sum)
ddply(InsectSprays,.(spray),summarize,sum=sum(count))

#Creating a new variable
spraySums = ddply(InsectSprays,.(spray),summarizr,sum=ave(count, FUN=sum))
dim(spraySums)

head(spraySums)
q