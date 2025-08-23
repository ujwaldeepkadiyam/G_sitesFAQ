- create slides in pdf. you can use marp or latex or powerpoint for this.
- then run the notebook by uploading this pdf in colab
- colab link is
```url
https://colab.research.google.com/drive/1fcc1G1OCaaKMGrv4LtOn6ygkORsiVgWt#scrollTo=Dm1LNHWPUT0B
```
- download slides_images.zip and slides.marp.md
- open them in marp.
- export it as html in marp
- upload this exported marp html slideshow and slides_images/ folder to github.io
- this will allow users to download slideshow as html but no images will be downloaded, so it will be empty.
- **addendum**: The python note book code is given below:
  
```python
!pip install pdf2image nbformat
!apt-get install -y poppler-utils
```
```python
from pdf2image import convert_from_path
import os
import zipfile

# --- PDF input and output ---
pdf_path = "Session-1-BASIC NAVIGATION AND PROGRAMMING-ujwal.pdf"
output_folder = "slides_images"
zip_filename = "slides_images.zip"

os.makedirs(output_folder, exist_ok=True)

# --- Convert PDF pages to PNG ---
pages = convert_from_path(pdf_path, dpi=150)
for i, page in enumerate(pages, start=1):
    filename = f"{output_folder}/slide-{i:03}.png"
    page.save(filename, "PNG")

print(f"✅ Saved {len(pages)} images in {output_folder}/")

# --- Create ZIP file ---
with zipfile.ZipFile(zip_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
    for img_file in sorted(os.listdir(output_folder)):
        if img_file.lower().endswith(".png"):
            zipf.write(os.path.join(output_folder, img_file), arcname=img_file)

print(f"✅ Created ZIP file: {zip_filename}")
```
```python
import os

# --- Config ---
image_folder = "slides_images"       # folder with PNG slides
output_md = "slides.marp.md"         # name of markdown file

# --- Collect PNGs ---
images = sorted([f for f in os.listdir(image_folder) if f.lower().endswith(".png")])

# --- Marp front-matter (no theme) ---
markdown = """---
marp: true
# paginate: true
---
"""

# --- Add one slide per image ---
for img in images:
    markdown += f"---\n\n![bg]({image_folder}/{img})\n\n\n"

# --- Save the file ---
with open(output_md, "w", encoding="utf-8") as f:
    f.write(markdown)

print(f"✅ Created {output_md} with {len(images)} slides")
```



  
