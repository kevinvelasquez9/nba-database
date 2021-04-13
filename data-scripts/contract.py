import pandas as pd
from requests import get
from bs4 import BeautifulSoup

def get_salary():
    res = pd.DataFrame()
    r = get(f'https://hoopshype.com/salaries/players/')
    if r.status_code == 200:
        soup = BeautifulSoup(r.content, 'html.parser')
        table = soup.find('table')
        df = pd.read_html(str(table))[0]
        df.to_csv('contract2.csv', mode='a', sep=',', header=False, index=False)

get_salary()