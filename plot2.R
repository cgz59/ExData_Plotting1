####Read data####
data_in <- read.csv("data/household_power_consumption.txt", header = T, sep = ";")
colnames(data_in)

####Subset data only the needed days####
sub_data <- subset(data_in,Date %in% c("1/2/2007","2/2/2007"))

####Create new datetime variable####
sub_data$DayTime <- strptime(paste(sub_data$Date,sub_data$Time),"%d/%m/%Y %H:%M:%S")

####Produce graph####
png(filename='plot2.png')
with(sub_data, plot(DayTime,as.numeric(as.character(Global_active_power)),type = 'l', ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
