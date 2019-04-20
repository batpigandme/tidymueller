# source kyle mcdonald Mueller unredacter
# https://github.com/kylemcdonald/mueller-unredacter

suppressPackageStartupMessages(library(tidyverse))
mueller <- readLines("https://raw.githubusercontent.com/kylemcdonald/mueller-unredacter/master/mueller-report.txt")
mueller_df <- enframe(mueller)
library(tidytext)
tidy_mueller <- mueller_df %>%
  unnest_tokens(word, value)
