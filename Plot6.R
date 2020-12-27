#Read RDS data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data for Baltimore
Baltimore<- subset(NEI, fips=="24510")
#subset the data for Los Angeles
LA<- subset(NEI, fips=="06037")

# SCC subset with vehicle sources

vehiclesource<- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
subsetSCC<- SCC[vehiclesource, ]

#merge VehicleSource and Baltimore
SCC_Balt<- merge(Baltimore, subsetSCC, by="SCC")
SCC_Balt$city<- "Baltimore"

#merge VehicleSource and Los Angeles
SCC_LA<- merge(LA, subsetSCC, by="SCC")
SCC_LA$city<- "Los Angeles"
data6<- rbind(SCC_Balt, SCC_LA)
data6<- aggregate(Emissions~year + city, data6, sum)

library(ggplot2)
g<- ggplot(data6, aes(year, Emissions, color=city))
g+geom_line()+ xlab("Year") +ylab("Total Emission(ton)")+ ggtitle("Total Emissions of Vehicle Sources in LA and Baltimore")