# importing-geojsons-into-mongodb

geoJSONS work for our maps libraries. If we wanted to import it into MongoDB compass, we could. However, it would be imported as one single document instead of a document per polygon; so there's something we need to do.

To download one:

```python
from pymongo import MongoClient
import pandas as pd
import json
import os

link = "https://gist.githubusercontent.com/cdolek/d08cac2fa3f6338d84ea/raw/ebe3d2a4eda405775a860d251974e1f08cbe4f48/SanFrancisco.Neighborhoods.json"
os.system(f"curl '{link}' > sf.geojson")

with open("sf.geojson") as f:
    san_francisco = json.load(f)
san_francisco
```

It will usually have this structure:

```python
{'type': 'FeatureCollection',
 'features': [{'geometry': {'geometries': [{'type': 'Polygon',
      'coordinates': [[[-122.391701, 37.794113],
        [-122.39198, 37.793906],
        [-122.391614, 37.793571],
        [-122.391714, 37.793459],
        [-122.388816, 37.791005],
        [-122.388932, 37.790919],
        [-122.388616, 37.790348],
        [-122.388076, 37.790518],
        [-122.388375, 37.790334],
        [-122.388225, 37.790032],
        (...)
```

The goal is to remove the first part.

We want to remove:

```python
{'type': 'FeatureCollection',
 'features':
```

and keep:

```python
[{'geometry': {'geometries': [{'type': 'Polygon',
      'coordinates': [[[-122.391701, 37.794113],
        [-122.39198, 37.793906],
        [-122.391614, 37.793571],
        [-122.391714, 37.793459],
        [-122.388816, 37.791005],
        [-122.388932, 37.790919],
        [-122.388616, 37.790348],
        [-122.388076, 37.790518],
        [-122.388375, 37.790334],
        [-122.388225, 37.790032],
        (...)
```

You have two options

# 1. Python

```python
client = MongoClient("localhost:27017")
db = client["test"]
c = db.get_collection("test")

for i in san_francisco["features"]:
    c.insert_one({“geo”: i["geometry"]["geometries"][0], “name”: i["properties"]})
```

# 2. Manually & with compass

```python
# 1. Open the file
# 2. Delete that first part
# 3. Make sure that the object makes sene: if you get rid off an opening bracket/curly bracket, do you need to the the same for the end of the file?
# 4. On compass, add your file to your collection. You should have a document for each polygon in your collection.

```
