import pandas as pd
from requests import get
from bs4 import BeautifulSoup


def save_team():
    # df = None
    r = get('https://widgets.sports-reference.com/wg.fcgi?css=1&site=bbr&url=%2Fteams%2F&div=div_teams_active')
    if r.status_code == 200:
        soup = BeautifulSoup(r.content, 'html.parser')
        print(str(soup.find('table')))
        print()
        print()

        #return str(table)
        #df = pd.read_html(str(table))[0]
        t = []
        rows = soup.find('table').findAll('tr')

        for row in rows:
            if not 'class="right"' in str(row.th):
                t.append(str(row))

        table = ''.join(t)
        print(table)

    # return df
