# importing data and formatting columns correctly
df <- read.table("./household_power_consumption.txt", sep = ";", header = T)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

# subsetting data from 2007-02-01 and 2007-02-02dfs <- subset(df, Date == "2007-02-01")
dfs <- rbind(dfs, subset(df, Date == "2007-02-02"))
dfs$newdate <- with(dfs, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# generating plot
png(filename = "plot2.png", width = 480, height = 480)
plot(dfs$newdate, dfs$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
