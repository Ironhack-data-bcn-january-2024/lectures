import requests
from bs4 import BeautifulSoup
import pandas as pd
import requests
import time
import os
import matplotlib.pyplot as plt

from src.extracting import get_description_from_link
 

def build_dataframe (df):
    # 0. Get time
    ts = int(time.time())
    
    # 1. Build dataset
    df["Description"] = df["Links"].apply(get_description_from_link)
    
    # 2. Transform the dataset
    df["Prices"] = df["Prices"].apply(lambda x: x.replace(",","."))
    df["Prices"] = df["Prices"].astype("float")

    
    # 3. Export
    name = f"shoes-{ts}.csv"
    df.to_csv(f"data/{name}", index=False)
    
    return df