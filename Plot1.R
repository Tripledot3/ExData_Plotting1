EPC <- read.table("Plots/household_power_consumption.txt", header =  TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = "?")
# loading the dataset into R

EPC_NA <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
#Subetting the days that we want to use


EPC_NA$Date <- as.Date(EPC_NA$Date)
#changing the Date colunm in the data from the character class to the Date class

EPC$Global_active_power <- as.numeric(EPC$Global_active_power)
#changing the Global active power colunm in the data from the character class to the number class

hist(EPC_NA$Global_active_power, col = "red", xlab ="Global Active Power (kilowatts)", main = "Global Active Power")
#ploting the histogram

dev.copy(png, file = "plot1.png")
#copying the plot to a png file

dev.off()
#closing the png file
