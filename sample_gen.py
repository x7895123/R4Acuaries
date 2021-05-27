import random
import datetime
import calendar
from tqdm import tqdm


def random_dates(year):
    days = 366 if calendar.isleap(year) else 365
    start_date = datetime.datetime(year, 1, 1) + datetime.timedelta(days=random.randrange(days))
    end_date = start_date + datetime.timedelta(days=days)
    # print(start_date, end_date)
    # begin = datetime.datetime(1899, 12, 30)
    # start_date = start_date - begin
    # end_date = end_date - begin
    start_date = start_date.strftime('%Y-%m-%d')
    end_date = end_date.strftime('%Y-%m-%d')
    return start_date, end_date


random.seed()

csv_filename = './data/small_sample.csv'
header = 'policy_no;class;start_date;end_date;premium;premium_re\n'

classes = ["101", "102", "301", "305", "306", "307", "308"]

with open(csv_filename, 'w') as f:
    f.write(header)
    start = 10000
    stop = start + 20000
    for i in tqdm(range(start, stop)):
        policy_no = i
        rand_class = random.choice(classes)
        s_date, e_date = random_dates(2020)
        premium = random.randrange(10000, 50000)
        re = random.random()
        premium_re = 0 if re < 0.8 else int(round(premium * random.random()))
        row = f'{policy_no};{rand_class};{s_date};{e_date};{premium};{premium_re}\n'
        f.write(row)




