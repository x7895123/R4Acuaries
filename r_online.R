library(tidyverse)

# Генерируем таблицу полисов сослучайными данными
n <- 2000
classes <- c("101", "102", "301", "305", "306", "307", "308")

policy_no <- 1:n
class <- sample(classes, n, replace = T)
start_date <- sample(seq(as.Date('2020/01/01'), as.Date('2021/01/01'), by="day"), n, replace = T)
end_date <- start_date + 366
premium <- floor(runif(n, min=10000, max=50000))

policies <- data.frame(
  policy_no = policy_no, 
  class = class,
  start_date = start_date, 
  end_date = end_date,
  premium = premium,
  stringsAsFactors = FALSE
)
head(policies)

# Создаем функцию расчета РНП
upr = function(start_date, end_date, calc_date, premium) {
  return(premium * as.double(end_date - calc_date + 1)/as.double(end_date - start_date))
}

class(upr)
calc_date = as.Date('2021-01-01')
# Добавляем столбец РНП
policies$upr = upr(policies$start_date, policies$end_date, calc_date, policies$premium)
head(policies, 10)

# Суммируем РНП с группировкой по полю Класс страхования
result = policies %>%
  group_by(class) %>%
  summarise(upr = sum(upr))

result
