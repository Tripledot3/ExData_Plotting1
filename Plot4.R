EPC <- read.table("Plots/household_power_consumption.txt", header =  TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = "?")
# loading the data into R

EPC_plot <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
#Subetting the days that we want to use

datetime <- strptime(paste(EPC_plot$Date, EPC_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#converting the dataframe to a date in the format that we want to use

EPC_plot$Global_active_power <- as.numeric(EPC_plot$Global_active_power)
#changing the Global active power colunm in the data from the character class to the number class

par(mfrow = c(2,2))
# setting the layout/position that the plots will be in

plot(datetime, EPC_plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#ploting the first plot
plot(datetime, EPC_plot$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#ploting the second plot

plot(datetime, EPC_plot$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, EPC_plot$Sub_metering_2, type = "l", col = "red")
lines(datetime, EPC_plot$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, bty = "n", col = c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#ploting the third plot with the 2 other points and a legend

plot(datetime, EPC_plot$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
#plotting the fourth plot

dev.copy(png, file = "plot4.png")
#copying the plot to a png file

dev.off()
#closing the png file
