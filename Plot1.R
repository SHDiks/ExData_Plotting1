# importing data and formatting columns correctly
df <- read.table("./household_power_consumption.txt", sep = ";", header = T)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))

# subsetting data from 2007-02-01 and 2007-02-02
dfs <- subset(df, Date == "2007-02-01")
dfs <- rbind(dfs, subset(df, Date == "2007-02-02"))

# generating plot
png(filename = "plot1.png", width = 480, height = 480)
hist(dfs$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
