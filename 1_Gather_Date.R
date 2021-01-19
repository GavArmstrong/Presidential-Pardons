library(tidyr)
library(dplyr)
library(magrittr)
library(rvest)

# Read in the html files.
obama <- read_html("https://www.justice.gov/pardon/obama-pardons")

# Find the table elements.
obama_tables <- obama %>%
  html_nodes("table") %>%
  html_table()

obama_tibbles <- lapply(obama_tables, as_tibble, .name_repair="unique")
