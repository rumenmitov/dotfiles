config.load_autoconfig(False)
c.url.start_pages = ["https://searx.be/"]
config.source('themes/onedark.py')
c.url.searchengines = {"DEFAULT": "https://searx.be/?q={}"}
