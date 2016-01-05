# 1. Run a t-test with the sleep data set
#   a. save the values as objects/variables first,
#      then supply as arguments to t.test()
#   b. try skipping that step and referring to the values directly

x <- sleep$extra[1:10]
x <- sleep$extra[sleep$group == "1"]
y <- sleep$extra[11:20]
y <- sleep$extra[sleep$group == "2"]

t.test(x, y)

t.test(sleep$extra[1:10], sleep$extra[11:20])
my.results <- t.test(extra ~ group, data = sleep)



# logical operators <, >, ==, >=, <= 


# 2. Do the same thing with the "iris" data set
#    - compare sepal width
#    - all three pairwise comparisons


t.test(iris$Sepal.Width[iris$Species == "setosa"],
       iris$Sepal.Width[iris$Species == "virginica"])
       

# 3. Do the same (run a t-test) thing again on "women" data
#    - compare the two columns
#    - (yes, this doesn't make much sense as a comparison,
#      it's just a programming exercise)


# 4. Re-do "sleep" t-test (#1 above) as paired
t.test(extra ~ group, data = sleep, paired = TRUE)


# 5. Run a true "Student's" t.test for #1
t.test(extra ~ group, data = sleep, var.equal = TRUE)

# 6. Try the "formula" method for t.test()
#    a. Read the help
#    b. Look at the "formula" argument
#    c. Try to use that to replicate the results from #1 above


# 7. Run a Wilcoxon Signed Rank test for the comparisons
#    in #1 through #3
#    - use help.search to find a function to do this


# 8. Run a correlation test on the "women" data
#    a. Pearson
#    b. Spearman


# 9. save all results (and only those results!) in an
#    .RData object
#    - try to think of (at least) two ways to do this


# 10. clean, comment, and save this script with your answers


# 11. Look at the format of your Homework data set
#     - find a function to read in your data
#     - needed for tonight's Homework
