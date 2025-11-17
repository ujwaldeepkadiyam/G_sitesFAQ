# ✅ **Method 1: Change Jupyter Start Folder Using Anaconda Navigator (Easiest)**

1. Open **Anaconda Navigator**
2. Go to **Environments** (optional)
3. Click **Home**
4. Under *Jupyter Notebook*, click the **three dots (…)**
5. Select **"Open with Options"**
6. Choose **"Working Directory"**
7. Browse and select your desired folder
8. Launch Jupyter

This changes the directory **only for that session**.

---

# ✅ **Method 2: Permanent Change via jupyter_notebook_config.py**

### Step 1: Generate the config file

Open Anaconda Prompt:

```bash
jupyter notebook --generate-config
```

This will create:

```
C:\Users\<YourUsername>\.jupyter\jupyter_notebook_config.py
```

### Step 2: Open the file

Go to:

```
C:\Users\<YourUsername>\.jupyter\
```

Open **jupyter_notebook_config.py** in Notepad.

### Step 3: Find this line:

```python
#c.NotebookApp.notebook_dir = ''
```

Uncomment and set your desired path:

```python
c.NotebookApp.notebook_dir = 'D:/MyProjects'
```

(Use **forward slashes** or **double backslashes**.)

### Step 4: Save → restart Jupyter

Now Jupyter always opens in that directory.

---

# ✅ **Method 3: Change directory from Anaconda Prompt (Temporary)**

Open Anaconda Prompt:

```bash
cd D:\MyProjects
jupyter notebook
```

This opens Jupyter in **that folder for the session only**.

---

# ✅ **Method 4: Modify Jupyter Shortcut (Permanent)**

1. Right-click **Anaconda Navigator / Jupyter Notebook** shortcut
2. Choose **Properties**
3. In **Start in:** field → set your path

Example:

```
D:\MyProjects
```

Click **Apply** → **OK**.

---



