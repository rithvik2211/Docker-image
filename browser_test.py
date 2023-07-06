from selenium.webdriver import Edge
from selenium.webdriver.edge.options import Options
from selenium.webdriver.edge.service import Service

# while True:
#     t = 1


options = Options()
options.add_argument("--headless=new")

path = Service('/app/msedgedriver.exe')

driver = Edge(options=options, service= path)
# try:
url = 'https://www.google.com/'
driver.get(url)
print('browser opened')
# except:
    # print('ERROR: -- browser not opened')