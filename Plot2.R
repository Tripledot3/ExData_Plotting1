EPC <- read.table("Plots/household_power_consumption.txt", header =  TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = "?")
# loading the data into R

EPC_plot <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
#Subetting the days that we want to use

datetime <- strptime(paste(EPC_plot$Date, EPC_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#defintely the answer

EPC_plot$Global_active_power <- as.numeric(EPC_plot$Global_active_power)
#changing the Global active power colunm in the data from the
#character class to the number class

plot(datetime, EPC_plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# creates Plot

dev.copy(png, file = "plot2.png")

dev.off()