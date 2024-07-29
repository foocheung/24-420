library(tidyverse)
library(janitor)

a<-read_tsv("29_july_Proposed_sample_selection.txt")

df<-clean_names(a)
df<-janitor::remove_empty(df)

df$subject_age_at_t3_sample_days <- as.numeric(df$subject_age_at_t3_sample_days)


df$subject_age_at_t3_sample_days_groups <- cut(df$subject_age_at_t3_sample_days, breaks = 3)


#dat<-df %>% select(subject,group,subject_age_at_t3_sample_days_groups,cdba_sex,any_food_allergy_count,any_food_sens_count,everything())
dat<-df %>% select(subject,group,subject_age_at_t3_sample_days_groups,cdba_sex,any_food_allergy_count,any_food_sens_count,batch) %>% filter(batch==1)

write_tsv(dat,"data4web_atac_batch1.txt")