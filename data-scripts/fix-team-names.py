import csv
TEAM_TO_TEAM_ABBR = {
    'ATLANTA HAWKS': 'ATL',
    'ST. LOUIS HAWKS': 'ATL',
    'MILWAUKEE HAWKS': 'ATL',
    'TRI-CITIES BLACKHAWKS': 'ATL',
    'STL': 'ATL',
    'SLH': 'ATL',
    # 'MIL': 'ATL',
    'TCB': 'ATL',
    'MLH': 'ATL',

    'BOSTON CELTICS': 'BOS',

    'BROOKLYN NETS': 'BRK',
    'NEW JERSEY NETS': 'BRK',
    'NEW YORK NETS': 'BRK',
    'NJN': 'BRK',
    'NYN': 'BRK',

    'CHICAGO BULLS': 'CHI',

    'CHARLOTTE HORNETS': 'CHA',
    'CHARLOTTE BOBCATS': 'CHA',
    'CHO': 'CHA',
    'CHH': 'CHA',

    'CLEVELAND CAVALIERS': 'CLE',

    'DALLAS MAVERICKS': 'DAL',

    'DENVER NUGGETS': 'DEN',

    'DETROIT PISTONS': 'DET',
    'FORT WAYNE PISTONS': 'DET',
    'FWP': 'DET',
    'FTW': 'DET',

    'GOLDEN STATE WARRIORS': 'GSW',
    'SAN FRANCISCO WARRIORS': 'GSW',
    'PHILADELPHIA WARRIORS': 'GSW',
    'SFW': 'GSW',
    'PHI': 'GSW',
    'PHW': 'GSW',

    'HOUSTON ROCKETS': 'HOU',
    'SAN DIEGO ROCKETS': 'HOU',
    'SDO': 'HOU',

    'INDIANA PACERS': 'IND',
    'INO': 'IND',

    'LOS ANGELES CLIPPERS': 'LAC',
    'SAN DIEGO CLIPPERS': 'LAC',
    'BUFFALO BRAVES': 'LAC',
    'SDC': 'LAC',
    'BUF': 'LAC',

    'LOS ANGELES LAKERS': 'LAL',
    'MINNEAPOLIS LAKERS': 'LAL',
    'MIN': 'LAL',
    'MNL': 'LAL',

    'MEMPHIS GRIZZLIES': 'MEM',
    'VANCOUVER GRIZZLIES': 'MEM',
    'VAN': 'MEM',

    'MIAMI HEAT': 'MIA',

    'MILWAUKEE BUCKS': 'MIL',

    'MINNESOTA TIMBERWOLVES': 'MIN',

    'NEW ORLEANS PELICANS': 'NOP',
    'NEW ORLEANS/OKLAHOMA CITY HORNETS': 'NOP',
    'NEW ORLEANS HORNETS': 'NOP',
    'NOK': 'NOP',
    'NOH': 'NOP',

    'NEW YORK KNICKS': 'NYK',

    'OKLAHOMA CITY THUNDER': 'OKC',
    'SEATTLE SUPERSONICS': 'OKC',
    'SEA': 'OKC',

    'ORLANDO MAGIC': 'ORL',

    'PHILADELPHIA 76ERS': 'PHI',
    'SYRACUSE NATIONALS': 'PHI',
    'SYR': 'PHI',

    'PHOENIX SUNS': 'PHX',
    'PHO': 'PHX',

    'PORTLAND TRAIL BLAZERS': 'POR',

    'SACRAMENTO KINGS': 'SAC',
    'KANSAS CITY KINGS': 'SAC',
    'KANSAS CITY-OMAHA KINGS': 'SAC',
    'CINCINNATI ROYALS': 'SAC',
    'ROCHESTER ROYALS': 'SAC',
    'KCK': 'SAC',
    'CIN': 'SAC',
    'ROR': 'SAC',
    'ROC': 'SAC',
    'KCO': 'SAC',

    'SAN ANTONIO SPURS': 'SAS',

    'TORONTO RAPTORS': 'TOR',

    'UTAH JAZZ': 'UTA',
    'NEW ORLEANS JAZZ': 'UTA',
    'NOJ': 'UTA',

    'WASHINGTON WIZARDS': 'WAS',
    'WASHINGTON BULLETS': 'WAS',
    'CAPITAL BULLETS': 'WAS',
    'BALTIMORE BULLETS': 'WAS',
    'CHICAGO ZEPHYRS': 'WAS',
    'CHICAGO PACKERS': 'WAS',
    'CAP': 'WAS',
    'BAL': 'WAS',
    'CHI': 'WAS',
    'CHI': 'WAS',
    'WSB': 'WAS',

    # DEFUNCT FRANCHISES
    'ANDERSON PACKERS': 'AND',
    'CHICAGO STAGS': 'CHI',
    'INDIANAPOLIS OLYMPIANS': 'IND',
    'SHEBOYGAN RED SKINS': 'SRS',
    'ST. LOUIS BOMBERS': 'SLB',
    'WASHINGTON CAPITOLS': 'WAS',
    'WATERLOO HAWKS': 'WAT',
}


with open('../data/full/team.csv', 'r', encoding="utf8") as in_file:
    with open('../temp.csv', 'a', newline='', encoding="utf8") as out_file:
        in_reader = csv.reader(in_file, delimiter=',')
        out_writer = csv.writer(out_file, delimiter=',')

        for row in in_reader:
            line = []
            for col in row:
                if col.upper() in TEAM_TO_TEAM_ABBR.keys():
                    line.append(TEAM_TO_TEAM_ABBR[col.upper()])
                else:
                    line.append(col)
            out_writer.writerow(line)