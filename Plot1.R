
# Collect data
source("powerdata.R")

# Print output file
png(filename="plot1.png",width=480,height=480,units="px")

# Plot 1:
hist(power.consumption$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")

plot1 <- dev.off()

