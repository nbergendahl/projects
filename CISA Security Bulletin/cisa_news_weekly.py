#! python3

import bs4
import requests
import re

#downloads the page
res = requests.get("https://www.cisa.gov/uscert/ncas/bulletins")

#makes sure the page was downloaded properly
res.raise_for_status()

#loads the downloaded html into beautiful soup
soup = bs4.BeautifulSoup(res.text, 'html.parser')

#selects the first link in the weekly bulletin list
#the most recent one is always the first list item
elems = soup.select('body > div > div.main-container.container.js-quickedit-main-content > div > section > div.region.region-content > div > div > div.view-content > div > ul > li:nth-child(1) > div > span > a')
#test print to see the value pulled
#can use regex to get the desired values
print(elems[0])


#creates regex object for finding the url field
urlRegex = re.compile(r'/ncas/bulletins/[a-z][a-z]\d\d-\d\d\d')

#processes regex on the html as a string
mo = urlRegex.search(str(elems[0]))

#prints regexs result for full url
url = mo.group()
url = 'https://www.cisa.gov/uscert' + url
print (url)


#creates regex object for getting the filename
urlRegex = re.compile(r'Vulnerability Summary for the Week of [A-Za-z][A-Za-z][A-Za-z] \d\d?, \d\d\d\d')

#processes regex on the html as a string
mo = urlRegex.search(str(elems[0]))

#prints regex result for full url
fileName = mo.group()
fileName = fileName + '.html'
print (fileName)


#download contents of the newest vulnerability bulletin
res = requests.get(url)

#loads the downloaded html into beautiful soup
soup = bs4.BeautifulSoup(res.text, 'html.parser')

#converts page object into a string
pageHTML = str(soup)

#puts the html contents into a file in the script directory
with open(fileName, "w") as file:
    file.write(pageHTML)

