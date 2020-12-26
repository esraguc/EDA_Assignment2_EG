NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Emissions<- tapply (NEI$Emissions, NEI$year, sum)
barplot(Emissions, xlab="Year", ylab="Total Emission(ton)", main="Total Emission")