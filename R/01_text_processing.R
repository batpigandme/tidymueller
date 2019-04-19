# src: https://www.garrickadenbuie.com/blog/redacted-text-extracted-mueller-report/

# libraries ---------------------------------------------------------------
library(tidyverse)
library(ggpage)
library(tidytext)
library(stringr)

# read in report from @grrrck ---------------------------------------------
mueller_report_csv <- "https://raw.githubusercontent.com/gadenbuie/mueller-report/ab74012b0532ffa34f3a45196d2b28004e11b9c2/mueller_report.csv"

mueller_report <- read_csv(mueller_report_csv)

# tidy texting ------------------------------------------------------------
tidy_mueller <- mueller_report %>%
  unnest_tokens(word, text)

# remove stop words
data(stop_words)

tidy_mueller <- tidy_mueller %>%
  anti_join(stop_words)

mueller_word_count <- tidy_mueller %>%
  count(word, sort = TRUE) %>%
  filter(!str_detect(word, "[0-9]")) # remove numbers


# read in watergate special prosecution force report ----------------------
# source: https://archive.org/stream/WatergateSpecialProsuectionForceReport/Watergate%20Special%20Prosuection%20Force%20Report_djvu.txt"
watergate_report <- read_csv(here::here("data", "watergate_report.csv"))

tidy_watergate <- watergate_report %>%
  unnest_tokens(word, text)

tidy_watergate <- tidy_watergate %>%
  anti_join(stop_words)

watergate_word_count <- tidy_watergate %>%
  count(word, sort = TRUE) %>%
  filter(!str_detect(word, "[0-9]"))


