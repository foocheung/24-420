# Load necessary libraries
library(tidyverse)
library(janitor)

# Read the data file
data <- read_tsv("29_july_Proposed_sample_selection.txt")

# Clean the column names
df <- clean_names(data)
df <- janitor::remove_empty(df)

# Convert age to numeric
df$subject_age_at_t3_sample_days <- as.numeric(df$subject_age_at_t3_sample_days)

# Group age into 3 bins
df$subject_age_at_t3_sample_days_groups <- cut(df$subject_age_at_t3_sample_days, breaks = 3)

# Select and filter the relevant columns for batch 1
dat <- df %>% 
  select(subject, group, subject_age_at_t3_sample_days_groups, cdba_sex, any_food_allergy_count, any_food_sens_count, batch) %>% 
  filter(batch == 1)

# Write the parsed data to a new file
write_tsv(dat, "data4web_atac_batch1.txt")
