file_path <- "household_power_consumption.txt"
dat <- read.table(file_path, header=TRUE, sep=";",
                  stringsAsFactors=FALSE, dec=".")

sub_dat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

sub_dat$Global_active_power<-as.numeric(sub_dat$Global_active_power)

sub_dat$datetime <- strptime(paste(sub_dat$Date, sub_dat$Time, sep=" "),
                             "%d/%m/%Y %H:%M:%S")

sub_dat$Sub_metering_1 <- as.numeric(sub_dat$Sub_metering_1)

sub_dat$Sub_metering_2 <- as.numeric(sub_dat$Sub_metering_2)

sub_dat$Sub_metering_3 <- as.numeric(sub_dat$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
with(sub_dat, plot(datetime,Sub_metering_1, type = "l", main = "", xlab = "",
                   ylab = "Energy sub metering"))
with(sub_dat, lines(datetime, Sub_metering_2, col = "red"))
with(sub_dat, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
       "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()