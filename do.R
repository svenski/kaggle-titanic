library(data.table)
library(Amelia)
source("load.R")

main <- function() {


  path <- "data"
  train.data.file <- "train.csv"
  test.data.file <- "test.csv"

  missing.types <- c("NA", "")

  train.column.types <- c('integer',   # PassengerId
                          'factor',    # Survived 
                          'factor',    # Pclass
                          'character', # Name
                          'factor',    # Sex
                          'numeric',   # Age
                          'integer',   # SibSp
                          'integer',   # Parch
                          'character', # Ticket
                          'numeric',   # Fare
                          'character', # Cabin
                          'factor'     # Embarked
                          )

  test.column.types <- train.column.types[-2]     # # no Survived column in test.csv

  train.raw <- read.csv(file.path(path, train.data.file),
                        colClasses = train.column.types,
                        na.strings = missing.types)

  test.raw <- read.csv(file.path(path, test.data.file),
                       colClasses = test.column.types,
                       na.strings = missing.types)

  train <- data.table(train.raw)
  test <- data.table(test.raw)

# Missing data
  missmap(train, main = "Missing data", col = c("yellow", "black"), legend = FALSE)




}
