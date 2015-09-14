############################################ 
##                    plot4.R             ## 
## https://class.coursera.org/exdata-032/ ## 
############################################

 

el_data <- read.csv("household_power_consumption.txt", header = T, sep = ";") 
# read data  
el_data$Date <- as.Date(el_data$Date, "%d/%m/%Y") 
# transform format of col Data  
sub_data <- el_data[el_data$Date > as.Date("2007-01-31") & el_data$Date < as.Date("2007-02-03"), ] 
# subset (filter) Feb 1st and 2nd 2007 
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power) 
# transform format of G.a.p. col 
sub_data$Date.Time <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S") 
# create Date.Time col

sub_data$GAPkW <- as.numeric(sub_data$Global_active_power) / 1000  
# create GAPkW col 

 

png ("plot4.png") 
# open device 

par(mfrow = c(2, 2)) 
# matrix 2x2


plot(sub_data$Date.Time, sub_data$GAPkW, type = "l", xlab = "", ylab = "Global Active Power") 
# draw 1st graph

plot(sub_data$Date.Time, sub_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage") 
# draw 2nd graph

plot(sub_data$Date.Time, sub_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
lines(sub_data$Date.Time, sub_data$Sub_metering_2, type = "l", col = "red") 
lines(sub_data$Date.Time, sub_data$Sub_metering_3, type = "l", col = "blue") 
legend("topright", lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
# draw 3th graph

plot(sub_data$Date.Time, sub_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power") 
# draw 4th graph

dev.off() 
# close device 