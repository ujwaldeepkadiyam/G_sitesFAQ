1. Create a mark down file (Use VSCode).
2. Save it in your preferred directory.
3. Open git bash in the folder where this markdown file is present.
4. Activate conda environment

     a) This is the python version that is used.
   
     b) jupytertext should be installed in this environment. Run the command below to install it.
   
          ```python
          pip install jupytext
         ```
   
     c) Activate this conda environment using,
   
        ```
        conda activate base
        ```
   
5. Then run the following command
    ```
    jupytext --to notebook file_name.md
    ```


