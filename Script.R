#Set your working directory
setwd("C:/Users/Precious/Desktop/GS Thesis_ ecoTILLING/Data Analysis/FINAL DENRO (MORPHO, LCY, MARKER DATA)")

#import your table from a text(tab delimited) file
tomato<-read.table("mopho_marker_lcy.txt", header=T, sep="\t")

#check number of rows and columns
dim(tomato)

#check default data types
str(tomato)

#assign proper data types according to your fruit character
tomato$char_01<-ordered(tomato$char_01)
tomato$char_02<-factor(tomato$char_02)
tomato$char_03<-ordered(tomato$char_03)
tomato$char_04<-ordered(tomato$char_04)
tomato$char_05<-ordered(tomato$char_05)
tomato$char_06<-factor(tomato$char_06)
tomato$char_07<-ordered(tomato$char_07)
tomato$char_08<-ordered(tomato$char_08)
tomato$char_09<-factor(tomato$char_09)
tomato$char_10<-factor(tomato$char_10)
tomato$char_11<-ordered(tomato$char_11)
tomato$char_12<-factor(tomato$char_12)
tomato$char_13<-ordered(tomato$char_13)
tomato$char_14<-factor(tomato$char_14)
tomato$char_15<-ordered(tomato$char_15)
tomato$char_16<-ordered(tomato$char_16)
tomato$char_17<-ordered(tomato$char_17)
tomato$char_18<-ordered(tomato$char_18)
tomato$char_19<-factor(tomato$char_19)
tomato$char_20<-ordered(tomato$char_20)
tomato$char_21<-factor(tomato$char_21)
tomato$char_22<-factor(tomato$char_22)
tomato$char_23<-ordered(tomato$char_23)
tomato$char_24<-ordered(tomato$char_24)
tomato$char_25<-ordered(tomato$char_25)
tomato$char_26<-factor(tomato$char_26)
tomato$char_27<-factor(tomato$char_27)
tomato$char_28<-ordered(tomato$char_28)
tomato$char_29<-ordered(tomato$char_29)
tomato$char_39<-factor(tomato$char_39)
tomato$char_40<-factor(tomato$char_40)

#check again if data types are assigned properly
str(tomato)

#select subset of traits/columns you want to analyze
fruitchar<-subset(tomato, select=char_01:char_41)

#check for data types of the subset
str(fruitchar)

#cluster analysis using mixed data types
library(cluster)
daisymorph<-daisy(fruitchar)
hclustfruit<-hclust(daisymorph, method="average")
plot(hclustfruit, labels=tomato$Sample, cex=0.9, hang = -1, ylab="Dissimilarity")

#reorder cluster to give more intuitive display
library(gclus)
hclustreorde<-reorder.hclust(hclustfruit,daisymorph)
plot(hclustreorde,labels=tomato$Sample ,cex=0.9, hang = -1, ylab="Dissimilarity")
