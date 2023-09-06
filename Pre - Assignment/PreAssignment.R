### Pre-Assignment Exercise:
### 
### This is intended as a guide to get you started with R.
### R is a wonderful tool but there is a learning curve.
### It is the standard for Data Analytics in the industry (Google, Microsoft,etc) and research
### It is freeware and has the most current software capabilities 
### (any other commercial package lies years behind it)
### 
### We will guide you through what every command line is doing. 
### That will allow you to create your own scripts.
### Anything written after #, the R software interprepts it as a comment (so does not try to execute anything)
### you can see that all my explanations are preceded by X (I use ### just to make it more obvious)
### 
### Although Excel is great to "see" what is happening with every entry of your data 
### (i.e. every cell in the spreadsheet)
### the calculations required for data science are very intricate and the internal 
### steps are intricate and uninsightful.
###
### R allow us to "call" a routine (similar in spirit to click) and get the 
### response without having to select cells, etc.
### Additionally, R has the routines done for us to use. 
###
### We will work through some basics of R.
### The first part introduces how to make basic operations, discuss different types of data,
### and how to manipulate vectors and matrices.
### The second part takes a data set to illustrate how to open the data, plot different graphs, and
### to run a linear regression.
###
### Part I:
###
### At its most basic level R is just a fancy calculator (e.g., *,/,+,-)
### Everything is based on assigning names.
### The symbol "<-" (assign) works as "=" 
x <- 2
### this creates a (numeric) variable x and assign 2 to it. 
### we can see the value stored in x by typing x
x
### note that R is case sensitive so that X will not give you the same value.
### As mentioned R is a calculator. Thus assigning a variable named "testvar" the value 4+12 can be done as
testvar <- 4+12
### testvar stored the value 4+12=16. 
### To inspect a variable just type the name of it
testvar
### making calculations is easy. Square root is the command sqrt
sqrt(testvar)
### For "help". When in doubt about a command type ? before the command (e.g. ?sqrt)
### An explanation will be displayed (if the command is recognized by R)
?sqrt
### the explanation should appear in the right bottom window of R-Studio.
###
### ??sqrt will search the R libraries for some help on similar names.
??sqrt
### again the explanation should appear in the right bottom window of R-Studio.
###
#### More often than not you will work with a vector or matrix.
####
#### Lets start with creating vectors which are a collection of objects (for example a collection of numbers)
testvector <- c(10,3,5,6,8)
### each number is a component of the vector.
### this created a vector with 5 components (equivalent to a single row with 5 columns)
### R allows us to use functions that use the whole vector as input.
### The mean of the components of this vector is
mean(testvector)
### the standard deviation
sd(testvector)
### we can ask for a summary of it (which tells you some statistics)
summary(testvector)
### As we will see later, the "summary" command adapts 
### to the type of data you have. Here we had a list of numbers.
###
### It is very easy to apply a transformation for each component of a vector
### for instance, to square each component just write
testvector^2
### to multiply by 5 and add 7 to each component just write 
5*testvector+7
### if I have 2 vectors of the same length 
vec1 <- c(8, 5.6, 9, 10.1) 
vec2 <- c(7, 9, 11, 34) 
### I can add each corresponding component 
vec1 + vec2
### I can multiply each corresponding component and add 5  
(vec1 * vec2) + 5
###
### To print the value of its 3rd component simply write testvector[3]
testvector[3]
### We can change just the second component to zero:
testvector[2] <- 0
testvector
###
### R allows you to easily combine, append, filter these vectors. There are multiple ways of doing it.
### To append two vectors with the command c() we can
vector <- c (testvector, testvector)
vector
###
#### We can apply operations to each component of the vector directly.
#### For instance to see if each component is above 7 we write
ComponentAboveSeven <- testvector > 7
#### this creates a vector which has "TRUE" or "FALSE" 
#### if the corresponding component of testvector is above 7 or not.
### We can print this new vector
ComponentAboveSeven
### Such "TRUE" and "FALSE" vectors can be used to select subcomponents of the original vector
### if I want a new vector only with the component above 7 in testvector we write
NewVector <- testvector[ ComponentAboveSeven ]
### and print it to see
NewVector
### those are the values that are above 7
###
### Another possibility to select subcomponents is to explicitly tell which column numbers you want.
### Since 1 and 5 were the component, we could have selected those as follows:
Indices <- c(1,5)
AnotherNewVector <-  testvector[Indices]
AnotherNewVector
### selecting a subset of components is a very common operation when we are 
### handling data. 
###
### Now lets briefly discuss a Matrix in R
### a matrix is just a rectangular table of numbers. Many data sets come in this format 
### One way construct a matrix is to concatenate vectors and tell how many rows and how many columns
v1 <- testvector
v2 <- sqrt(testvector)
v3 <- 4 + 2*testvector
examplematrix <- matrix(data = c(v1, v2, v3 ), ncol=3, nrow=5)
examplematrix
### count how many rows and columns
nrow(examplematrix)
ncol(examplematrix)
### You can transpose the matrix with the command t()
t(examplematrix)
### matrix multiplication is %*% 
###
### 
### We can create a sequence of numbers with different commands
### for exemple to create a vector with zeros in all 10 components we can use
x0 <- c(0,0,0,0,0,0,0,0,0,0)
### or
x0 <- rep(0,times=10)
### to create a sequence 1,2,3,4,5,6,7,8,9,10
xa <- 1:10
xb <- seq.int(from=1, to=10, by=1) 
xc <- c(1,2,3,4,5,6,7,8,9,10)
### xa, xb, and xc have the same vector with 1,2,3,4,5,6,7,8,9,10
### if I want to know what is the length of the vector (how many elements on it)
length(xa)
### we can square a vector
ya <- xa^2
ya
### and easily plot them in R
plot (xa, ya)
### play with the labels
plot (xa, ya, xlab = "X label", ylab = "Y label", col="blue", main="Plot Example")
### after a plot is created, if you want to add other points to the same plot
### you should use "points" or "lines" instead of plot 
points(xa, 10*sqrt(xa),col="red")
### if you would like lines
lines(xa, 10*sqrt(xa),col="red")
### 10*sqrt(xa) creates a vector where 
### each component is 10 times the square-root of the corresponding component in xa
###
### Note that there are many possible ways to change the plot with different options
### We will cover different functions throughout the course in due time. 
###
### There are different types of variables: numeric, logical, strings, and others
### This creates a vector of numbers 
xNumeric <- c(3,3.141592,7,9)
### this creates a vector of logical (true or false) variables
xLogical <- c(TRUE,FALSE,TRUE,TRUE)
### and here is an example of creating a vector of Characters
xCharacters <- c("fuqua","data mining","analytics","fuqua")
### R also allows you to mix them 
xMixed <- c(3,TRUE,1,"Regression")
### but it will convert everything to Characters 
### 
### The command summary() will work a bit different depending of the type of object (numeric, logical, or others)
### for numeric summary gives summary statistics like minimum value, maximum value, median, etc
summary(xNumeric)
### for logical it gives the number of TRUE, the number of FALSE, and the number of NA's
### NA stands for 'Not available' or missing values. This is type appears when we are cleaning up the data.
summary(xLogical)
### note that if you have a missing value you should not use them in some calculations, R can easily do that as we will see later
### for string it tells you how many elements and informs you it is character
summary(xCharacters)
### 
### Note that 
xNumeric[1]
### is a number equals to 3, but
xMixed[1]
### is a character "3". So that we can add 1 to xNumeric[1] but not to xMixed[1]
xNumeric[1]+1
xMixed[1]+1
### the last command should give you an error "non-numeric argument"
###
### However we can easily convert different types. 
### as.numeric() will convert to a number (and then add 1 to it)
as.numeric(xMixed[1])+1
### we can convert the whole vector xNumeric to character
as.character(xNumeric)
### the function as() allows you to convert between many types. 
### This is important as some functions require specific data format as input (which require us to convert them before calling the function)
### The functino str() (str stands for structure) tells you which type a particular variable is
str(xNumeric)
str(xLogical)
str(xCharacters)
###
### R is very convenient since it easily handles non-numeric data as well.
### Lets create a vector of colors
vector_colors <- c("blue","red", "white", "blue", "green","red", "red","blue","blue", "blue","white")
### Right now it is treated as text, so the description is not much informative
summary(vector_colors)
### The next command will treat it as categorical data (that is what factors are)
factor_colors <-factor(vector_colors)
### now R recognize them as types and not characters. 
### The description that summary provides is a bit more informative
summary(factor_colors)
### R automatically deals with factors very well and allows immediate graphical output
plot(factor_colors)
### of course we can make it a bit more colorful
plot(factor_colors, xlab="Colors", ylab="Frequency", main="Use of Colors", col=levels(factor_colors))
### in the last parameter "col" we passed a vector of colors so each level of the factor gets a different color  
###
###
###
### "Dataframe" are the workhorse type in R, 
### they are used to hold data sets and are used as the input of many functions. 
### They are similar to matrices but could have non-numeric entries. 
### Think about a data frame as a retacgular excel spreadsheet:
### each column can be of different type (one column can be numeric, other column logical, other character)
### each row is associated with an observation and has values for each column
### lets create a data frame from our previous objects
df <- data.frame(xNumeric, xLogical, xCharacters)
### lets see its summary
summary(df)
### we can get the names of each column with
names(df)
### we can get the element in the third row and second column
df[3,2]
### we can get all the first column
df[,1]
### we can get all the third row
df[3,]
### We can get the columns also by their name using $
df$xNumeric
### a very useful command is "which(...)" it gives you the indices of a vector 
### with a particular property
### for example
which(df$xNumeric > 5)
### return the indices of the vector df$xNumeric whose entries are above 5
### in this case df$xNumeric = ( 3, 3.141592, 7, 9) has 4 components and components 3 and 4 are the ones.
###
### Note that you can always create a copy of any variable with a different name
dftest <- df
### so you can manipulate dftest and keep df safe
### to select first and secon columns
df[,1:2]
### omit the second column
df[,-2]
## we can also use column names, for that
df[, names(df) %in% c("xNumeric","xCharacters" ) ]
df[, !( names(df) %in% c("xLogical") )]
### note the use of "!" to drop instead of keep the columns.


### Part II
### 
### Read Data, histogram, plot Scatter plot, compute mean, correlation, variance, median, run regression,
### We start with data now 
###
### IMPORTANT: you need to make sure you are in the correct working directory.
### It's good practice to create folders just for this.
### Use cmd-D (Mac), File <- ChangeDir (Windows)
### or just type:
### setwd('/path/to/my/working/dir')
### where  /path/to/my/working/dir is the directory you want.
### Another way:
### If you are using the recommended R-stuio interface,
### Menu "Session->Set Working Directory->Choose Directory"
### Another way:
### If you are using the recommended R-stuio interface you should click the 
### "Files" tab in the lower right subwindow. Change the folder and 
### the "More" subtab and then click in "Set as Working Directory"
###
### The data set has demand for orange juice. The name of the file is "oj.csv"
### The format of the file is "csv" (comma separated values) and you can also open it in Excel
### As most data sets it is just a big matrix with column names
### very similar to Excel but the spreadsheet is "hidden" in the variable that stores it.
### Read in the data

getwd() # this will print your working directory
### if this is not the directory where you placed the data 
### you will get an error in the following line

### Lets read the data which is in csv format. (R can read all sorts of data format)
oj <- read.csv("oj_PreAssignment.csv") 
### oj is a "Dataframe". It is a database table-style data in R. 
### (Just a way to efficiently organize data)
### This data has 5 columns 
### store: identifier of store
### brand: one of 3 types of oj
### week: identifier for week
### logmove: this is log of sales
### price: price information for that week
###
### If you ask the summary of this data you get some information for each column
summary(oj)
###
### since oj is a data frame we can get the column names by
names(oj)
### We will first focus on price.
### You can compute the mean and variance of price by
mean(oj$price)
var(oj$price)
#### So by using "$" followed by the name of the column you can go to that column
### Plots and histograms are very easy in R. 
### To see the distribution of price we can plot its histogram by
hist(oj$price, ylab = "Count")
### Very simple but this does not look too pretty. Let just change the labels
hist(oj$price, xlab = "Price of OJ", ylab="Relative Frequency", col="blue", freq=FALSE, main="Histogram of Price of OJ")
### freq=FALSE means plot relative frequncy, not count
### xlab: allows you to change the label in the horizontal axis
### ylab: allows you to change the label in the verticla axis
### main: allows you to change the title
### (note that after you create the graph with the data analysis 
### you can export it to any other software to add bells and whistles)
###
### The histogram uses bins. If we want we can also plot the 
### density function on top. (Remember, lines is needed to use the same plot)
lines(density(oj$price),type="l",col="darkred", lwd=2)
### if you wanted a plot for the continuous density only simply use
plot(density(oj$price),type="l",col="darkred", lwd=2, ylab="Density", xlab="Price of OJ")
###
### We can also break down information of price by brand.
### For example, we can compute average price for each brand
aggregate(price ~ brand, data = oj, mean )
### always good to visualize it
### convenient to store the previous information
mean_price <- aggregate(price ~ brand, data = oj, mean )
### mean_price has two columns: column 1 are brand types, column 2 are mean prices
### R creates a bar plot with that information
barplot(mean_price[,2])
### We can add the names of the different categories
barplot(mean_price[,2], names.arg = mean_price[,1])
### We can make also horizontal bar plots
barplot(mean_price[,2], names.arg = mean_price[,1], horiz = TRUE)
### if one label vanished, it happen for lack of space.
### One can just streach the picture to create space  
### or diminish the font for those labels via cex.names=0.5 (you can make smaller or larger)
barplot(mean_price[,2], names.arg = mean_price[,1], horiz = TRUE, cex.names=0.5)
###
### Bar chart are very easy to communicate (but has only mean) 
### and Histograms have all the information but are too complicated.
### 
### A good compromise is the boxplot. It is still simple but more informative
boxplot(oj$price, main = "Price of OJ", ylab="dollars")
### it gives you the median, interquartile range and potentially outliers (beyind the whiskers)
### we can make it horizontal
boxplot(oj$price, main = "Price of OJ", horizontal = TRUE, xlab="dollars")
### Since the brand is already factors, we can easily break down by  brand
boxplot(oj$price ~ oj$brand , main = "Price of OJ", horizontal = TRUE, xlab="dollars")
### Although not standard, personally, I like to add the mean to the box plot
points(mean_price[,2],mean_price[,1],  pch = 22, col = "darkgrey", lwd = 7)
### If the box plot was vertical
boxplot(oj$price ~ oj$brand , main = "Price of OJ",  xlab="dollars")
points(mean_price[,1],mean_price[,2],  pch = 22, col = "darkgrey", lwd = 7)
### We see the mean above the median for Dominicks and Minute Maid 
### while the mean is below the median for Tropicana
###
### Lets compute the correlation between price and logmove
cor(oj$price,oj$logmove)
### Negative correlation between price and log of sales... it does make sense.
### Lets plot it
plot(oj$logmove,oj$price)
### We can easily have log of prices instead
plot(oj$logmove,log(oj$price))
### To make a little bit more informative, lets separate per brand.
### create some colors for the brands. We will associate each brand
levels(oj$brand)
### to a color 
brandcol <- c("green","red","gold")
### brandcol is a vector of columns containing the colors
### we will associate the first color ("green") with the first type of brand ("dominicks")
### second color ("red") with second type ("minute.maid"), third color ("gold") with third type ("tropicana")
### Next we will plot the scatter plot of logmove versus log(price)
### but coloring following the brand
plot(log(oj$price),oj$logmove, col=brandcol[oj$brand])

### An identical plot is produced by the following:
plot(logmove ~ log(price), data=oj, col=brandcol[brand])
### logmove ~ log(price) : represents Y ~ X   (regression notation that we will use below)
### data=oj : tells R that all variables are from the data oj. So you do not need  to write oj$
### col=brandcol[brand] : is what informed about the color scheme
###

### Next we will run a regression with R.  
### simple regression of log demand on log price
reg <- glm(logmove ~ log(price), data=oj)
### reg contains all the model (from it contains more than coefficietns)
## use the fitted model
summary(reg) ## provides coefficients, standard errors, p-values, fit of the model
coef(reg) ## just coefficients
### we can use to make predictions, 
### for example to predict the first observatio oj[1,] we write
predict( reg, newdata = oj[1,])
### this corresponds to the fitted line
### to get the first 10 observations recall that oj[1:10,] contains the 
### first ten rows of data
### then simply ask for
ToPredic <- oj[1:10,]
predict( reg, newdata = ToPredic)
### if we want also the standard error of the predictions, just write
predict( reg, newdata = ToPredic,se.fit = TRUE)
### we could use the standard errors to compute prediction intervals
### but it is conveniet to get prediction intervals directly
### just
predict.lm(reg, newdata=ToPredic, interval="confidence", level = 0.95)
### keep in mind we can always store them
predictionIntervals <- predict.lm(reg, newdata=ToPredic, interval="confidence", level = 0.95)
### so to get the upper level of the predictions just ask for
predictionIntervals[,3]
###
### lets predict the first 100 
ToPredic <- oj[1:100,]
predictionIntervals <- predict.lm(reg, newdata=ToPredic, interval="confidence", level = 0.95)
### we can plot the mean prediction
plot(log(ToPredic$price),predictionIntervals[,1], xlab="log(Price)", ylab="log of sales")
### and also the bands
lines(log(ToPredic$price),predictionIntervals[,3])
lines(log(ToPredic$price),predictionIntervals[,2])
###
### Next lest another linear regression model 
### that explains logmove using log(price) and dummy variables for the brand
### we have 3 types of OJ, so it will create 2 dummies
### R recognize that brand is a factor with 3 levels and creates dummies automatically
reg_brand = glm(logmove ~ log(price) + brand, data=oj)
###
### we can see the summary of this model
summary(reg_brand) ## tells you all about the fitted model (coef, tests, fit, etc
coef(reg_brand) ## return just the coefficients as a vector
summary(reg_brand)$coef ## returns a matrix with 4 columns
summary(reg_brand)$coef[,1] ## first column the coefficients
summary(reg_brand)$coef[,2] ## second column the standard error
summary(reg_brand)$coef[,3] ## third column the t-value
summary(reg_brand)$coef[,4] ## fourth column the p-values
### we can get all the coefficients that are above 1 
which( summary(reg_brand)$coef[,1] > 1 )
### we can also get all the indices for which p-values are smaller than .05
which( summary(reg_brand)$coef[,4] < 0.05 )
### in this case all of them

### Lets try to visualize them nicely. 
### To do that let me illustrate how to install packages
### One big advantage of R is that many people develop statstical and graphical functions for the whole community.
### All one needs to do is to import/load the corresponding package that contains the desired function
### A file "installpackages.R" contains a simple command that allows you 
### to install packages more easily. First lets load that file
source("DataAnalyticsFunctions.R")
### this loads the function "installpkg" (if you open this script it has the function)
### then to use a package (named for example "coefplot" for help up visualize coefficinets)
### just write the two commands below
installpkg("coefplot")
library(coefplot)
### the first checks if the package was already installed 
### for you to avoid reinstallations and the second loads into the memory
### Now that we installed/loaded the library, we can call
coefplot(reg_brand, intercept = FALSE, outerCI = 1.96, lwdOuter=1.5, xlab ="Coefficient Value and 95% Confidence Interval")
### the width of the intervals are small and no coefficient crosses zero (dashed vertical line)
### we could have plotted with the coefficient of the intercept as well
coefplot(reg_brand, intercept = TRUE, outerCI = 1.96, lwdOuter=1.5, xlab ="Coefficient Value and 95% Confidence Interval")
###

### In addition to the coefficients it is convenient to see how the models compare visually
plot( oj$logmove, fitted(reg), col="red", ylab ="Fitted Values", xlab ="Values")
points( oj$logmove, fitted(reg_brand), col="blue", ylab ="Fitted Values", xlab ="Values")
legend("topleft", legend=c("Model Simple", "Model Brand"), col=c("red","blue"),pch=1)
lines(oj$logmove,oj$logmove,col="black", lty=2)
### ideally points should be closer to the "diagonal" black line. Blue points are closer reflecting
### that brand can help predict (as coefficients are significative)

### R can be very resourceful in building regression models.
### In particular, we can easily add  "interactions" 
### we do not need to create all the variable (R will do it for us!)
## note that `*' also adds the main effects automatically
reg_interact = glm(logmove ~ log(price)*brand, data=oj)
summary(reg_interact)
coef(reg_interact) ## just coefficients
coefplot(reg_interact, intercept = FALSE, outerCI = 1.96, lwdOuter=1.5, xlab ="Coefficient Value and 95% Confidence Interval")
### in this case I did not display the intercept
###
### Lets check which coefficients were significant
significant_variables <- which( summary(reg_interact)$coef[,4] <.05)
significant_variables
length(significant_variables)
length( summary(reg_interact)$coef[,4] )
### There were 5 significant coefficients out of 6 coefficients (which include intercept)
### here are their names
names(significant_variables)


