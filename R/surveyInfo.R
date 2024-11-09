# info table ---------------------------------------------------------------------

library(tidyverse)
library(rio)
library(here)

dcpo_input_raw |>
  select(year, survey) |>
  distinct() |>
  arrange(survey, year) |>
  mutate(name = NA,
    creator = NA,
         version = NA,
         link = NA) |>
  export(here("data-raw", "survey_info_macrointerest.xlsx"))



# reference ----------------------------------------------------------------------

tb_ref <- import(here("data-raw", "surveys_data.csv")) |> 
  select(survey, year, archive, surv_program, file_id, data_link) |> 
  distinct()

export(tb_ref, here("data-raw", "survey_info_full.xlsx"))