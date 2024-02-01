import requests
from bs4 import BeautifulSoup
import pandas as pd
import requests
import time
import os


def shoes (url):
    
    # 0. Requesting & parsing
    html = requests.get(url)
    soup = BeautifulSoup(html.content, "html.parser") 
    print("------- Scrapping main website -------")

    
    # 1. Names
    list_of_names = soup.find_all("div", {"class":"name_product_box"})
    names = [i.getText().strip() for i in list_of_names]
    
    # 2. Brands
    list_of_brands = soup.select("span.marca-product-box")
    brands = [i.getText().strip() for i in list_of_brands]
    
    # 3. Prices
    list_of_prices = soup.find_all("div", {"class":"price_product_box"})
    prices = [i.getText().strip().split("€")[0] for i in list_of_prices]

    
    # 4. Links
    list_of_links = soup.find_all("a", {"class":"url_producto"})
    links = ["https://www.murallasport.com" + i.get("href") for i in list_of_links]
    
    dict_ = {
        "Names": names,
        "Brands": brands,
        "Prices": prices,
        "Links": links
    }
    
    return pd.DataFrame(dict_)
    
    
def get_description_from_link (url):
    
    # 0. Requesting & parsing
    html = requests.get(url)
    soup = BeautifulSoup(html.content, "html.parser") 
    print("------- Scrapping description -------")
    
    description = soup.find("div", {"id":"description"})
    return description.getText().strip()
   

