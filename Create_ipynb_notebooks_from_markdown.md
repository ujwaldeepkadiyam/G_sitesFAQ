1. Write text and code in markdown file .md
2. Insert the following code as header in markdown. Ensure that the versions match. Include ```---``` on the top and bottom. 
```
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
4. chat gpt can be used
5. avoid ``` --- ``` in the text.
6. Open gitbash/cmd from the folder where the markdown file is present.
7. Run the following command
```
jupytext --to notebook <file_name>.md
```
