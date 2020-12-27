#Read RDS data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data for Baltimore
Baltimore<- subset(NEI, fips==24510)
data3<- aggregate(Emissions~year + type, Baltimore, sum)
#ggplot
library(ggplot2)
g<- ggplot(data3, aes(x=year, y=Emissions, color=type)) 
g+geom_line()+geom_point()+xlab("Year")+ ylab("Total Emissions(ton)")+ ggtitle("Total Emissions per Year in Baltimore")

