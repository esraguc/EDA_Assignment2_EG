#Read RDS data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data for Baltimore
Baltimore<- subset(NEI, fips==24510)
#total Emission per year in Baltimore
totalEmission<- tapply(Baltimore$Emissions, Baltimore$year, sum)
#Plot the graph
barplot(totalEmission, xlab = "Year", ylab = "Total Emission(ton)", main="Total Emission per Year in Baltimore")

