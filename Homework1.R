#import dataset
BondSet <- read.csv("Homework1_Bonds.csv")

##How many of these bonds were approved by voters, and how many were defeated? 
table(BondSet$Result)
#This function shows us the observations for the Result variable. 6761 were approved and 1508 were defeated.



##Calculate a new variable in the dataframe called “Votes_Total” that is the sum of the votes “for” and “against” the bond measure.  
BondSet$Votes_Total = BondSet$Votes_For + BondSet$Votes_Against
#This code just creates the new votes variable and sets the obs of the var as the sum of two pre-existing variables.

##Are there any differences in the rates of approved bonds across the four different government types?
approvedvars <- BondSet[BondSet$Result == 'Carried',]
prop.table(table(BondSet$Gov_Type,BondSet$Result),1)
#Here I subset the vars that approved bonds for future use
#I used a prop table, and calculated the row% with the ,1 to see rates of govt types.




##Create a subset of this dataset that contains the bond measures that were approved and had at least 10 total votes.  
EnoughTurnouts <- approvedvars[approvedvars$Votes_Total >= 10,]
#Here I had to be a little sneaky so I could just reuse our existing subset with approved bonds
# then applied the >=10 condition to get the required turnout

##Next, create a variable that gives the percentage of total votes that were for the bond measure.  
EnoughTurnouts$forpercent <- (EnoughTurnouts$Votes_For / EnoughTurnouts$Votes_Total)*100
##Finally, make a graph of the distribution of your new variable for your subset of bond measures 
hist(EnoughTurnouts$forpercent,main='Histogram of Percent for Bond Measure',xlab='Percent For Bond Measure',col='darkgreen',xlim=c(0,100),ylim=c(0,800))
mean(EnoughTurnouts$forpercent)
median(EnoughTurnouts$forpercent)
#Created a basic frequency histogram here, and adjusted the Y Limit. The X limit was intuitive as percent cannot go over 100%.


##Is the margin a bond was approved by related to its cost? 
##Use your subset from #3 to create a graph to display this relationship and calculate the appropriate descriptive statistic.

plot(EnoughTurnouts$forpercent,EnoughTurnouts$Amount,main='Percent Margin Approved by and Cost',xlab='Percent Margin Approved',ylab='Cost',pch=20)
cor(EnoughTurnouts$forpercent,EnoughTurnouts$Amount) #This calculates our correlation statistic


print(":)")


