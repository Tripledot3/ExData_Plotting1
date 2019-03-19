EPC <- read.table("Plots/household_power_consumption.txt", header =  TRUE, sep = ";",stringsAsFactors = FALSE, na.strings = "?")
# loading the data into R

EPC_plot <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
#Subetting the days that we want to use

datetime <- strptime(paste(EPC_plot$Date, EPC_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#defintely the answer

EPC_plot$Global_active_power <- as.numeric(EPC_plot$Global_active_power)
#changing the Global active power colunm in the data from the
#character class to the number class

par(mfrow = c(2,2))
# setting the layout

plot(datetime, EPC_plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(datetime, EPC_plot$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


plot(datetime, EPC_plot$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, EPC_plot$Sub_metering_2, type = "l", col = "red")
lines(datetime, EPC_plot$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, bty = "n", col = c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datetime, EPC_plot$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
