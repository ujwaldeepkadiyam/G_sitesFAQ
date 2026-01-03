# ✅ COMPLETE WORKFLOW: LaTeX → Pandoc HTML → al-folio (with custom heading CSS)

---

## 0. A few points to remember
* Use the following structure in latex
```
\section{2. Data Cleaning}

\subsection{2.1 Handling Missing Values}

\subsubsection{2.1.1 Small Amount of Missing Data}

\textbf{Continuous Data}
Explanation text goes here.
```
* **Manually number** sections and subsections etc in `LaTeX → Pandoc` Workflow because 
   * Pandoc does **not execute LaTeX counters** (`\setcounter{}`) when converting to HTML.
   * Automatic section numbering in LaTeX is **not reliably preserved** in Pandoc HTML output.
   * Pandoc applies its **own numbering logic**, which can conflict with mid-document resets.
   * Mathematical expressions in headings are **removed or altered** by Pandoc in HTML.
   * Manual numbering ensures **identical numbering** in both PDF and HTML outputs.
   * It avoids reliance on Pandoc flags such as `--number-sections`.
   * It prevents broken anchors and missing references in HTML.
   * It keeps one **single source file** for both PDF and web publishing.
   * Manual numbering gives **full control** over chapter insertion and reordering.
   * This approach is **stable for long lecture notes and textbooks**.

**Rule of thumb:**
If the same document must produce **both LaTeX PDF and Pandoc HTML**, manual numbering is the safest and most predictable choice.
 * Dont `\underline{\textbf{something}}` in latex. Only `\textbf{}` and use css to underline it.
 * Images drawn using tikz wont render in pandoc. so insert images, then render using pandoc.

** Back to Top**

* back_to_toc.lua  : If you want table of contents, put this file in the same folder as .tex file and run pandoc with this command.

---

## 1. Create your project folder

```text
my-lecture/
   lect.tex
   style.css
   images/
       image1.jpg
       fig1.png
       diagram1.jpg
       mod-wheel.png
```

---

## 2. Create your LaTeX lecture file using the following preamble

`lect.tex`:

```tex
% --------------------------------------------------
% Page layout
% --------------------------------------------------
\usepackage[margin=2.5cm]{geometry}

% --------------------------------------------------
% Mathematics
% --------------------------------------------------
\usepackage{amsmath, amssymb}

% --------------------------------------------------
% Graphics and figures
% --------------------------------------------------
\usepackage{graphicx}
\usepackage{float}
\graphicspath{{images/}}

% --------------------------------------------------
% Colors and section formatting
% --------------------------------------------------
\usepackage{xcolor}
\usepackage{titlesec}

% --------------------------------------------------
% Lists
% --------------------------------------------------
\usepackage{enumitem}

% --------------------------------------------------
% Hyperlinks
% --------------------------------------------------
\usepackage{hyperref}

% --------------------------------------------------
% Paragraph spacing
% --------------------------------------------------
\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}
\emergencystretch=2em

% --------------------------------------------------
% Disable automatic numbering (manual numbering only)
% --------------------------------------------------
\setcounter{secnumdepth}{0}
% --------------------------------------------------
% For colors in tables
% --------------------------------------------------

\usepackage{colortbl}
\usepackage{xcolor}

% --------------------------------------------------
% Define colors
% --------------------------------------------------
\definecolor{myblue}{RGB}{0,0,255}
\definecolor{mypink}{HTML}{cc33cc}

% --------------------------------------------------
% Section styles (manual numbering)
% --------------------------------------------------
\titleformat{\section}
{\large\color{myblue}\bfseries\centering}
{}{0pt}
{\color{mypink}}

\titleformat{\subsection}
{\normalsize\color{myblue}\bfseries}
{}{0pt}
{\color{mypink}}

\titleformat{\subsubsection}
{\small\color{myblue}\bfseries}
{}{0pt}
{\color{mypink}}

% --------------------------------------------------
% TikZ (FIXED: positioning enabled)
% --------------------------------------------------
\usepackage{tikz}
\usetikzlibrary{arrows.meta, positioning,shapes.geometric}

% --------------------------------------------------
% tcolorbox (SAFE with listings)
% --------------------------------------------------
\usepackage[most]{tcolorbox}
\tcbuselibrary{listings, breakable}

\tcbset{
	before skip=8pt,
	after skip=8pt,
	boxrule=0.6pt,
	arc=2mm
}

% --------------------------------------------------
% Custom boxes
% --------------------------------------------------
\newtcolorbox{impbox}{
	colback=red!10,
	colframe=red!45,
	breakable
}

\newtcolorbox{labbox}{
	colback=green!6,
	colframe=green!50!black,
	breakable
}

\newtcblisting{codebox}{
	colback=blue!5,
	colframe=blue!55!black,
	boxrule=0.7pt,
	arc=2mm,
	breakable,
	listing only,
	listing options={
		language=Python,
		basicstyle=\ttfamily\small,
		columns=fullflexible,
		breaklines=true,
		showstringspaces=false,
		tabsize=4
	}
}

% -------------------- Title --------------------
\title{\textbf{ML End-to-End Project Steps}}
\author{}
\date{}

\begin{document}
	\maketitle
matter here
\end{document}
```

Note:

* Image path is `images/image1.jpg` and **folder structure must match**.

---

## 3. (Optional) CSS for local HTML preview

This is only for your **local** `lect.html` preview, not required by al-folio.

`style.css`:

```css
<style>
/* ================================
   Wrapper for Pandoc content
   ================================ */
.notes-content {
  max-width: 900px;
  margin: auto;
  line-height: 1.6;
}

.notes-content img {
  max-width: 100% !important;
  height: auto !important;
  display: block;
  margin: 14px auto;
}


/* ================================
   Headings (match LaTeX style)
   ================================ */
.notes-content h1 {
  color: #cc33cc;
  font-weight: bold;
  text-align: center;
  margin-top: 1.4em;
  margin-bottom: 0.6em;
}

.notes-content h2,
.notes-content h3,
.notes-content h4,
.notes-content h5,
.notes-content h6 {
  color: #cc33cc;
  font-weight: normal;
  text-align: left;
  margin-top: 1.2em;
  margin-bottom: 0.5em;
}

/* Prevent strong from overriding heading color */
.notes-content h1 strong,
.notes-content h2 strong,
.notes-content h3 strong,
.notes-content h4 strong {
  color: inherit;
}


/* ================================
   Tables (CRITICAL)
   ================================ */
.notes-content table {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
  font-size: 0.95em;
}

.notes-content th,
.notes-content td {
  border: 1px solid #444;
  padding: 8px 10px;
  text-align: center;
  vertical-align: middle;
}

.notes-content th {
  background-color: #f6e9ff;
  color: #cc33cc;
  font-weight: bold;
}

.notes-content tr:nth-child(even) {
  background-color: #fafafa;
}

/* ================================
   tcolorbox equivalents
   ================================ */
.notes-content .tcolorbox {
  padding: 12px 14px;
  margin: 16px 0;
  border-radius: 6px;
}

/* Important box */
.notes-content .impbox {
  background-color: #ffe6e6;
  border: 1px solid #cc3333;
}

/* Lab / activity box */
.notes-content .labbox {
  background-color: #eef9ee;
  border: 1px solid #339966;
}

/* Code box */
.notes-content .codebox {
  background-color: #f0f6ff;
  border: 1px solid #3366cc;
}

/* ================================
   Code formatting
   ================================ */
.notes-content .codebox pre,
.notes-content pre {
  margin: 0;
  font-family: Consolas, Monaco, monospace;
  font-size: 0.9em;
  overflow-x: auto;
}

/* ================================
   Pandoc Table of Contents
   ================================ */

#TOC {
  max-width: 900px;
  margin: 2em auto;
  padding: 1em 1.5em;
  background: #f8f9fb;
  border: 1px solid #ddd;
  border-radius: 8px;
}

#TOC h2 {
  text-align: center;
  color: #cc33cc;
  margin-bottom: 0.5em;
}

#TOC ul {
  list-style: none;
  padding-left: 0;
}

#TOC li {
  margin: 6px 0;
}

#TOC a {
  text-decoration: none;
  color: #0033aa;
}

#TOC a:hover {
  text-decoration: underline;
}

/* =========================================
   Wrapper
   ========================================= */
.notes-content {
  max-width: 900px;
  margin: auto;
  line-height: 1.65;
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}

/* =========================================
   IMPORTANT BOX (impbox)
   ========================================= */
.notes-content .impbox {
  background-color: #ffe6e6;
  border: 1.5px solid #cc3333;
  border-radius: 10px;
  padding: 14px 16px;
  margin: 18px 0;
  font-weight: bold;
}

/* =========================================
   LAB / ACTIVITY BOX (labbox)
   ========================================= */
.notes-content .labbox {
  background-color: #eef9ee;
  border: 1.5px solid #339966;
  border-radius: 10px;
  padding: 14px 16px;
  margin: 18px 0;
  font-weight: bold;
}


/* =========================================
   CODE BOX — LaTeX \ttfamily look (Pandoc)
   ========================================= */
.notes-content .codebox {
  background-color: #f0f6ff;
  border: 1.5px solid #3366cc;
  border-radius: 12px;
  padding: 14px 16px;
  margin: 20px 0;
}

/* Pandoc puts code as <p> inside .codebox */
.notes-content .codebox p {
  margin: 0;
  font-family:
    "Latin Modern Mono",
    "Computer Modern Typewriter",
    "JetBrains Mono",
    Consolas,
    "Courier New",
    monospace;

  font-size: 0.95em;
  font-weight: 700;              /* 🔑 makes it LaTeX-dark */
  line-height: 1.5;
  letter-spacing: 0.02em;
  white-space: pre-wrap;         /* keeps line breaks */
  word-break: break-word;

  color: #000;                   /* strong ink like PDF */
  background: transparent;
}

/* Inline code (Pandoc: <code>something</code>) */
.notes-content code {
  font-family:
    "Latin Modern Mono",
    "Computer Modern Typewriter",
    Consolas,
    monospace;

  font-weight: 700;
  background: #f4f6fb;
  padding: 2px 6px;
  border-radius: 6px;
  color: #cc33cc;
}

/* Subtle depth like your screenshot */
.notes-content .codebox {
  box-shadow: 0 3px 8px rgba(0,0,0,0.06);
}


/* =========================================
   Depth & polish
   ========================================= */
.notes-content .impbox,
.notes-content .labbox,
.notes-content .codebox {
  box-shadow: 0 3px 8px rgba(0,0,0,0.06);
}


/* =========================================
   Back-to-TOC navigation block
   ========================================= */

.notes-content .back-to-toc {
  margin-top: -0.4em;
  margin-bottom: 1.2em;
  text-align: right;
}

.notes-content .back-to-toc a {
  font-size: 1em;
  font-weight: 600;
  color: #0033aa;
  text-decoration: none;
  padding: 4px 10px;
  border-radius: 8px;
  background: #f4f6fb;
  border: 1px solid #ccd6f0;
}

.notes-content .back-to-toc a:hover {
  background: #e6ebff;
  border-color: #3366cc;
  text-decoration: underline;
}


</style>

```

---

## 4. Run Pandoc to export HTML with embedded resources

From inside `my-lecture/`:

```bash
pandoc ML_Project_Instructions_Handout_Website.tex \
  --from=latex \
  -s \
  -o lect.html \
  --toc \
  --toc-depth=1 \
  --wrap=preserve \
  --mathjax \
  --embed-resources \
  -c style.css \
  --resource-path=.:images \
  --lua-filter=back_to_toc.lua  # If you want table of contents, put this file in the same folder as .tex file and run pandoc with this command.

```

* `--embed-resources` → images + CSS inlined (Base64 etc.)
* `--resource-path=.:images` → lets Pandoc find `images/image1.jpg`
* `--lua-filter=back_to_toc.lua` . If you want table of contents, put this file in the same folder as .tex file and run pandoc with this command.

Output:

```text
lect.html  ← fully self-contained (math + images)
```
* If you want the sections to be numbered in html, then use this
```
  pandoc lect.tex \
  -s \
  -o lect.html \
  --mathjax \
  --embed-resources \
  -c style.css \
  --resource-path=.:images \
  --number-sections \
  --toc \
  --toc-depth=4
```

---

## 5. Preview the HTML

Just double-click:

```text
lect.html
```

Check:

* equations render
* image appears
* page scrolls like a long note

---

## 6. Create your al-folio page

Create:

```text
_pages/algebra.html
```

Add YAML front matter at the top:

```yaml
---
layout: page
title: Algebraic Structures – Lecture Notes
---
```

---

## 7. Insert custom heading CSS + wrapper

Right below the YAML, paste **this exact block**:

```html
<style>
/* ================================
   Wrapper for Pandoc content
   ================================ */
.notes-content {
  max-width: 900px;
  margin: auto;
  line-height: 1.6;
}

.notes-content img {
  max-width: 100% !important;
  height: auto !important;
  display: block;
  margin: 14px auto;
}


/* ================================
   Headings (match LaTeX style)
   ================================ */
.notes-content h1 {
  color: #cc33cc;
  font-weight: bold;
  text-align: center;
  margin-top: 1.4em;
  margin-bottom: 0.6em;
}

.notes-content h2,
.notes-content h3,
.notes-content h4,
.notes-content h5,
.notes-content h6 {
  color: #cc33cc;
  font-weight: normal;
  text-align: left;
  margin-top: 1.2em;
  margin-bottom: 0.5em;
}

/* Prevent strong from overriding heading color */
.notes-content h1 strong,
.notes-content h2 strong,
.notes-content h3 strong,
.notes-content h4 strong {
  color: inherit;
}


/* ================================
   Tables (CRITICAL)
   ================================ */
.notes-content table {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
  font-size: 0.95em;
}

.notes-content th,
.notes-content td {
  border: 1px solid #444;
  padding: 8px 10px;
  text-align: center;
  vertical-align: middle;
}

.notes-content th {
  background-color: #f6e9ff;
  color: #cc33cc;
  font-weight: bold;
}

.notes-content tr:nth-child(even) {
  background-color: #fafafa;
}

/* ================================
   tcolorbox equivalents
   ================================ */
.notes-content .tcolorbox {
  padding: 12px 14px;
  margin: 16px 0;
  border-radius: 6px;
}

/* Important box */
.notes-content .impbox {
  background-color: #ffe6e6;
  border: 1px solid #cc3333;
}

/* Lab / activity box */
.notes-content .labbox {
  background-color: #eef9ee;
  border: 1px solid #339966;
}

/* Code box */
.notes-content .codebox {
  background-color: #f0f6ff;
  border: 1px solid #3366cc;
}

/* ================================
   Code formatting
   ================================ */
.notes-content .codebox pre,
.notes-content pre {
  margin: 0;
  font-family: Consolas, Monaco, monospace;
  font-size: 0.9em;
  overflow-x: auto;
}

/* ================================
   Pandoc Table of Contents
   ================================ */

#TOC {
  max-width: 900px;
  margin: 2em auto;
  padding: 1em 1.5em;
  background: #f8f9fb;
  border: 1px solid #ddd;
  border-radius: 8px;
}

#TOC h2 {
  text-align: center;
  color: #cc33cc;
  margin-bottom: 0.5em;
}

#TOC ul {
  list-style: none;
  padding-left: 0;
}

#TOC li {
  margin: 6px 0;
}

#TOC a {
  text-decoration: none;
  color: #0033aa;
}

#TOC a:hover {
  text-decoration: underline;
}

/* =========================================
   Wrapper
   ========================================= */
.notes-content {
  max-width: 900px;
  margin: auto;
  line-height: 1.65;
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}

/* =========================================
   IMPORTANT BOX (impbox)
   ========================================= */
.notes-content .impbox {
  background-color: #ffe6e6;
  border: 1.5px solid #cc3333;
  border-radius: 10px;
  padding: 14px 16px;
  margin: 18px 0;
  font-weight: bold;
}

/* =========================================
   LAB / ACTIVITY BOX (labbox)
   ========================================= */
.notes-content .labbox {
  background-color: #eef9ee;
  border: 1.5px solid #339966;
  border-radius: 10px;
  padding: 14px 16px;
  margin: 18px 0;
  font-weight: bold;
}


/* =========================================
   CODE BOX — LaTeX \ttfamily look (Pandoc)
   ========================================= */
.notes-content .codebox {
  background-color: #f0f6ff;
  border: 1.5px solid #3366cc;
  border-radius: 12px;
  padding: 14px 16px;
  margin: 20px 0;
}

/* Pandoc puts code as <p> inside .codebox */
.notes-content .codebox p {
  margin: 0;
  font-family:
    "Latin Modern Mono",
    "Computer Modern Typewriter",
    "JetBrains Mono",
    Consolas,
    "Courier New",
    monospace;

  font-size: 0.95em;
  font-weight: 700;              /* 🔑 makes it LaTeX-dark */
  line-height: 1.5;
  letter-spacing: 0.02em;
  white-space: pre-wrap;         /* keeps line breaks */
  word-break: break-word;

  color: #000;                   /* strong ink like PDF */
  background: transparent;
}

/* Inline code (Pandoc: <code>something</code>) */
.notes-content code {
  font-family:
    "Latin Modern Mono",
    "Computer Modern Typewriter",
    Consolas,
    monospace;

  font-weight: 700;
  background: #f4f6fb;
  padding: 2px 6px;
  border-radius: 6px;
  color: #cc33cc;
}

/* Subtle depth like your screenshot */
.notes-content .codebox {
  box-shadow: 0 3px 8px rgba(0,0,0,0.06);
}


/* =========================================
   Depth & polish
   ========================================= */
.notes-content .impbox,
.notes-content .labbox,
.notes-content .codebox {
  box-shadow: 0 3px 8px rgba(0,0,0,0.06);
}


/* =========================================
   Back-to-TOC navigation block
   ========================================= */

.notes-content .back-to-toc {
  margin-top: -0.4em;
  margin-bottom: 1.2em;
  text-align: right;
}

.notes-content .back-to-toc a {
  font-size: 1em;
  font-weight: 600;
  color: #0033aa;
  text-decoration: none;
  padding: 4px 10px;
  border-radius: 8px;
  background: #f4f6fb;
  border: 1px solid #ccd6f0;
}

.notes-content .back-to-toc a:hover {
  background: #e6ebff;
  border-color: #3366cc;
  text-decoration: underline;
}


</style>

<div class="notes-content">
```

Later, at the very end of the page, you’ll close it with:

```html
</div>
```

---

## 8. Extract ONLY the `<body>` content from `lect.html`

You now need:
**everything between `<body>` and `</body>`**, nothing else.

Here are several ways to do it, including your Chrome method.

---

### 8.1 Option A – Chrome → View Source → manual copy (your method)

1. Open `lect.html` in Chrome.

2. Press `Ctrl+U` (View Source).

3. In the source tab, search for:

   ```html
   <body>
   ```

4. Scroll down to find the matching:

   ```html
   </body>
   ```

5. Carefully select **everything between** `<body>` and `</body>` (not including the tags themselves).

6. Copy it.

7. In `_pages/algebra.html`, paste it **after**:

   ```html
   <div class="notes-content">
   ```

8. At the very bottom, make sure you have:

   ```html
   </div>
   ```

This works even for very large files; you just need to be careful with the selection.

---

### 8.2 Option B – Use browser DevTools (more precise for large files)

Sometimes View Source is huge. DevTools gives a cleaner DOM.

1. Open `lect.html` in Chrome.
2. Press `F12` or `Ctrl+Shift+I` to open DevTools.
3. Go to the **Elements** tab.
4. In the DOM tree, right-click on the `<body>` element.
5. Choose **“Edit as HTML”**.
6. A text editor pops up with the HTML inside `<body> ... </body>`.
7. Select **everything inside**, copy it.
8. Paste into `_pages/algebra.html` after `<div class="notes-content">`.
9. Close with `</div>` at the end.

This is usually safer for **huge** documents than View Source.

---

### 8.3 Option C – Open `lect.html` in a text editor (VS Code / Notepad++)

1. Open `lect.html` in **VS Code**, **Notepad++**, or any good text editor.
2. Use search (`Ctrl+F`) for `<body>`.
3. Place the cursor **after** `<body>` and before any newline.
4. Scroll to the bottom, find `</body>`.
5. Select from just after `<body>` to just before `</body>`.
6. Copy that selection.
7. Paste into `_pages/algebra.html` inside `<div class="notes-content"> ... </div>`.

This is usually what you’ll end up doing repeatedly when you regenerate notes.

---

### 8.4 Option D – Use a tiny script (for automation)

If you later want to automate for many lectures, you can use a small Python snippet:

```python
from pathlib import Path

html = Path("lect.html").read_text(encoding="utf-8")

start = html.find("<body>")
end = html.rfind("</body>")

body_inner = html[start + len("<body>"):end].strip()

Path("body.html").write_text(body_inner, encoding="utf-8")
```

Then:

* `body.html` will contain **only** the content you need.
* Open `body.html`, copy everything, and paste inside `<div class="notes-content">`.

This is useful when you have dozens of lectures.

---

## 9. Paste into your al-folio page

Final `_pages/algebra.html` structure:

```html
---
layout: page
title: Algebraic Structures – Lecture Notes
---

<style>
/* ================================
   Wrapper for Pandoc content
   ================================ */
.notes-content {
  max-width: 900px;
  margin: auto;
  line-height: 1.6;
}

.notes-content img {
  max-width: 100% !important;
  height: auto !important;
  display: block;
  margin: 14px auto;
}


/* ================================
   Headings (match LaTeX style)
   ================================ */
.notes-content h1 {
  color: #cc33cc;
  font-weight: bold;
  text-align: center;
  margin-top: 1.4em;
  margin-bottom: 0.6em;
}

.notes-content h2,
.notes-content h3,
.notes-content h4,
.notes-content h5,
.notes-content h6 {
  color: #cc33cc;
  font-weight: normal;
  text-align: left;
  margin-top: 1.2em;
  margin-bottom: 0.5em;
}

/* Prevent strong from overriding heading color */
.notes-content h1 strong,
.notes-content h2 strong,
.notes-content h3 strong,
.notes-content h4 strong {
  color: inherit;
}


/* ================================
   Tables (CRITICAL)
   ================================ */
.notes-content table {
  width: 100%;
  border-collapse: collapse;
  margin: 16px 0;
  font-size: 0.95em;
}

.notes-content th,
.notes-content td {
  border: 1px solid #444;
  padding: 8px 10px;
  text-align: center;
  vertical-align: middle;
}

.notes-content th {
  background-color: #f6e9ff;
  color: #cc33cc;
  font-weight: bold;
}

.notes-content tr:nth-child(even) {
  background-color: #fafafa;
}

/* ================================
   tcolorbox equivalents
   ================================ */
.notes-content .tcolorbox {
  padding: 12px 14px;
  margin: 16px 0;
  border-radius: 6px;
}

/* Important box */
.notes-content .impbox {
  background-color: #ffe6e6;
  border: 1px solid #cc3333;
}

/* Lab / activity box */
.notes-content .labbox {
  background-color: #eef9ee;
  border: 1px solid #339966;
}

/* Code box */
.notes-content .codebox {
  background-color: #f0f6ff;
  border: 1px solid #3366cc;
}

/* ================================
   Code formatting
   ================================ */
.notes-content .codebox pre,
.notes-content pre {
  margin: 0;
  font-family: Consolas, Monaco, monospace;
  font-size: 0.9em;
  overflow-x: auto;
}

/* ================================
   Pandoc Table of Contents
   ================================ */

#TOC {
  max-width: 900px;
  margin: 2em auto;
  padding: 1em 1.5em;
  background: #f8f9fb;
  border: 1px solid #ddd;
  border-radius: 8px;
}

#TOC h2 {
  text-align: center;
  color: #cc33cc;
  margin-bottom: 0.5em;
}

#TOC ul {
  list-style: none;
  padding-left: 0;
}

#TOC li {
  margin: 6px 0;
}

#TOC a {
  text-decoration: none;
  color: #0033aa;
}

#TOC a:hover {
  text-decoration: underline;
}

/* =========================================
   Wrapper
   ========================================= */
.notes-content {
  max-width: 900px;
  margin: auto;
  line-height: 1.65;
  font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
}

/* =========================================
   IMPORTANT BOX (impbox)
   ========================================= */
.notes-content .impbox {
  background-color: #ffe6e6;
  border: 1.5px solid #cc3333;
  border-radius: 10px;
  padding: 14px 16px;
  margin: 18px 0;
  font-weight: bold;
}

/* =========================================
   LAB / ACTIVITY BOX (labbox)
   ========================================= */
.notes-content .labbox {
  background-color: #eef9ee;
  border: 1.5px solid #339966;
  border-radius: 10px;
  padding: 14px 16px;
  margin: 18px 0;
  font-weight: bold;
}


/* =========================================
   CODE BOX — LaTeX \ttfamily look (Pandoc)
   ========================================= */
.notes-content .codebox {
  background-color: #f0f6ff;
  border: 1.5px solid #3366cc;
  border-radius: 12px;
  padding: 14px 16px;
  margin: 20px 0;
}

/* Pandoc puts code as <p> inside .codebox */
.notes-content .codebox p {
  margin: 0;
  font-family:
    "Latin Modern Mono",
    "Computer Modern Typewriter",
    "JetBrains Mono",
    Consolas,
    "Courier New",
    monospace;

  font-size: 0.95em;
  font-weight: 700;              /* 🔑 makes it LaTeX-dark */
  line-height: 1.5;
  letter-spacing: 0.02em;
  white-space: pre-wrap;         /* keeps line breaks */
  word-break: break-word;

  color: #000;                   /* strong ink like PDF */
  background: transparent;
}

/* Inline code (Pandoc: <code>something</code>) */
.notes-content code {
  font-family:
    "Latin Modern Mono",
    "Computer Modern Typewriter",
    Consolas,
    monospace;

  font-weight: 700;
  background: #f4f6fb;
  padding: 2px 6px;
  border-radius: 6px;
  color: #cc33cc;
}

/* Subtle depth like your screenshot */
.notes-content .codebox {
  box-shadow: 0 3px 8px rgba(0,0,0,0.06);
}


/* =========================================
   Depth & polish
   ========================================= */
.notes-content .impbox,
.notes-content .labbox,
.notes-content .codebox {
  box-shadow: 0 3px 8px rgba(0,0,0,0.06);
}
</style>

<div class="notes-content">

<!-- PASTE EVERYTHING FROM INSIDE <body> OF lect.html HERE -->

</div>
```

Commit → push → GitHub Pages rebuilds → page is live.

---

## 10. Final outcome

Your workflow is now:

1. Write **one long LaTeX file** per unit.
2. Run **Pandoc** to get a self-contained HTML (`lect.html`).
3. Extract `<body>` content (Chrome View Source, DevTools, editor, or script).
4. Paste inside `<div class="notes-content">` in an al-folio page.
5. Get:

   * MathJax-rendered equations
   * Embedded images
   * Headings in `#cc33cc` with your chosen bold/align
   * Clean integration into al-folio
