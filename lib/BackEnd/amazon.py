
# Create an Extractor by reading from the YAML file


class Amazon():

    def scrape(url):
        def get_price(url, r):
            soup = BeautifulSoup(r.content, "html.parser")
            try:
                temp_price = soup.find(
                    id="priceblock_ourprice").get_text().strip()
            except Exception:
                try:
                    temp_price = soup.find(
                        id="priceblock_dealprice").get_text().strip()
                except Exception:
                    temp_price = "N/A"

            return temp_price

        import requests
        from bs4 import BeautifulSoup
        import json
        from selectorlib import Extractor
        import requests
        import json
        from time import sleep
        import mysql.connector

        e = Extractor.from_yaml_file('selectors.yml')

        mydb = mysql.connector.connect(
            host="localhost", user="root", passwd="logon@123", database="EASY_SHOP")
        mycursor = mydb.cursor()

        stores = {
            "in": "INDIA",
            "ae": "UNITED ARAB EMIRATES",
            "com.br": "BRAZIL",
            "ca": "CANADA",
            "com.mx": "MEXICO",
            "com": "UNITED STATES",
            "sg": "SINGAPORE",
            "com.tr": "TURKEY",
            "fr": "FRANCE",
            "nl": "NETHERLANDS",
            "es": "SPAIN",
            "co.uk": "UNITED KINGDOM",
            "com.au": "AUSTRALIA"


        }
        if "https://www.amazon." in url:
            i = url
            a_index = i.index("amazon.")
            temp_i = i[a_index:]
            slash_index = temp_i.index("/")
            domain = temp_i[7:slash_index]
            store = stores[domain]
            indexx = url.index("/dp/")
            asin = ""
            temp = url[indexx + 4:]
            for i in temp:
                if i == "/" or i == "?":
                    break
                else:
                    asin = asin+i
            headers = {
                'authority': 'www.amazon.com',
                'pragma': 'no-cache',
                'cache-control': 'no-cache',
                'dnt': '1',
                'upgrade-insecure-requests': '1',
                'user-agent': "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0) Gecko/20100101 Firefox/84.0",
                'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
                'sec-fetch-site': 'none',
                'sec-fetch-mode': 'navigate',
                'sec-fetch-dest': 'document',
                'accept-language': 'en-GB,en-US;q=0.9,en;q=0.8',
            }

            # Download the page using requests
            r = requests.get(url, headers=headers)
            # Simple check to check if page was blocked (Usually 503)
            if r.status_code > 500:
                if "To discuss automated access to Amazon data please contact" in r.text:
                    print(
                        "Page %s was blocked by Amazon. Please try using better proxies\n" % url)
                else:
                    print("Page %s must have been blocked by Amazon as the status code was %d" % (
                        url, r.status_code))
                    return None
            # Pass the HTML of the page and create
            name = e.extract(r.text)["name"]
            price = e.extract(r.text)["price"]
            image = e.extract(r.text)["images"]

            if price == None:
                price = get_price(url, r)
            if price != "N/A":
                for i in range(len(price)):
                    if price[i].isdigit():
                        break
                price = price[i:].strip()
                temp = ""
                if domain in ["ca", "com.mx", "com", "cn", "in", "jp", "sg", "ae", "co.uk", "com.au", "sa"]:
                    if "." not in price:
                        price = price+".00"
                    try:
                        price = float(price)

                    except Exception:
                        for i in price:
                            if i.isdigit() == True or i == "," or i == ".":
                                temp = temp + i
                        temp = temp.replace(",", "")
                        if temp.count(".") == 2:
                            indexx = temp.index(".")
                            temp = temp[:indexx] + temp[indexx + 1:]
                        price = float(temp)
                else:
                    if "," not in price:
                        price = price + ",00"
                    temp_price = price
                    price = ""
                    for i in temp_price:
                        if i.isdigit() == True or i == "," or i == ".":
                            price = price + i

                    after_decimal = price[-3:]
                    before_decimal = price[:-3]
                    before_decimal = before_decimal.replace(".", ".")
                    after_decimal = after_decimal.replace(",", ".")
                    price = before_decimal + after_decimal
                    price = float(price)
            url = url

            # print(domain, asin, price, image)
            # return e.extract(r.text)
            image = json.loads(image)
            for i in image.keys():
                image = i
                break
            det = [asin, name, price, url, image, store]

            return det


a = Amazon.scrape("google.com")
