file_path <- "household_power_consumption.txt"
dat <- read.table(file_path, header=TRUE, sep=";",
                  stringsAsFactors=FALSE, dec=".")

sub_dat <- dat[dat$Date %in% c("1/2/2007","2/2/2007") ,]

sub_dat$Global_active_power<-as.numeric(sub_dat$Global_active_power)

png("plot1.png", width = 480, height = 480)
with(sub_dat, hist(Global_active_power, freq = TRUE, col = "red", 
                   main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)"))
dev.off()