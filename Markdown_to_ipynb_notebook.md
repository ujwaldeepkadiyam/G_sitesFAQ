1. Create a mark down file (Use VSCode). Insert the following as header in markdown
```markdown
---
jupyter:
  jupytext:
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.16.1
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---
```

2. Save it in your preferred directory.
3. Open git bash in the folder where this markdown file is present.
4. Activate conda environment
4a. This is the python version that is used.
   
4b. jupytertext should be installed in this environment. Run the command below to install it.

```python
pip install jupytext
```     
         
4c. Activate this conda environment using,
   
```
conda activate base
```
   
5. Then run the following command
 
```
jupytext --to notebook file_name.md
```


