#Quiz 2
setwd('/Users/knguyen1/Downloads')
acs = read.csv('ss06pid.csv')
sqldf("select pwgtp1 from acs where AGEP < 50")
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")

link = url('http://biostat.jhsph.edu/~jleek/contact.html')
htmlPage = readLines(link)
close(link)

link2 = url('http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for')
htmlPage2 = readLines(link2)
close(link2)