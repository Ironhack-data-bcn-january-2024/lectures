import requests
from bs4 import BeautifulSoup
import pandas as pd
import requests
import time
import os
import matplotlib.pyplot as plt

import src.extracting as ext
import src.transforming as tr
import src.visualization as viz

# 1. Extracting
df = ext.shoes("https://www.murallasport.com/29-zapatillas-moda-mujer")

# 2. Transforming
df = tr.build_dataframe (df)

# 3. Visualizing
viz.barplot_price(df)
viz.barplot_count(df)

# 4. Voice feedback
os.system("say report created")