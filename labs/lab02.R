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

#### Create root node
tesco_data_xml <- xml_new_root("data", .encoding = "UTF-8")
tesco_data_xml

#The encoding is not compulsory
temp <- xml_new_root("data")
temp

#### Extract the first row ####
row1 <- df %>% slice(1)

#### Create a new XML node ####
area_node <- xml_new_root("area",
                          area_id=row1 %>% pull(area_id))

#### Add children node to the area node ####
for(nutrient_name in selected_cols[-1]){
  xml_add_child(area_node, nutrient_name, row1 %>% pull(nutrient_name))
}
area_node

#### Add area node as a child to root ####
xml_add_child(tesco_data_xml, area_node)

#### saving the file ####
write_xml(tesco_data_xml, "sample_tesco_data.xml")




#### get area node function ####
get_area_node <- function(row){
  row <- data.frame(row)
  area_node <- xml_new_root("area",
                            area_id=row %>% pull(area_id))
}
for (nutrient_name in selected_cols[-1]){
  xml_add_child(area_node, nutrient_name, row %>% pull(nutrient_name))
}
