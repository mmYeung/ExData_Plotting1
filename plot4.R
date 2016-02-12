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

sub_dat$Global_reactive_power <- as.numeric(sub_dat$Global_reactive_power)

sub_dat$Voltage <- as.numeric(sub_dat$Voltage)

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
with(sub_dat, plot(datetime, Global_active_power, type = "l", main = "",
                   xlab = "", ylab = "Global Active Power"))

with(sub_dat, plot(datetime,Sub_metering_1, type = "l", main = "", xlab = "",
                   ylab = "Energy sub metering"))
with(sub_dat, lines(datetime, Sub_metering_2, col = "red"))
with(sub_dat, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
       "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"),
       bty = "n")

with(sub_dat, plot(datetime, Voltage, type = "l", main = ""))

with(sub_dat, plot(datetime, Global_reactive_power, type = "l", main = ""))
dev.off()