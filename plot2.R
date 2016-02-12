file_path <- "household_power_consumption.txt"
dat <- read.table(file_path, header=TRUE, sep=";",
                  stringsAsFactors=FALSE, dec=".")

sub_dat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

sub_dat$Global_active_power<-as.numeric(sub_dat$Global_active_power)

sub_dat$datetime <- strptime(paste(sub_dat$Date, sub_dat$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
with(sub_dat, plot(datetime, Global_active_power, type = "l", main = "",
                   xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()