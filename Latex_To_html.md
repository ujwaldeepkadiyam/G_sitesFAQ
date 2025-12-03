# ✅ **COMPLETE WORKFLOW: Create Lecture Notes in LaTeX → Export to HTML → Insert into al-folio**

---

# **1. Create your project folder**

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

# **2. Create your LaTeX lecture file**

`lecture.tex`:

```tex
\documentclass[12pt]{article}

\usepackage[margin=2.5cm]{geometry}
\usepackage{amsmath, amssymb}
\usepackage{graphicx}
\usepackage{hyperref}
\usepackage{enumitem}

\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}

\begin{document}

\section{Algebraic Structures – Lecture Notes}

These notes are written entirely in \LaTeX.

Inline math: $a \in \mathbb{Z}_n$  
Display math:
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

---

# **3. Create your CSS for heading colors**

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

# **4. Run pandoc to export HTML with Base64 Images**

Open terminal in `my-lecture/`:

```bash
pandoc lecture.tex \
  -s \
  -o lecture.html \
  --mathjax \
  --embed-resources \
  -c style.css
```

Pandoc will produce:

```
lecture.html  ← SINGLE FILE (math + images + styles)
```

---

# **5. Open the HTML file**

Just double-click:

```
lecture.html
```

MathJax, colors, CSS, and base64 images will render properly.

---

# **6. Your HTML is now self-contained and ready to use**

* No image folders needed
* No CSS needed (optional)
* Works offline
* Works online
* Works in al-folio
* 100% portable

---

# **7. Add YAML frontmatter in al-folio (if needed)**

Create a new file:

```
_pages/algebra.html
```

Insert this at the very top:

```yaml
---
layout: page
title: Algebraic Structures – Lecture Notes
---
```

Then paste content **after** this line.

---

# 🎯 **8. METHOD 1 — Paste only the `<body>` content into an al-folio page**

This is the cleanest way.

### ✔ Step-by-step:

### **8.1 Open `lecture.html`**

Find:

```html
<body>
   .... YOUR CONTENT ....
</body>
```

### **8.2 Copy ONLY the stuff inside `<body>`**

Do NOT copy `<html>`, `<head>`, or `<body>` tags.

### **8.3 Create a new al-folio page**

Example:

```
_pages/lecture-notes.md
```

Add frontmatter:

```yaml
---
layout: page
title: Algebraic Structures – Lecture Notes
---
```

### **8.4 Paste your HTML content below the frontmatter**

al-folio fully supports raw HTML in Markdown.

### **8.5 Save → Commit → GitHub Pages updates automatically**

Now your LaTeX notes appear fully rendered:

* Math via MathJax
* Colored headings via CSS
* Base64 images embedded inside HTML
* Fully responsive on al-folio

---

# 🚀 **FINAL RESULT**

Your workflow becomes:

1. **Write lecture notes in LaTeX** as one long `.tex` file
2. **Insert images normally** (`\includegraphics{images/...}`)
3. **Run Pandoc**
4. **Pandoc outputs ONE HTML file** with:

   * Math (via MathJax)
   * Colored headings (via CSS)
   * Base64-embedded images
   * Your theme preserved
5. **Copy `<body>` content into an al-folio page**
6. **Publish to GitHub Pages**
7. Your lecture notes are live online, beautiful, and consistent

---

