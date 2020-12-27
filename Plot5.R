#Read RDS data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data for Baltimore
Baltimore<- subset(NEI, fips==24510)

# SCC subset with vehicle sources

vehiclesource<- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
subsetSCC<- SCC[vehiclesource, ]

#merge VehicleSource and Baltimore
SCC_Balt<- merge(Baltimore, subsetSCC, by="SCC")

totalEmission<- tapply(SCC_Balt$Emissions, SCC_Balt$year, sum)
barplot(totalEmission, xlab="Year", ylab="Total Emission(ton)", main = "Total Emission of Vehicle Sources in Baltimore")

