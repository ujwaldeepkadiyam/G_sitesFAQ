# ✅ **1. Create Your Project Folder**

Example structure:

```
my-lecture/
   lecture.tex
   style.css
   images/
       fig1.png
       diagram1.jpg
       mod-wheel.png
```

---

# ✅ **2. Minimal LaTeX Template for Lecture Notes**

Use one `.tex` file (like one long Markdown page):

**lecture.tex**

```tex
\documentclass[12pt]{article}

% Basic packages
\usepackage[margin=2.5cm]{geometry}
\usepackage{amsmath, amssymb}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{enumitem}

% Optional: better paragraph spacing
\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}

\begin{document}

\section{Algebraic Structures – Lecture Notes}

These notes are written entirely in \LaTeX, but exported later to HTML.

Inline math looks like $a \in \mathbb{Z}_n$ and display math:

\[
a + b \equiv c \pmod{n}.
\]

\subsection{Example: Homomorphism $\phi : \mathbb{Z} \to \mathbb{Z}_n$}

Define:
\[
\phi(a) = a \bmod n.
\]

Then:
\[
\phi(a+b) = \phi(a) + \phi(b)
\]

\subsection{Including an Image}

\begin{figure}[h]
  \centering
  \includegraphics[width=0.5\textwidth]{images/mod-wheel.png}
  \caption{Modulo $n$ wheel illustrating $a \mapsto a \bmod n$.}
\end{figure}

\subsection{Practice Problems}

\begin{enumerate}[label=\textbf{Problem \arabic*:}]
  \item Show that $(\mathbb{Z}_6, +)$ is cyclic.
  \item Find all generators of $(\mathbb{Z}_{10}, +)$.
  \item Prove that $\phi(a) = a \bmod 4$ is a homomorphism.
\end{enumerate}

\end{document}
```

👉 **IMPORTANT:**
Do **NOT** style headings in LaTeX (`titlesec`), Pandoc will not preserve formatting.

We will style them in CSS later.

---

# ✅ **3. Create a CSS File to Style Headings in HTML**

This lets you replicate your **blue + #cc33cc** theme exactly like your lecture notes.

**style.css**

```css
/* SECTION: acts like your H2 */
h1 {
    text-align: center;
    color: blue;
    font-weight: bold;
}
h1 strong {
    color: #cc33cc;
}

/* SUBSECTION: your H3 */
h2 {
    text-align: left;
    color: blue;
    font-weight: bold;
}
h2 strong {
    color: #cc33cc;
}

/* SUBSUBSECTION: your H4 */
h3 {
    text-align: left;
    color: blue;
    font-weight: bold;
}
h3 strong {
    color: #cc33cc;
}

/* Optional: match your paragraph spacing */
body {
    line-height: 1.5;
    font-size: 17px;
}
```

Pandoc maps:

```
\section → <h1>
\subsection → <h2>
\subsubsection → <h3>
```

So this CSS gives identical styling to your HTML headings.

---

# ✅ **4. Use Pandoc to Export LaTeX → HTML with Base64 Images**

Open terminal inside your folder and run:

```bash
pandoc lecture.tex \
  -s \
  -o lecture.html \
  --mathjax \
  --embed-resources \
  -c style.css
```

### Explanation:

| Option              | Meaning                           |
| ------------------- | --------------------------------- |
| `-s`                | produce standalone HTML           |
| `-o lecture.html`   | output file                       |
| `--mathjax`         | render LaTeX math                 |
| `--embed-resources` | convert images → base64 embedded  |
| `-c style.css`      | apply heading colors + formatting |

This produces:

✅ Single HTML file
✅ Math via MathJax
✅ Images embedded as base64 (no external files)
✅ Your custom heading colors + layout
✅ Works on GitHub Pages / al-folio

---

# ✅ **5. Where to Put Images in LaTeX**

Use:

```tex
\includegraphics[width=0.6\textwidth]{images/myfigure.png}
```

Pandoc will automatically find and embed the file inside the HTML.

---

# ✅ **6. How the HTML Output Looks**

* All images are **embedded** → file is self-contained
* Math loads using MathJax (same as your GitHub Pages)
* Colors come from `style.css`
* Headings are identical to your HTML format

---

# ✅ **7. (Optional) Single Shell Script for Automation**

Create a file `build.sh`:

```bash
#!/bin/bash

pandoc lecture.tex \
  -s \
  -o lecture.html \
  --mathjax \
  --embed-resources \
  -c style.css
```

Run:

```
sh build.sh
```

---

# 🚀 FINAL RESULT

Your workflow becomes:

1. **Write all lecture notes in LaTeX** (like one long document)
2. **Insert images normally** (`\includegraphics{...}`)
3. **Run Pandoc**
4. **You get a single HTML file** with:

   * math
   * colors
   * base64 images
   * your theme
   * perfect for GitHub Pages

---

