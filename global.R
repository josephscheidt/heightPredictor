library(dplyr)

infURL <- "https://www.cdc.gov/growthcharts/data/zscore/zlenageinf.csv"
childURL <- "https://www.cdc.gov/growthcharts/data/zscore/zstatage.csv"

download.file(infURL, "inf.csv")
download.file(childURL, "child.csv")

infTable <- read.csv("inf.csv", stringsAsFactors = FALSE)
childTable <- read.csv("child.csv", stringsAsFactors = FALSE)

infTable <- infTable[-74,]

infTable$Sex <- factor(infTable$Sex, labels = c("Male", "Female"))
infTable$Agemos <- as.numeric(infTable$Agemos)

infTable <- mutate(infTable, sd = (X1 - X.1)/2, mean = X0) %>%
      rename(age = Agemos, sex = Sex) %>%
      select(sex, age, mean, sd)

childTable <- childTable[-(435:438),]

childTable$Sex <- factor(childTable$Sex, labels = c("Male", "Female"))
childTable$Agemos <- as.numeric(childTable$Agemos)

childTable <- mutate(childTable, sd = (X1 - X.1)/2, mean = X0) %>%
      rename(age = Agemos, sex = Sex) %>%
      select(sex, age, mean, sd)

