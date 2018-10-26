####Read data####
data_in <- read.csv("data/household_power_consumption.txt", header = T, sep = ";")
colnames(data_in)

####Subset data only the needed days####
sub_data <- subset(data_in,Date %in% c("1/2/2007","2/2/2007"))

####Produce graph####
png(filename='plot1.png')
with(sub_data, hist(as.numeric(as.character(Global_active_power)), main='Global Active Power', xlab="Global Active Power (kilowatts)",col='red'))
dev.off()
