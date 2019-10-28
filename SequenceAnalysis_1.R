# State Sequence Mining
library(Matrix)
library(arules)
library(arulesSequences)
library(TraMineR)

x <- read_baskets(con = system.file("misc", "zaki.txt", package = "arulesSequences"), 
                  info = c("sequenceID","eventID","SIZE"))

as(x, "data.frame")


s1 <- cspade(x, parameter = list(support = 0.4), control = list(verbose = TRUE))

summary(s1)

as(s1, "data.frame")

#https://cran.r-project.org/web/packages/TraMineR/vignettes/TraMineR-state-sequence.pdf
...
s1.seq <- seqdef(s1, 17:86, alphabet = s1.alphab, states = s1.scode,
                    labels = s1.lab, weights = s1$weight, xtstep = 6)

seqiplot(s1.seq, border = NA, with.legend = "right")
# Reference
#https://en.wikibooks.org/wiki/Data_Mining_Algorithms_In_R/Sequence_Mining/SPADE

#$ cat /usr/local/lib/R/site-library/arulesSequences/misc/zaki.txt
'''
1 10 2 C D
1 15 3 A B C
1 20 3 A B F
1 25 4 A C D F
2 15 3 A B F
2 20 1 E
3 10 3 A B F
4 10 3 D G H
4 20 2 B F
4 25 3 A G H
'''
