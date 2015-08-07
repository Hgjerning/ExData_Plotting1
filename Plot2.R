
# Collect data
source("powerdata.R")

# Print output file
png(filename="plot2.png",width=480,height=480,units="px")

# Plot 2:
plot(power.consumption$DateTime, power.consumption$Global_active_power,xlab = "", ylab="Global Active Power (kilowatts)", type="l")


plot2 <- dev.off()
