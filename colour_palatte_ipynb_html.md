- Put this style after <head> is opened inside the html code file.

```html
<style>
/* === Custom Light Theme === */

/* Page & Markdown background */
body, .rendered_html {
  background-color: #ffffff;   /* pure white */
  color: #222222;              /* dark text for readability */
  font-family: "Segoe UI", Arial, sans-serif;
}

/* Code cell background & border */
div.jp-CodeCell {
  background: #f17c7cf5;       /* your custom reddish background */
  border-radius: 8px;
  margin: 10px 0;
  padding: 10px;
}

/* Code text */
div.jp-CodeCell pre {
  color: #000000;              /* black code text */
  font-family: "Consolas", "Courier New", monospace;
}

/* Comments */
span.cm-comment {
  color: #006400;              /* dark green */
  font-style: italic;
}

/* Keywords */
span.cm-keyword {
  color: #0000cd;              /* medium blue */
  font-weight: bold;
}

/* Strings */
span.cm-string {
  color: #8b0000;              /* dark red */
}

/* Output area */
.jp-OutputArea {
  background: #fafafa;
  color: #111111;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 8px;
}
</style>
```


<img width="1201" height="902" alt="image" src="https://github.com/user-attachments/assets/360ea518-ade1-475d-b8f4-2e42534b5546" />
