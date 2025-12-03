# ✅ COMPLETE WORKFLOW: LaTeX → Pandoc HTML → al-folio (with custom heading CSS)

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

## 2. Create your LaTeX lecture file

`lect.tex`:

```tex
\documentclass[12pt]{article}

% Basic packages
\usepackage[margin=2.5cm]{geometry}
\usepackage{amsmath, amssymb}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{enumitem}

\usepackage{xcolor}
\usepackage{titlesec}

% Define colors
\definecolor{myblue}{RGB}{0,0,255}
\definecolor{mypink}{HTML}{cc33cc}

% H2 equivalent
\titleformat{\section}
  {\Large\color{myblue}\bfseries\centering}
  {}{0pt}
  {\color{mypink}}

% H3 equivalent
\titleformat{\subsection}
  {\large\color{myblue}\bfseries}
  {}{0pt}
  {\color{mypink}}

% H4 equivalent
\titleformat{\subsubsection}
  {\normalsize\color{myblue}\bfseries}
  {}{0pt}
  {\color{mypink}}

% Optional: nicer section spacing
\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}

\begin{document}

\section*{Algebraic Structures – Lecture Notes}

These are long-form lecture notes written in \LaTeX, similar in spirit to a
single long Markdown document.

You can write normal text in paragraphs. Math works with
inline notation like $a \in \mathbb{Z}_n$ and display math:

\[
a + b \equiv c \pmod{n}.
\]

\subsection*{Example: Homomorphism $\phi : \mathbb{Z} \to \mathbb{Z}_n$}

Define
\[
\phi(a) = a \bmod n.
\]

Then
\[
\phi(a+b) = \phi(a) + \phi(b)
\]
so $\phi$ is a group homomorphism from $(\mathbb{Z},+)$ to $(\mathbb{Z}_n,+)$.

\subsection*{Including an Image}

Here is an example of inserting an image (e.g., a diagram of $\mathbb{Z}_n$):

\begin{figure}[h]
  \centering
  \includegraphics[width=0.5\textwidth]{images/image1.jpg}
  \caption{Modulo $n$ wheel illustrating the homomorphism $a \mapsto a \bmod n$.}
  \label{fig:mod-wheel}
\end{figure}

Continue with more sections, examples, and problems as needed.
You can treat this as “one long page” of notes.

\subsection*{Practice Problems}

\begin{enumerate}[label=\textbf{Problem \arabic*:}]
  \item Show that $(\mathbb{Z}_6, +)$ is a cyclic group.
  \item Find all generators of $(\mathbb{Z}_{10}, +)$.
  \item Prove that $\phi(a) = a \bmod 4$ is a homomorphism $\mathbb{Z} \to \mathbb{Z}_4$.
\end{enumerate}

\end{document}
```

Note:

* Image path is `images/image1.jpg` and **folder structure must match**.

---

## 3. (Optional) CSS for local HTML preview

This is only for your **local** `lect.html` preview, not required by al-folio.

`style.css`:

```css
/* SECTION → your "H2" */
h1 {
  text-align: center;
  color: blue;
  font-weight: bold;
}
h1 strong {
  color: #cc33cc;
}

/* SUBSECTION → your "H3" */
h2 {
  text-align: left;
  color: blue;
  font-weight: bold;
}
h2 strong {
  color: #cc33cc;
}

/* SUBSUBSECTION → your "H4" */
h3 {
  text-align: left;
  color: blue;
  font-weight: bold;
}
h3 strong {
  color: #cc33cc;
}

body {
  line-height: 1.5;
  font-size: 17px;
}
```

---

## 4. Run Pandoc to export HTML with embedded resources

From inside `my-lecture/`:

```bash
pandoc lect.tex \
  -s \
  -o lect.html \
  --mathjax \
  --embed-resources \
  -c style.css \
  --resource-path=.:images
```

* `--embed-resources` → images + CSS inlined (Base64 etc.)
* `--resource-path=.:images` → lets Pandoc find `images/image1.jpg`

Output:

```text
lect.html  ← fully self-contained (math + images)
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
/* Apply to all headings inside the LaTeX content */
.notes-content h1,
.notes-content h2,
.notes-content h3,
.notes-content h4,
.notes-content h5,
.notes-content h6 {
  color: #cc33cc !important;
  font-weight: bold !important; /* normal if we dont want bold font*/
  text-align: left !important;
}

/* If you want H1 centered (like your old style), keep this: */
.notes-content h1 {
  text-align: center !important;
}

/* Remove strong override since heading already has the color */
.notes-content h1 strong,
.notes-content h2 strong,
.notes-content h3 strong {
  color: inherit !important;
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
/* Apply to all headings inside the LaTeX content */
.notes-content h1,
.notes-content h2,
.notes-content h3,
.notes-content h4,
.notes-content h5,
.notes-content h6 {
  color: #cc33cc !important;
  font-weight: bold !important; /* normal if we dont want bold font*/
  text-align: left !important;
}

/* If you want H1 centered (like your old style), keep this: */
.notes-content h1 {
  text-align: center !important;
}

/* Remove strong override since heading already has the color */
.notes-content h1 strong,
.notes-content h2 strong,
.notes-content h3 strong {
  color: inherit !important;
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
