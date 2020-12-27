#Read RDS data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Total Emission per year
Emissions<- tapply (NEI$Emissions, NEI$year, sum)
# Plot the graph
barplot(Emissions, xlab="Year", ylab="Total Emission(ton)", main="Total Emission")
