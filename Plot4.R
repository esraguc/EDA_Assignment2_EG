#Read RDS data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# SCC subset with coal combustion values
coalcomb <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
SCCsubset <- SCC[coalcomb, ]

# merge NEI and SCC coal subset
NEI_SCC <- merge(NEI, SCCsubset, by="SCC")

# summing emission data per year
totalEmission <- tapply(NEI_SCC$Emissions, NEI_SCC$year, sum)

# plotting
barplot(totalEmission, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Coal Source Total Emission")