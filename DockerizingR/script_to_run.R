
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(xts))
suppressPackageStartupMessages(library(zoo))
suppressPackageStartupMessages(library(tidyquant))
suppressPackageStartupMessages(library(lubridate))
suppressPackageStartupMessages(library(timetk))


initial_date <- floor_date(Sys.Date() - weeks(1), "week")

FAANG <- c("AAPL", "GOOG", "AMZN", "NFLX")
xtsFAANG_daily_returns <- FAANG %>% 
  tq_get(get = "stock.prices",
         from = initial_date, to = Sys.Date()) %>% 
  group_by(symbol) %>% 
  tq_transmute(select = adjusted,
               mutate_fun = periodReturn,   
               period="daily", 
               type="arithmetic") %>%
  select(symbol, date, daily.returns) %>%
  spread(symbol,daily.returns) %>%
  tk_xts(silent = TRUE)

xtsFAANG_daily_returns[nrow(xtsFAANG_daily_returns), ]*100
