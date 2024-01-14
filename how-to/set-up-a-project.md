# set-up-a-project

## Checklist

1. Create a github repository in your own account. You don't need to fork anyone else's, just create one for yourself.
2. Give it whatever name you deem necessary. Just keep in mind that if you change the name of the project later on, it'll be changed also in the link _(that may also affect your local repo)_.
3. This is a general structure of any repo:

```bash
data/
images/
src/
    extraction.py
    transformation.py
    visualization.py
main.py
notebook_1.ipynb
.gitignore
README.md
requirements.txt
environment.yml
```

### What each file is for

- `data/` directory:
  - It will have the necessary files containing data.
  - Alternatively, you can substitute the `data/` directory by: - `input/` - `output/`
    as you will be processing raw data and will want to export a clean version.
- `images/` directory: This directory is for you to have:
  - support files: images you may want to embed into notebooks
  - exported visualizations
- `src/` directory: this directory holds the source code of the project. This is where the code is **defined**. Your functions should be within python files `.py` within this folder. The content of the folder will depend on the logic of the project. The following files are usually the one used for our projects.

- modules within src:

  - `extraction.py`: This will contain files used for extraction. This can be: web-scrapping, apis connections, integration with google sheets, functions that read various files and concatenate them, etc.
  - `transformation.py`: Here you include all of those functions used to wrangle your data: dropping columns, standarizing strings, managing null values, transforming columns, creating new ones, etc.
  - `visualization.py`: Here you should have functions specifically to plot and save images.

  You may also have other files. This is just a suggestion, but you may structure this differently. Criteria is: different goal, different file.

  - `exploration.py`: Here you should have exploration functions in the case you have a thorough exploration of data.
  - `connection.py`: maybe you want to have specific functions to connect to different databases. How would this be different from having a connection function within the extraction.py file? Here you could have the connection and within extraction you could have the actual queries.
  - `helpers.py`: here you could have auxiliary functions that helped you along the process. For instance, functions that give you printed feedback on things.

  Again, you may structure the code as you deem necessary.

- `main.py`: is where you **run** the code. Here you can import the functions defined in the `src/` directory. The point of having a `main.py` file is to have an executable file that will run a process from beginning to end. That way, code could be run by doing `python main.py`.

```python
import src.extraction as extraction
import src.transformation as transformation
import src.visualization as visualization

df = extraction.web_scrapping(url)
df_transformed = transformation.cleaning_things(df)
visualization.plot_things(df_transformed)
```

Saving functions into `src/` directory and importing it back is a process of: encapsulation (defining in functions) and modularization (saving into modules). Encapsulation and modularization s not only needed for the `main.py` file (it may not always be needed) but also to have clean jupyter notebooks where the code is run.

- `notebook_1.ipynb`: This can take any name, but make sure it is as descriptive as possible. Also try to number them according to the step of the process it contains. Ej.:

```bash
1_extracting.ipynb
2_cleaning.ipynb
3_visualizing.ipynb
```

Jupyter noteoboks should be:

- Free of errors
- Clean code
- Comments
- Markdown notations and titles
- Pictures, if it helps
- PRINTS SHOULD BE LIMITED: locally jupyter notebook compresses the output, but on github it's shown and it scrolls down to infinity. How to do then? Use things like: `df.sample()` or `df.head()` or `response[0]`, or `response[:10]`
- `.gitignore` file: this file prevents git from adding/commiting/pushing unwanted files. This is crucial to hide information like passwords and tokens. Also, helpful to remove files that clutter and deviate attention from the important stuff. You should have:

```bash
.env
```

within your .gitignore file. If you haven't still seen it, we'll see it later on. Also, make sure you hide the following files:

```bash
.DS_Store
.ipynb_checkpoints
__pycache__
```

All these are temporary files that you do not want on your repo. Why? Your repo is for you to manage your own versions of code, but also your portfolio. Make sure it's readable and presentable. Only keep whatever you need.

- `README.md`: Potentially one of the most important parts of your project. Refer to `lectures/how-to/readme` within the lectures repo for mor detail on README.md files.

The following files have the same goal: to keep track of the versions of the libraries used in your project. Why? So that your future self and other people can replicate your environment to make sure your beautiful code works as it's supposed to.

- `requirements.txt`: This is a list of libraries and versions. You can create it by doing:

```bash
conda activate ironhack
pip install pipreqs
pipreqs
```

Later on, someone will clone your project and will do:

```bash
conda create -n project_1
conda activate project_1
pip install -r requirements.txt # to install recursively the list of dependencies
```

- `environment.yml`: This will be doing something similar. It will directly export your environment so someone else can install it. To generate this file:

```bash
conda activate project_1
conda env export > project_1.yml
```

Later on, someone will:

```bash
conda env create --file project_1.yml
```

# CHECKLIST

1. You created a repo on your account ✅
2. You created the discussed structure ✅
3. You created:
   - `.env` file ✅
   - `.gitignore` file ✅
4. You added ".env" to your `.gitignore` ✅
5. You pushed at least once ✅
6. You copy the link of your own project ✅ into an issue on our project repo. Go to our repo: New Issue > paste the link to your project

**Caveats**

- Git will not push those directories that are empty, so it's not until you add things to `images/` and `data/` folders that they will be pushed to github.
- Commit frequently and with meaningful messages.

You're all set!
