# Day 3 lecture

##############
# Review

#### Assignment

mydata <- read.csv("scottdata/CognitionPaperFinalData.csv")

myvector <- c("one", "two", "three")

#  <-  vs.  =
myvector = c("one", "two", "three")


#### Using functions
# functionname(arg1, arg2, ...)

#### Reading help files
?read.csv

#### Basic object types
# Vectors
# Matrices and arrays
# Lists
# Data frames

this.is.a.vector <- c(1, 2, 3)
this.is.another.vector <- c(1, 2, "pie")

# matrix is 2-D vector
# arrays are multi-dimensional

# lists are "grab-bag"
this.is.a.list <- list(1, 2, "pie")

x <- matrix(1:9, nrow = 3)
this.is.a.list <- list(1, 2, "pie", x)

class(x)
class(1)

this.is.a.list[4]
class(this.is.a.list[4])

this.is.a.list[[4]]
class(this.is.a.list[[4]])

# data frames are great!
# data frames are special lists
class(sleep)
length(sleep)
nrow(sleep)

#### Subsetting
myvector[2]
sleep[2] # this is not a vector (contents + structure)
sleep[[2]] # this is a vector (contents)
sleep[ , ] # two dimensions: ROWS, COLUMNS
# sleep[ , , , ] # four dimensions (won't work, because data frames are 2-D)
sleep[3, 1] # third row, first column
sleep[1, ] # first row, all columns
sleep[, 1] # first column, all rows
sleep[, "extra"] # referring by name is good
sleep[c(1, 2, 3), ]
sleep[, c("extra", "ID", "group")]

#### Reading and writing files


##############
# Data types
# - numeric
# - character
# - factor
# - logical
# - NA
# - NULL
# - others (e.g, "Date")


## Numeric
# - numbers!
#   - sometimes integers can differ from non-integers
# - `as.numeric()` forces it to be a number (not integers)
# - `1L` is an integer
# - have mean, medians
 
## Characters
# - `as.character()` converts to characters
# - more primitive than factors
# - can manipulate with regular expressions, other text functions


## Factors
# - Actually numbers under the hood
# - Act like numbers + labels
# - VERY useful for many kinds of analyses
# - if a column is a *property* of data (not a measure itself), factors are usually best
# - groupings = good as factors
# - conditions = good as factors
# - if a column is *data*, maybe consider keeping it a string
# - `as.factor()` coerces to a factor
# - `factor()` creates a factor
# - factors have *levels*: categories
# - `stringsAsFactors` : option for how to read in character vectors
# - = FALSE if you don't want to read in characters as factors
scott <- read.csv("scottdata/CognitionPaperFinalData.csv")
summary(scott$Merged)
levels(scott$Merged)
levels(scott$Merged) <- c("Unmerged", "Merged") # only changing the labels
levels(scott$Merged)
levels(scott$Merged) <- c("Merged", "Unmerged") # only changing the labels
scott$Merged <- factor(scott$Merged, levels = c("Unmerged", "Merged"))

## Logicals
# - TRUE and FALSE
# - if coerced to `as.numeric`, TRUE == 1, FALSE == 0
# - can take the mean of a logical vector
# - Shortcuts: T and F
# - *DANGER*: T and F can be overwritten
# - logical operators create logical vectors
# - `==`
# - `>`
# - `<`
# - `|`  This is the "long bar", meaning (inclusive) "or" (aka "pipe")
# - `&`  == "and"
# - `>=`  greater or equal
# - `!`  is NOT
# - `&&` and `||`  for more specific programming sitauations


## NA and NULL (and others)
# - `NA` mean "missing value" or "missing data"
# - `NULL` means "nothing", the absence of something
# - `Inf` and `-Inf`
# - `NaN`
 
## Handling NAs
# - can be a a huge pain
# - sometimes `na.rm = TRUE` (like for `mean()`)

x <- c(1, 2, NA, 4, 68)
mean(x)
mean(x, na.rm = TRUE)

# - sometimes it's other stuff
# - cor() use = "pairwise.complete.obs"
# - no universal "deal with NAs" argument


## Some "gotchas" with NAs

x <- c(1, 2, NA, 5)
x > 3

x == NA
is.na(x)
# ?is.null


## More subsetting
sleep
sleep[sleep$group == 1, ]
sleep$group == 1
sleep[which(sleep$group == 1), ]
which(sleep$group == 1)
sleep[sleep$group == 1 & sleep$extra > 0, ]
sleep[sleep$group == 1 | sleep$extra > 0, ]
# "where"
sleep[!sleep$group == 1, ]

sleep[sleep$ID == c(1, 3, 4, 6), ]  # DOESN'T WORK
sleep[sleep$ID %in% c(1, 3, 4, 6), ]
sleep$ID %in% c(1, 3, 4, 6)
sleep[!sleep$ID %in% c(1, 3, 4, 6), ]  # "not in"

