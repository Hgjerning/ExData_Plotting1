
# Collect data
source("powerdata.R")

# Print output file
png(filename="plot4.png",width=480,height=480,units="px")

# Plot 4:
par(mfrow=c(2,2))


# Plot 1:
plot(power.consumption$Global_active_power,
     ,xlab = "", ylab="Global Active Power", type = "l")

# Plot 2:
plot(power.consumption$DateTime, power.consumption$Voltage,
     xlab = "datetime", ylab="Voltage", type="l")


# Plot 3:
linecol <- c("black","red","blue")
lbls <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot(power.consumption$DateTime,power.consumption$Sub_metering_1,type="l",col=linecol[1],
     xlab = "", ylab="Energy sub metering")
lines(power.consumption$DateTime,power.consumption$Sub_metering_2,col=linecol[2])
lines(power.consumption$DateTime,power.consumption$Sub_metering_3,col=linecol[3])



# plot 4:
plot(power.consumption$DateTime,power.consumption$Global_reactive_power,
     xlab="datetime",ylab="Global_reactive_power",type="l")


plot4 <- dev.off()
