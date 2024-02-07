## Obtain the datasets
download.file ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","Data.zip")
library(data.table)
library (dplyr)

## Unzip the dataset 
zipfilepath <- "\\.Data.zip"
extracted_dir <- "\\.Data"
if (!dir.exists(extracted_dir)) {
        dir.create(extracted_dir)
}
unzip(zipfilepath, exdir = extracted_dir)

## Read the data files into R
hpc_data <- read.table(".\\Data\\household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?")

## Amend class of date time columns and reduce to only relevant rows
hpc_data <- tbl_df(hpc_data)
hpc_data <- hpc_data %>% 
        mutate (Date = as.Date(Date, "%d/%m/%Y")) %>% 
        filter (Date == "2007-02-01" | Date == "2007-02-02")
hpc_data$Time <- format(strptime(hpc_data$Time, format ="%H:%M:%S"), format = "%H:%M:%S")