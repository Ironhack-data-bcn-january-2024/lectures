import requests
from bs4 import BeautifulSoup
import pandas as pd
import requests
import time
import os
import matplotlib.pyplot as plt

def barplot_price(df):
    df.groupby("Brands").agg({"Prices":"mean"}).sort_values(by="Prices", ascending=False).plot(kind="bar")
    
    mean_price = df["Prices"].mean()
    plt.axhline(mean_price, c="red", linestyle="--")
    
    plt.xticks(rotation=45)
    plt.title("Average price per brand", size=20)
    plt.ylabel("Price", size=15)
    plt.xlabel("Brands", size=15)
    
    name_export = "average_price_per_brand.png"
    plt.savefig(f"images/{name_export}")
    os.system(f"open images/{name_export}")
    
def barplot_count(df):
    df.groupby("Brands").agg({"Prices":"count"}).sort_values(by="Prices", ascending=False).plot(kind="bar")
        
    plt.xticks(rotation=45)
    plt.title("Count per brand", size=20)
    plt.ylabel("Count", size=15)
    plt.xlabel("Brands", size=15)
    
    name_export = "count_per_brand.png"
    plt.savefig(f"images/{name_export}")
    os.system(f"open images/{name_export}")
    
    
