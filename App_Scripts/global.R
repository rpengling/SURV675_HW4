library(tidyverse)
library(shiny)
library(here)

setwd("/srv/connect/apps/app_scripts")
load("www/WV6_Data_R_v20201117.rdata")


dat.work <- WV6_Data_R_v20201117 

#Country
Country <- dat.work %>% 
  select(V2) %>%
  mutate(V2 = as.factor(case_when(
    V2 == 12  ~ "Algeria",
    V2 == 31  ~ "Azerbaijan",
    V2 == 32  ~ "Australia",
    V2 == 36  ~ "Bahrain",
    V2 == 48  ~ "Armenia",
    V2 == 51  ~ "Brazil",
    V2 == 76  ~ "Belarus",
    V2 == 112 ~ "Chile",
    V2 == 152 ~ "China",
    V2 == 156 ~ "Taiwan",
    V2 == 158 ~ "Colombia",
    V2 == 170 ~ "Cyprus",
    V2 == 196 ~ "Ecuador",
    V2 == 218 ~ "Estonia",
    V2 == 233 ~ "Georgia",
    V2 == 268 ~ "Palestine",
    V2 == 275 ~ "Germany",
    V2 == 276 ~ "Ghana",
    V2 == 288 ~ "Haiti",
    V2 == 332 ~ "Hong Kong",
    V2 == 344 ~ "India",
    V2 == 356 ~ "Iraq",
    V2 == 368 ~ "Japan",
    V2 == 392 ~ "Kazakhstan",
    V2 == 398 ~ "Jordan",
    V2 == 400 ~ "South Korea",
    V2 == 410 ~ "Kuwait",
    V2 == 414 ~ "Kyrgyzstan",
    V2 == 422 ~ "Lebanon",
    V2 == 434 ~ "Libya",
    V2 == 458 ~ "Malaysia",
    V2 == 484 ~ "Mexico",
    V2 == 504 ~ "Morocco",
    V2 == 554 ~ "New Zealand",
    V2 == 566 ~ "Nigeria",
    V2 == 586 ~ "Pakistan",
    V2 == 604 ~ "Peru", 
    V2 == 608 ~ "Philippines",
    V2 == 616 ~ "Poland",
    V2 == 642 ~ "Romania",
    V2 == 643 ~ "Russia",
    V2 == 646 ~ "Rwanda",
    V2 == 702 ~ "Singapore",    
    V2 == 710 ~ "South Africa",
    V2 == 716 ~ "Zimbabwe",
    V2 == 752 ~ "Sweden",
    V2 == 764 ~ "Thailand",  
    V2 == 788 ~ "Tunisia",
    V2 == 792 ~ "Turkey",
    V2 == 804 ~ "Ukraine",
    V2 == 818 ~ "Egypt",
    V2 == 840 ~ "United States",
    V2 == 858 ~ "Uruguay",
    V2 == 860 ~ "Uzbekistan",
    V2 == 887 ~ "Yemen"))
  ) %>% 
  rename(Country = V2) 


#Democracy 
dat.clean <- dat.work %>% 
  rename(
    D_Choice = V228I, 
    D_Threatened = V228H, 
    D_Rich = V228G, 
    D_Fair = V228F, 
    D_Journalists = V228E, 
    D_Bribed = V228D, 
    D_BiasedTV = V228C, 
    D_Opponents = V228B, 
    D_Count = V228A, 
    
    N_Paper = V217,
    N_Magazine = V218,
    N_TV = V219, 
    N_Radio = V220, 
    N_CellPhone = V221, 
    N_Email = V222, 
    N_Internet = V223,
    N_Talking = V224, 
    
    S_LifeBetter = V192, 
    S_Oppertunities = V193, 
    S_Faith = V194, 
    S_Morals = V195, 
    S_Unimportant = V196, 
    S_World = V197
  ) 

dat.clean <- cbind(dat.clean, Country)

dat.clean <- dat.clean %>% drop_na(Country)

Dat <- dat.clean %>% 
  select(
    Country,
    D_Choice, 
    D_Threatened, 
    D_Rich, 
    D_Fair, 
    D_Journalists, 
    D_Bribed, 
    D_BiasedTV, 
    D_Opponents, 
    D_Count,
    N_Paper,
    N_Magazine,
    N_TV, 
    N_Radio, 
    N_CellPhone, 
    N_Email, 
    N_Internet,
    N_Talking,
    S_LifeBetter, 
    S_Oppertunities, 
    S_Faith, 
    S_Morals, 
    S_Unimportant, 
    S_World)


# Creating Smaller Datasets 
Dem <- dat.clean %>% 
  select(
    Country,
    D_Choice, 
    D_Threatened, 
    D_Rich, 
    D_Fair, 
    D_Journalists, 
    D_Bribed, 
    D_BiasedTV, 
    D_Opponents, 
    D_Count
  )

News <- dat.clean %>% 
  select(
    Country,
    N_Paper,
    N_Magazine,
    N_TV, 
    N_Radio, 
    N_CellPhone, 
    N_Email, 
    N_Internet,
    N_Talking
  )

Sci <- dat.clean %>% 
  select(
    Country,
    S_LifeBetter, 
    S_Oppertunities, 
    S_Faith, 
    S_Morals, 
    S_Unimportant, 
    S_World )

Long.News <- News %>%
  pivot_longer(
    cols = 2:9,
    names_to = "Variable",
    values_to = "Response"
  )

# Get total counts per country
cont.total <- News %>%
  count(Country) %>%
  deframe()

# Calculate proportions for each response value (1 to 5) for all countries
AllComb <- Long.News %>%
  group_by(Country, Variable, Response) %>%
  count() %>%
  mutate(Prop = round(n / cont.total[Country], 4)) %>%
  select(Country, Variable, Response, Prop) %>%
  pivot_wider(names_from = Response, values_from = Prop, names_prefix = "Prop") 

# Pivot long then wide for each country
AllComb_Fin <- AllComb %>%
  pivot_longer(
    cols = starts_with("Prop"),
    names_to = "Response",
    values_to = "Value"
  ) %>%
  pivot_wider(
    names_from = Variable,
    values_from = Value
  )

AllComb_Fin
