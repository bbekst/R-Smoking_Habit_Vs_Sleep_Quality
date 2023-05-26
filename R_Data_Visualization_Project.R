#Import libraries
library(data.table)
library(Hmisc)
library(ggplot2)

#Import dataset
sleep_efficiency = read.csv("R_Data_Visualization_Project_Dataset.csv")

#Histogram of sleep duration
histogram_sleep_duration = ggplot(sleep_efficiency, aes(Sleep.duration))
histogram_sleep_duration + geom_histogram(binwidth = 0.2)

#Creating a boxplot & barplot
boxplot_sleep_duration = ggplot(sleep_efficiency,aes(x = Smoking.status, y = Sleep.duration, fill = Smoking.status)) + geom_boxplot(alpha=0.3) + theme(legend.position="none") + geom_boxplot(na.rm = FALSE) + labs(x = "Smoking Status", y = "Sleep Duration")
boxplot_sleep_duration

barplot_sleep_duration = ggplot(sleep_efficiency, aes(Smoking.status,Sleep.duration)) 
barplot_sleep_duration + stat_summary(fun.y = mean, geom = "bar", fill = c("#eb8060", "#b9e38d"), colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange") + labs(x = "Smoking Status", y = "Sleep Duration")

#Creating a new dataframe called "revisedData" and removing outliers (if any)
revised_sleep_duration = sleep_efficiency[sleep_efficiency$Sleep.duration <= 9 & sleep_efficiency$Sleep.duration > 5 ,]

#Recreating histograms and boxplot with revised data
#Histogram
histogram_revised_sleep_duration = ggplot(revised_sleep_duration, aes(Sleep.duration))
histogram_revised_sleep_duration + geom_histogram(binwidth = 0.2)

#Boxplot
boxplot_revised_sleep_duration = ggplot(revised_sleep_duration,aes(x = Smoking.status, y = Sleep.duration, fill = Smoking.status)) + geom_boxplot(alpha=0.3) + theme(legend.position="none") + geom_boxplot(na.rm = FALSE) + labs(x = "Smoking Status", y = "Sleep Duration")
boxplot_revised_sleep_duration

#Recreating the barplot
barplot_revised_sleep_duration = ggplot(revised_sleep_duration, aes(Smoking.status,Sleep.duration)) 
barplot_revised_sleep_duration + stat_summary(fun.y = mean, geom = "bar", fill = c("#eb8060", "#b9e38d"), colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange") + labs(x = "Smoking Status", y = "Sleep Duration")

#Since the result is not significant, let's check effect of smoking habits in terms of sleep efficiency
#Histogram of sleep efficiency
histogram_sleep_efficiency = ggplot(sleep_efficiency, aes(Sleep.efficiency))
histogram_sleep_efficiency + geom_histogram(binwidth = 0.005)

#Creating a boxplot
boxplot_sleep_efficiency = ggplot(sleep_efficiency,aes(x = Smoking.status, y = Sleep.efficiency, fill = Smoking.status)) + geom_boxplot(alpha=0.3) + theme(legend.position="none") + geom_boxplot(na.rm = FALSE) + labs(x = "Smoking Status", y = "Sleep Efficiency")
boxplot_sleep_efficiency

#Note: there are no outliers

#Creating a barplot
barplot_sleep_efficiency = ggplot(sleep_efficiency, aes(Smoking.status,Sleep.efficiency)) 
barplot_sleep_efficiency + stat_summary(fun.y = mean, geom = "bar", fill = c("#eb8060", "#b9e38d"), colour = "Black") + stat_summary(fun.data = mean_cl_normal, geom = "pointrange") + labs(x = "Smoking Status", y = "Sleep Efficiency")
