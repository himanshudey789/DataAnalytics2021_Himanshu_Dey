#Excercise 1

print(getwd())
data <- read.csv("2010EPI_data.csv",skip=1,header = TRUE)

print(data)
View(data)
attach(data)
fix(data)
tf <- is.na(data)
print(tf)
EPI
DALY
E<- EPI[!tf]
E
summary(EPI)
fivenum(EPI, na.rm=TRUE)
stem(EPI)
pdf("Exercise_Plots.pdf")
hist(EPI)
rug(EPI)
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
par(pty="s")
qqnorm(EPI)
qqline(EPI)     
x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
boxplot(EPI,DALY)
qqplot(EPI,DALY)


#Exercise 2

EPILand <- EPI[!Landlock]
print(EPILand)
Eland <- EPILand[!is.na(EPILand)]
summary(EPILand)
fivenum(EPILand, na.rm=TRUE)
hist(Eland)
hist(Eland, seq(30., 95., 1.0), prob=TRUE)
rug(EPILand)
qqnorm(Eland)
qqline(Eland)

dev.off()
