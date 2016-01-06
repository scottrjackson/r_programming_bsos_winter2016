# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
# read.table (and varieties)
# read.spss (from "foreign" package)

scott <- read.csv("scottdata/CognitionPaperFinalData.csv")
# equivalent:
scott <- read.table("scottdata/CognitionPaperFinalData.csv", header = TRUE, sep = ",")

# 2. Peek at the top few rows
head(scott)
scott[1:6, ] # equivalent

# 3. Peek at the top few rows for only a few columns
head(scott[, 1:7])
scott[1:6, 1:7] # equivalent

# 4. How many rows does your data have?
nrow(scott)

# 5. Get a summary for every column
summary(scott)

# 6. Get a summary for one column
summary(scott$WithinMinPairs)

# 7. Are any of the columns giving you unexpected values?
#    - missing values? (NA)

# nope :-)

# 8. Select a few key columns, make a vector of the column names
some.columns <- c("System", "Merged", "WithinMinPairs")
colnames(scott)[c(2, 6, 9)] # another way to pull out a few column names

# 9. Create a new data.frame with just that subset of columns
#    from #8
#    - do this in at least TWO different ways
scott.subset <- scott[, some.columns]
scott.subset2 <- scott[, c("System", "Merged", "WithinMinPairs")]
library(dplyr)
scott.subset3 <- select(scott, System, Merged, WithinMinPairs)
identical(scott.subset, scott.subset2) # identical results!
identical(scott.subset, scott.subset3) # identical results!

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from #8
N <- nrow(scott.subset)
scott.subset4 <- scott.subset[c(1:10, 625:634), ] # "brute force"
scott.subset5 <- scott.subset[c(1:10, (N-9):N), ] # more elegant
identical(scott.subset4, scott.subset5)

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: try ?sample

scott.sample <- scott.subset[sample(N, N/2), ]
nrow(scott.sample)
rownames(scott.sample)

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it
var(scott$WithinMinPairs[scott$Merged == "Merged"])
var(scott$WithinMinPairs[scott$Merged == "Unmerged"]) # very different!
t.test(WithinMinPairs ~ Merged, data = scott, var.equal = FALSE)
t.test(scott$WithinMinPairs[scott$Merged == "Merged"], 
       scott$WithinMinPairs[scott$Merged == "Unmerged"], 
       var.equal = FALSE)

# 13. Repeat #12 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)


# 14. Save all results from #12 and #13 in an .RData file


# 15. Email me your version of this script, PLUS the .RData
#     file from #14
