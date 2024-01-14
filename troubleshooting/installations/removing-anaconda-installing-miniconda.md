# removing-anaconda-installing-miniconda

## macOS

1. Download and install miniconda [here](https://docs.conda.io/en/latest/miniconda.html). Choose `.pkg` file.

```bash
# 2. Linking miniconda with your terminal

conda init zsh
```

3. Re-start your terminal

```bash
# 4. Create environment
conda create -y -n ironhack
conda activate ironhack

# 5. Install jupyter notebooks
conda install -y -c anaconda jupyter

# 6. Installing kernel
conda install -y -c anaconda ipykernel
python -m ipykernel install --user --name=ironhack

# 7. Extensions
conda install -y -c conda-forge jupyter_contrib_nbextensions
```

8. Kill and reopen terminal. Then:

```bash
# 8.1. On one terminal window
conda activate ironhack
jupyter notebooks #this will start notebooks
```

```bash
# 8.2. On a second new terminal window
conda activate ironhack
```

## windows

1. Download miniconda [here](https://docs.conda.io/en/latest/miniconda.html).

1.2. IMPORTANT: When installing, choose "Add miniconda to PATH" even if it's says not recommended.

![](https://www.discoduroderoer.es/wp-content/uploads/2020/04/miniconda_windows_4.png)

```bash
# 2. Linking miniconda with your terminal

conda init bash
```

3. Re-start your terminal

```bash
# 4. Create environment
conda create -y -n ironhack
conda activate ironhack

# 5. Install jupyter notebook
conda install -y -c anaconda jupyter

# 6. Installing kernel
conda install -y -c anaconda ipykernel
python -m ipykernel install --user --name=ironhack

# 7. Extensions
conda install -y -c conda-forge jupyter_contrib_nbextensions
```

8. Kill and reopen terminal. Then:

```bash
# 8.1. On one terminal window
conda activate ironhack
jupyter notebook #this will start notebooks
```

```bash
# 8.2. On a second new terminal window
conda activate ironhack
```
