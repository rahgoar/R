library(arules)
library(arulesViz)
data("Groceries")
class(Groceries)
inspect(head(Groceries, 12))

grocery_rules <- apriori(Groceries, parameter = list(support = 0.01, confidence = 0.5))
inspect(head(sort(grocery_rules, by = "confidence"), 3))

#Shows what products are bought before buying "whole milk" and will generate rules that lead to buying "whole milk".
#Limiting the number of rules generated
wholemilk_rules <- apriori(data=Groceries, parameter=list (supp=0.001,conf = 0.08), appearance = list (rhs="whole milk"))


# This generates only one rule in the output.
grocery_rules_increased_support <- apriori(Groceries, parameter = list(support = 0.02, confidence = 0.5))

#When you browse through your rules data, you will notice that there are many overlaps, 
#Some are inclusive of the other rules. You would want to keep the longer rules and discard the ones that are the same but are subsets of the longer ones. 
#The function subset compares the data with itself and using "which", we keep the ones that are redundant and then remove them from the grocery_rules.
subsets <- which(colSums(is.subset(grocery_rules, grocery_rules)) > 1)
grocery_rules <- grocery_rules[-subsets]

# This gives more than 1,500,000 rules
rules <- apriori(Groceries, parameter = list(supp = 0.0001, conf = 0.5))
# This gives 982,000 rules.
rules_chi2 <- apriori(Groceries, parameter = list(supp = 0.0001, conf = 0.5, arem = "chi2"))

#rules that have only itemA, only itemB, or only both of them at the left hand side
rules2 <- apriori(Groceries, parameter = list(support = 0.01, confidence = 0.01,
      minlen =2),appearance = list(lhs=c("white bread","chocolate"),default="rhs"))
