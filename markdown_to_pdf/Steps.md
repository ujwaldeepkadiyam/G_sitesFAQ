Here's the full workflow as a clean, repeatable sequence:

## Markdown → Rich PDF Workflow

**1. Write / edit your content in Markdown**
Keep your sermon (or any document) in a `.md` file — headers, tables, bold, blockquotes, etc.

**2. Convert Markdown → HTML using Dillinger**
- Go to [dillinger.io](https://dillinger.io)
- Paste in your markdown (or import the `.md` file)
- Use the export option to download it as **HTML**

**3. Open the exported HTML file in a text editor**
- Right-click the file → **Open with** → Notepad (or VS Code / Notepad++)

**4. Replace the stylesheet**
- Ctrl+F to find `<style>`
- Select everything between `<style>` and `</style>` and delete it
- Paste in the custom CSS (the blue-themed, table-formatted stylesheet)
```css
  @import url("https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0-alpha2/katex.min.css");

:root {
  --accent: #14468c;
  --accent-light: #ebf4fd;
  --border: #cfe0f2;
}

body {
  font-family: Georgia, Cambria, serif;
  font-size: 13px;
  line-height: 1.7;
  color: #2a2a2a;
  max-width: 800px;
  margin: 0 auto;
  padding: 2rem;
}

h1, h2, h3, h4, h5, h6 {
  font-family: "Source Sans Pro", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-weight: 600;
  color: var(--accent);
  margin-top: 1.6em;
  margin-bottom: 0.5em;
}
h1 {
  font-size: 1.9em;
  border-bottom: 2px solid var(--accent);
  padding-bottom: 0.3em;
}
h2 {
  font-size: 1.45em;
  border-bottom: 1px solid var(--border);
  padding-bottom: 0.25em;
}
h3 {
  font-size: 1.15em;
  font-style: italic;
  color: #1a5aad;
  border-bottom: none;
}

p { margin: 0.7em 0; text-align: justify; }
strong { color: var(--accent); }

a {
  color: #1a5aad;
  text-decoration: none;
  font-size: 0.72em;
  vertical-align: super;
}
a:hover { text-decoration: underline; }

code {
  font-family: "Ubuntu Mono", Monaco, monospace;
  background: #F5F7FA;
  padding: 0.2em 0.4em;
  border-radius: 3px;
}
pre { background: #F5F7FA; padding: 1em; border-radius: 3px; overflow-x: auto; }
pre code { background: none; padding: 0; }

blockquote {
  background: var(--accent-light);
  border-left: 4px solid var(--accent);
  padding: 0.9em 1.3em;
  margin: 1.2em 0;
  font-style: italic;
  color: #333;
  border-radius: 0 6px 6px 0;
}

table {
  border-collapse: collapse;
  width: 100%;
  table-layout: fixed;
  margin: 1em 0 1.6em;
}
th, td { border: 1px solid var(--border); padding: 0.6em 0.75em; text-align: left; vertical-align: top; }
th {
  background: var(--accent);
  color: #fff;
  font-weight: 600;
  font-size: 0.85em;
  text-transform: uppercase;
  letter-spacing: 0.03em;
}
td { background: var(--accent-light); font-size: 0.94em; }
tr { page-break-inside: avoid; }
table th:nth-child(1), table td:nth-child(1) { width: 16%; }
table th:nth-child(2), table td:nth-child(2) { width: 59%; }
table th:nth-child(3), table td:nth-child(3) { width: 25%; }

hr { border: none; border-top: 1px solid var(--border); margin: 1.8em 0; }
img { max-width: 100%; height: auto; }

@media print {
  body { padding: 0; max-width: 100%; }
  * { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
  h1, h2, h3 { page-break-after: avoid; }
  tr { page-break-inside: avoid; }
}
```

- You may use any css style you want.
- Save the file (keep the `.html` extension)

**5. Check for stray formatting artifacts**
- Search for any leftover `**` that didn't convert to bold — this can happen when Dillinger's converter misses inline formatting near line breaks or special characters
- Manually replace `**text**` with `<strong>text</strong>` wherever you find it
- Also check for merged/missing spaces around those spots

**6. Open the HTML file in your browser**
- Double-click the saved file, or right-click → **Open with** → Chrome/Edge

**7. Print to PDF**
- Ctrl+P
- Set **Destination** → **Save as PDF**
- Click **More settings** → check **Background graphics** (critical — without this, colors and shading won't print)
- Click **Save**

---
