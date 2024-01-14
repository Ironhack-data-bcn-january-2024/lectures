```python
from getpass import getpass
import pandas as pd
import os

import pymysql # pip install pymysql
import sqlalchemy as alch # bash: conda activate ironhack; python -m pip install --upgrade 'sqlalchemy<2.0'


# 0. Variables

df = pd.DataFrame({"column1": [1, 2, 3], "column2": ["a", "b", "c"]})
table = 'example'

# 1. First, go to MySQL and create a database

# 2. Establish connection to the database
def connect_to_database (dbName):
    password = getpass()
    connectionData=f"mysql+pymysql://root:{password}@localhost/{dbName}"
    engine = alch.create_engine(connectionData)
    return engine

engine = connect_to_database ("ola")

# 3. Obtaining information about the data
def pandas_to_mysql_type(pandas_type):
    type_mapping = {
        'int64': 'INT',
        'float64': 'FLOAT',
        'object': 'TEXT',
        'datetime64': 'DATETIME',
    }
    return type_mapping.get(str(pandas_type), 'TEXT')

# 4. Creating the table
def create_table_query(df, table_name):
    columns = [f"{col} {pandas_to_mysql_type(df[col].dtype)}" for col in df.columns]
    query = f"CREATE TABLE IF NOT EXISTS {table_name} ({', '.join(columns)});"
    engine.execute(query)

# 5. Inserting information into MySQL through python

sql_query = create_table_query(df, table)
sql_query

for index, row in df.iterrows():
    query = f"""INSERT INTO {table} VALUES ("{row['column1']}", "{row['column2']}")"""
    engine.execute(query)


df_query = pd.read_sql_table(table, con=engine)
df_query
```
