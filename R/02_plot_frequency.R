# following: https://www.tidytextmining.com/tidytext.html#word-frequencies

# remove page bc we don't have it for watergate
tidy_mueller <- tidy_mueller %>%
  select(-page)

tidy_reports <- bind_rows(mutate(tidy_mueller, report = "Mueller"),
                    mutate(tidy_watergate, report = "Watergate")) %>%
  filter(!str_detect(word, "[0-9]"))

# following: https://www.tidytextmining.com/twitter.html#word-frequencies-1
raw_frequency <- tidy_reports %>%
  group_by(report) %>%
  count(word, sort = TRUE) %>%
  left_join(tidy_reports %>%
              group_by(report) %>%
              summarise(total = n())) %>%
  mutate(freq = n/total)

frequency <- raw_frequency %>%
  select(report, word, freq) %>%
  spread(report, freq) %>%
  arrange(Mueller, Watergate) %>%
  filter(word != "sessions")


# plot relative frequencies -----------------------------------------------
library(scales)

ggplot(frequency, aes(Mueller, Watergate)) +
  geom_jitter(alpha = 0.1, size = 2.5, width = 0.25, height = 0.25) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 1.5) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  geom_abline(color = "red") +
  hrbrthemes::theme_ipsum_rc() +
  labs(title = "Word frequencies in Mueller vs. Watergate Reports",
       subtitle = "Text from Mueller Report (2019), Watergate Special Prosecution Force Report (1975)",
       caption = "by @dataandme")

