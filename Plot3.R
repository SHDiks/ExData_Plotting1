# importing data and formatting columns correctly
df <- read.table("./household_power_consumption.txt", sep = ";", header = T)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))

# subsetting data from 2007-02-01 and 2007-02-02
dfs <- subset(df, Date == "2007-02-01")
dfs <- rbind(dfs, subset(df, Date == "2007-02-02"))
dfs$newdate <- with(dfs, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# generating plot
png(filename = "plot3.png", width = 480, height = 480)
plot(dfs$newdate, dfs$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(dfs$newdate, dfs$Sub_metering_1, type = "l", col = "black", lty = 1)
lines(dfs$newdate, dfs$Sub_metering_2, type = "l", col = "red", lty = 1)
lines(dfs$newdate, dfs$Sub_metering_3, type = "l", col = "blue", lty = 1)
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

