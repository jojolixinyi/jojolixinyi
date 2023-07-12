#### IMPORTS ####
library(tidyverse)

#### 1.INIT VARIABLES ####

#This is a comment

course_code <- "ME204" # This is another comment
number_students <- as.integer(28)

%>%
number_students %>% as.integer() %>% typeof()

number <- c(4,8,10,8,6,NA,NA,87)
sum(number,na.rm=TRUE)
c(4,8,10,8,6,NA,NA,87) |> sum(na.rm=TRUE)


grades <- list(PersonA=80,PersonB=35)
grades$PersonA

####

#Python
def sumTwoNumbers(a,b):
  return a + b

#R
sumTwoNumbers <- function(a,b){
  as.integer(a + b)
}

####
for (i in c(1,3,1,4)){
  print(i)
}

data(iris)
iris %>% filter(Species == "virginica") %>% view()
iris %>% filter(Species == "virginica") %>% 
