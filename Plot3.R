
# Collect data
source("powerdata.R")

# Print output file
png(filename="plot3.png",width=480,height=480,units="px")

# Plot 3:
linecol <- c('black','red','blue')
lbls <- c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$Sub_metering_1,type="l",col=linecol[1],
     xlab = "", ylab="Energy sub metering")
lines(power.consumption$DateTime,power.consumption$Sub_metering_2,col=linecol[2])
lines(power.consumption$DateTime,power.consumption$Sub_metering_3,col=linecol[3])

# add legend
legend("topright",legend=lbls,col=linecol,lty="solid")


plot3 <- dev.off()
