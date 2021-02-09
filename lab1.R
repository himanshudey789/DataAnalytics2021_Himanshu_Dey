#Excercise 1


# read Dataframe
print(getwd())
data <- read.csv("2010EPI_data.csv",skip=1,header = TRUE)
dataclean <- na.omit(data)
print(dataclean)

nrow(dataclean)
sum(is.na(dataclean))

#view the data
print(data)
View(data)
attach(data)
fix(data)


#Check for NA
tf <- is.na(data)
print(tf)


EPI
DALY
E<- EPI[!tf]

#summary of columns 
summary(EPI)
summary(DALY)
summary(Population07)
summary(Landarea)


#fivenum and stem
fivenum(EPI, na.rm=TRUE)
stem(EPI)
stem(DALY)
stem(Population07)
stem(Landarea)
pdf("Exercise_Plots.pdf")


#Histogram and Rug plots
hist(EPI)
rug(EPI)
hist(Population07)
rug(Population07)
hist(Landlock)
rug(Landlock)
hist(DALY)
rug(DALY)
hist(Landarea)
rug(Landarea)

# Cumalative density function plots
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
plot(ecdf(Landlock), do.points=FALSE, verticals=TRUE)
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE)
plot(ecdf(Population07), do.points=FALSE, verticals=TRUE)




#Quantile plots
par(pty="s")
qqnorm(EPI)
qqline(EPI)    

# Q-Q plots
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")


#Boxplot and Q-Q plot 
boxplot(EPI,DALY)
qqplot(EPI,DALY)
boxplot(EPI, ECOSYSTEM)
qqplot(EPI, ECOSYSTEM)
boxplot(EPI, ENVHEALTH)
qqplot(EPI, ENVHEALTH)
boxplot(AIR_H, ENVHEALTH)
qqplot(AIR_H, ENVHEALTH)

#Exercise 2

#checking for Na
EPILand <- EPI[!Landlock]
print(EPILand)
Eland <- EPILand[!is.na(EPILand)]

#summary and fivenum
summary(EPILand)
fivenum(EPILand, na.rm=TRUE)

#histogram plots
hist(Eland)
hist(Eland, seq(30., 95., 1.0), prob=TRUE)
rug(EPILand)
qqnorm(Eland)
qqline(Eland)
EPI_regions1 <- data[ data$EPI_regions %in% c('Europe'), ]
print(EPI_regions1)
dev.off()



############## Water Dataset ######################

print(getwd())
data3 <- read.csv("water-treatment.csv",header = TRUE)
data3[data3=="?"] <-NA
waterclean <- na.omit(data3)

nrow(data3)
nrow(waterclean)

#view and print dataset
attach(waterclean)
print(data)

fix(data)

#summary of columns 

summary(COND.D)
summary(SSV.S)
summary(DBO.E)



#fivenum and stem
fivenum(COND.D, na.rm=TRUE)
stem(COND.D)
fivenum(PH.D, na.rm=TRUE)
stem(PH.D)


#Histogram and Rug plots
hist(COND.D)
rug(COND.D)
hist(PH.D)
rug(PH.D)


# Cumalative density function plots
plot(ecdf(COND.D), do.points=FALSE, verticals=TRUE)
plot(ecdf(PH.D), do.points=FALSE, verticals=TRUE)


#Quantile plots
par(pty="s")
qqnorm(COND.D)
qqline(PH.D)    

# Q-Q plots
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot")


#BOXPLOT 
boxplot(COND.D,PH.D)
qqplot(COND.D,PH.D)
