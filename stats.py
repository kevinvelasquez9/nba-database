import pandas as pd
from requests import get
from bs4 import BeautifulSoup

def stats():
    for year in range(1950, 2021):
        r = get(f'https://widgets.sports-reference.com/wg.fcgi?css=1&site=bbr&url=%2Fleagues%2FNBA_{year}_per_game.html&div=div_per_game_stats')
        if r.status_code == 200:
            soup = BeautifulSoup(r.content, 'html.parser')
            table = soup.find('table')
            df = pd.read_html(str(table))[0]
            df['Player'] = df['Player'].replace({'\*': ''}, regex=True)
            df = df.drop_duplicates(subset='Player', keep='first')
            df = df[['Player', 'G', 'MP', 'FG%', 'TRB', 'AST', 'PTS']]
            df['Year'] = year
            df = df[['Year', 'Player', 'G', 'MP', 'FG%', 'TRB', 'AST', 'PTS']]
            df.to_csv('injury.txt', mode='a', sep='\t', header=False, index=False)

stats()
