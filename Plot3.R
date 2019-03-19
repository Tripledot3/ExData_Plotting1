EPC <- read.table("Plots/household_power_consumption.txt", header =  TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = "?")
# loading the data into R

EPC_plot <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
#Subetting the days that we want to use

datetime <- strptime(paste(EPC_plot$Date, EPC_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#defintely the answer

EPC_plot$Global_active_power <- as.numeric(EPC_plot$Global_active_power)
#changing the Global active power colunm in the data from the character class to the number class

plot(datetime, EPC_plot$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, EPC_plot$Sub_metering_2, type = "l", col = "red")
lines(datetime, EPC_plot$Sub_metering_3, type = "l", col = "blue")
# creating a plot with two other line points

legend("topright", lty=1, lwd=2.5, col = c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# creating a legend that displays information in the plotted graph

dev.copy(png, file = "plot3.png")
#copying the plot to a png file

dev.off()
#closing the png file
