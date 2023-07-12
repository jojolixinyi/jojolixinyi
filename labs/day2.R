library(tidyverse)
csv_data <- read_csv("On_Street_Crime_In_Camden_Map.csv")
View(df)

#integer,ceiling,floor,trunc......

data$"Street ID" <- as.integer(data$"StreetcID")

csv_data %>%
  select(where(as.integer))

#summarise
summarise(across(everything(), n_distinct)) 

#rotate
pivot_longer(everything(), names_to = "Column", values_to = "# Distinct") 

#mutate
csv_data <- csv_data %>%
  mutate(across(all_of(selected_cols),factor))

#equivalent ways
csv_data$Category <- factor(csv_data$Category)
csv_data <- csv_data %>% 