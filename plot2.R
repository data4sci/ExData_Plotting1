############################################
##                    plot2.R             ##
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
png ("plot2.png")
# open device 
plot(sub_data$Date.Time, sub_data$GAPkW, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# draw graph
dev.off()
# close device



