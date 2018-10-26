####Read data####
data_in <- read.csv("data/household_power_consumption.txt", header = T, sep = ";")
colnames(data_in)

####Subset data only the needed days####
sub_data <- subset(data_in,Date %in% c("1/2/2007","2/2/2007"))

####Create new datetime variable####
sub_data$DayTime <- strptime(paste(sub_data$Date,sub_data$Time),"%d/%m/%Y %H:%M:%S")

####Produce graph####
png(filename='plot3.png')
with(sub_data, plot(DayTime,as.numeric(as.character(Sub_metering_1)),type = 'l', ylab="Energy sub metering", xlab=""))
with(sub_data, lines(DayTime,as.numeric(as.character(Sub_metering_2)),col='red'))
with(sub_data, lines(DayTime,as.numeric(as.character(Sub_metering_3)),col='blue'))
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),cex=0.75)
dev.off()
