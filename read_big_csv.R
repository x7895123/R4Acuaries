library(data.table)
policies <- fread('./data/sample.csv')
policies$start_date = as.Date(policies$start_date)
policies$end_date = as.Date(policies$end_date)
head(policies, 10)
class(policies)
format(nrow(policies), big.mark = " ")
upr = function(start_date, end_date, calc_date, premium) {
  return(premium * as.double(end_date - calc_date + 1)/as.double(end_date - start_date))
}
class(upr)
calc_date = as.Date('2021-01-01')
policies$upr = upr(policies$start_date, policies$end_date, calc_date, policies$premium)
policies$upr_re = upr(policies$start_date, policies$end_date, calc_date, policies$premium_re)
head(policies, 10)
library(tidyverse)
result = policies %>%
  group_by(class) %>%
  summarise(upr = sum(upr), upr_re = sum(upr_re))
result
class(result)
library(writexl)
write_xlsx(result, "./data/upr.xlsx")