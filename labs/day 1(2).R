#### SETUP ####
library(tidyverse)
df <- read_csv("Dec_lsoa_grocery.csv")


#### Filter ####
a=df[df["area_id"] == "E01004735",]

#let's view the data
View(a)

selected_cols <- c("area_id”,
                    “fat”,“saturate”, “salt”, “protein”, “sugar”,
                    “protein”, “carb”, “fibre”, “alcohol”,
                    “population”, “male”,  “female”,
                    “age_0_17",  "age_18_64”, “age_65+“,  “avg_age”,
                   “area_sq_km”,  “people_per_sq_km"
)
df <- df %>% select(all_of(selected_cols))

#baseR
highest_regions <- df[order(df$alcohol, decreasing=TRUE),]
highdst_regions <- head(highest_regions,3)
lowest_regions <- df[order(df$alcohol),]
lowest_regions <- head(lowest_regions,3)

highest_names <- highest_regions$area_id
lowest_names <- lowest_regions$area_id

#tidyverse
highest_regions <- df %>%
  arrange(desc(alcohol)) %>%
  head(3)
lowest_regions <- df %>%
  arrange((alcohol)) %>%
  head(3)

highest_names <- highest_regions$area_id
lowest_names <- lowest_regions$area_id

cat("regions with highest average alcohol consumption:","\n",highest_names,"\n")
cat("regions with lowest average alcohol consumption:","\n",lowest_names,"\n")


#### STEP 3
pop_stats <- df %>%
  summarise(mean_pop=mean(population), sd_pop=sd(population))
print(pop_stats)

#### STEP 4
nutrient1 <- df$alcohol
nutrient2 <- df$sugar

ggplot(data=df,aes(x=nutrient1, y=nutrient2))+
  geom_point()+
  labs(title = "scatterplot of alcohol vs sugar",
       x="alcohol",y="sugar")
