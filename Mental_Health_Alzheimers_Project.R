Alzheimers<-read.csv("Alzheimers_final.csv")
hist(Alzheimers$Percentage.of.Older.Adults.who.Engage.in.Drinking.or.Smoking, main = "lmfao da hale", 
     xlab = "Percentage of Adults Who have Alzheimers (%)", right = F, col = "red")

#Explanatory Variable 1 (Race)
boxplot(Alzheimers$Percentage.of.Older.Adults.who.Engage.in.Drinking.or.Smoking ~ Alzheimers$Race.Ethnicity, xlab = "Race", ylab = "Percentage of Adults Who Engage in Either Drinking or Smoking (%)", 
        main = "Relationship", 
        col = c("light blue", "light green", "light pink"))

#Explanatory Variable 2 (Smoking or Drinking Status)
boxplot(Alzheimers$Percentage.of.Older.Adults.who.Engage.in.Drinking.or.Smoking ~ Alzheimers$Smoking.or.Drinking.Status, xlab = "Smoking or Drinking Status", ylab = "Percentage of Adults Who Engage in Either Drinking or Smoking (%)", 
        main = "Relationship", 
        col = c("light blue", "light green"))
drinking <- Alzheimers[Alzheimers$Smoking.or.Drinking.Status == "Binge drinking within past 30 days",]
mean(drinking$Percentage.of.Older.Adults.who.Engage.in.Drinking.or.Smoking)

#-----------------------------------------------------------------------------------------------------------------------------#
library(car)
install.packages("emmeans")
install.packages("ggplot2")

Alzheimers<-read.csv("Final_Alzheimers.csv")

#Distribution of Response Variable
hist(Alzheimers$Percent_Mental_Distress, main = "Distribution of Percent of Older Adults Suffering From a Mental Health Issue", 
     xlab = "Distribution of Older Adults Suffering from a Mental Health Issue (%)", right = F, col = "red")
  #Descriptive Stats
fivenum(Alzheimers$Percent_Mental_Distress) #IQR Calculation: 19.3-12.7
mean(Alzheimers$Percent_Mental_Distress)
sd(Alzheimers$Percent_Mental_Distress)
#Explanatory Variable 1
boxplot(Alzheimers$Percent_Mental_Distress~ Alzheimers$Race, xlab = "Race Categories", ylab = "Older Adults suffering from Mental Health Issues (%)", 
        main = "Mental Health Issues in Older Adults by Race", 
        col = c("light blue", "light green", "light pink"))

hist(Alzheimers$Percent_Mental_Distress~Alzheimers[Alzheimers$Race == "White, non-Hispanic",])

trans_mental1<- (Alzheimers$Percent_Mental_Distress)
boxplot(trans_mental1~ Alzheimers$Race, xlab = "Race Categories", ylab = "Older Adults suffering from Mental Health Issues (%)", 
        main = "Mental Health Issues in Older Adults by Race", 
        col = c("light blue", "light green", "light pink"))
 #Descriptive Stats
Wht <- Alzheimers[Alzheimers$Race == "White, non-Hispanic",]
mean(wht$Percent_Mental_Distress)
sd(wht$Percent_Mental_Distress)

Blk <- Alzheimers[Alzheimers$Race == "Black, non-Hispanic",]
mean(Blk$Percent_Mental_Distress)
sd(Blk$Percent_Mental_Distress)

His <- Alzheimers[Alzheimers$Race == "Hispanic",]
mean(His$Percent_Mental_Distress)
sd(His$Percent_Mental_Distress)

#Explanatory Variable 2
boxplot(Alzheimers$Percent_Mental_Distress~ Alzheimers$Age, xlab = "Age Categories", ylab = "Older Adults suffering from Mental Health Issues (%)", 
        main = "Distribution of Mental Health Issues in Older Adults by Age", 
        col = c("darkgoldenrod1", "aquamarine"))

trans_mental2<- sqrt(Alzheimers$Percent_Mental_Distress)
boxplot(trans_mental2~ Alzheimers$Age, xlab = "Age Categories", ylab = "Older Adults suffering from Mental Health Issues (%)", 
        main = "Distribution of Mental Health Issues in Older Adults by Age", 
        col = c("darkgoldenrod1", "aquamarine"))
 
 #Descriptive Stats
sixty_up <- Alzheimers[Alzheimers$Age == "60 years or older",]
mean(sixty_up$Percent_Mental_Distress)
sd(sixty_up$Percent_Mental_Distress)

fifty_fiftynine <-Alzheimers[Alzheimers$Age == "50-59 years",]
mean(fifty_fiftynine$Percent_Mental_Distress)
sd(fifty_fiftynine$Percent_Mental_Distress)

#contingency table of explanatory variables/Levene's test
alz_table <-table(Alzheimers$Race, Alzheimers$Age)
alz_table

leveneTest(Percent_Mental_Distress ~ Race, data = Alzheimers)
leveneTest(Percent_Mental_Distress ~ Age, data = Alzheimers)

#Anova w/ Interaction
options(contrasts = c(unordered = "contr.sum", ordered = "contr.poly"))
alz_int_anova <- lm(Percent_Mental_Distress ~ Race * Age, data = Alzheimers)
Anova(alz_int_anova, type = 3)
summary(alz_int_anova)$adj.r.squared

install.packages("emmeans")
library(emmeans)
emmeans(alz_int_anova, pairwise ~ Age)
install.packages("ggplot2")
library(ggplot2)
mymeans <- summary(emmeans(alz_int_anova, pairwise ~ Race | Age)$emmeans)
mymeans_plot <- mymeans[c("Race", "Age", "emmean", "SE")]



ggplot(mymeans_plot, aes(x = Race, y = emmean, col = Age)) + geom_point(position = position_dodge(width = 0.4)) + geom_errorbar(aes(ymin = emmean - SE, ymax = emmean + SE), width = 0.4, size = 0.7, position = position_dodge(width = 0.4)) + xlab("Race of Older Patient") + ylab("Mean Frequency of Mental Health Issues in Older Patients +/- SE") + ggtitle("Mean Frequency of Mental Health Issues in Older Patients by Race and Age") + theme_classic()
  





