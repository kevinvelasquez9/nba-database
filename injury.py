import pandas as pd
from requests import get
from bs4 import BeautifulSoup

def get_injury():
    for num in range(0, 29051, 25):
        r = get(f'https://www.prosportstransactions.com/basketball/Search/SearchResults.php?Player=&Team=&BeginDate=&EndDate=&InjuriesChkBx=yes&Submit=Search&start={num}')
        if r.status_code == 200:
            soup = BeautifulSoup(r.content, 'html.parser')
            table = soup.find('table')
            df = pd.read_html(str(table))[0]
            new_header = df.iloc[0] #grab the first row for the header
            df = df[1:] #take the data less the header row
            df.columns = new_header #set the header row as the df header
            df = df[df['Relinquished'].notna()]
            df = df[['Date', 'Relinquished', 'Notes']]
            df['Relinquished'] = df['Relinquished'].str.replace('• ','')
            df.to_csv('injury.txt', mode='a', sep='\t', header=False, index=False)

get_injury()
