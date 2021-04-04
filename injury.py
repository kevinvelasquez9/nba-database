from basketball_reference_scraper.injury_report import get_injury_report

def save_injury():
    df = get_injury_report()
    df.to_csv('results/injury.txt', sep='\t', index=False)
