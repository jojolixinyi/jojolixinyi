library(tidyverse)
library(xml2)

#### PART1: SetUp
df <- read_csv("Dec_lsoa_grocery.csv")

#### PART2: Working with XML
selected_cols <- c("area_id",
                   "fat","saturate", "salt", "protein", "sugar",
                   "protein", "carb", "fibre", "alcohol"
)
df[selected_cols]


#### PART 3 ####
tesco_data_xml2 <- xml_new_root("data", .encoding = "UTF-8")
tesco_data_xml2


#The encoding is not compulsory
temp <- xml_new_root("data")
temp

for (i in 1:10){
  tesco_data_xml2 %>% xml_add_child(get_area_node(df[i,]))
}


#### get area node function ####
get_area_node <- function(row){
  row <- data.frame(row)
  area_node <- xml_new_root("area",
                            area_id=row %>% pull(area_id))
}
for (nutrient_name in selected_cols[-1]){
  xml_add_child(area_node, nutrient_name, row %>% pull(nutrient_name))
}

#### Add area node as a child to root ####
xml_add_child(tesco_data_xml2, area_node)

write_xml(tesco_data_xml2, "sample_tesco_data2.xml")

area_node