library(dplyr)
library(magrittr)
# Drop variables
# Add label to variable pclass and survived;
# Remove NA observations;

clean_titanic <- titanic % > % select(-c(home.dest, cabin, name, X, ticket)) % > % 
mutate(pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')), survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) 
% > % na.omit()
glimpse(clean_titanic)


subset1 <-select(titanic, -c(home.dest, cabin, name, x, ticket))
subset2 <- mutate(subset1, pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')), survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) 
clean_titanic <- na.omit(subset2)
glimpse(clean_titanic) 
