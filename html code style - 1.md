# Style -a

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>God Is Light</title>
  <style>
    /* Hide scrollbar for modern browsers */
    body::-webkit-scrollbar { display: none; }
    body { -ms-overflow-style: none; scrollbar-width: none; }

    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #f5f5f5;
      color: #333;
      line-height: 1.7;
    }

    .header {
      background-color: #000;
      color: pink;
      padding: 24px 0;
      text-align: center;
      font-size: 32px;
      font-weight: bold;
      letter-spacing: 1px;
      text-transform: uppercase;
      box-shadow: 0 4px 8px rgba(0,0,0,0.4);
    }

    .container {
      max-width: 960px;
      margin: 40px auto;
      padding: 40px 30px;
      background: linear-gradient(to bottom right, #e8f5e9, #ede7f6);
      border-radius: 16px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.07);
    }

    h2, h3 {
      color: #4a148c;
      margin-top: 32px;
    }

    h2 {
      font-size: 28px;
      margin-bottom: 16px;
    }

    h3 {
      font-size: 20px;
      color: #2e7d32;
      margin-bottom: 10px;
    }

    p {
      font-size: 17px;
      margin-bottom: 16px;
    }

    ul {
      margin-left: 20px;
      margin-bottom: 24px;
    }

    ul li {
      margin-bottom: 10px;
    }

    blockquote {
      background-color: #f3e5f5;
      border-left: 5px solid #7b1fa2;
      padding: 16px 24px;
      margin: 24px 0;
      border-radius: 8px;
      font-style: italic;
      color: #4e342e;
    }

    hr {
      border: none;
      border-top: 1px solid #ccc;
      margin: 40px 0;
    }

    .section-title {
      font-size: 24px;
      margin-bottom: 20px;
      color: #6a1b9a;
    }

    .emoji-heading {
      font-size: 22px;
      margin-top: 36px;
      color: #00695c;
    }
  </style>
</head>
<body>
```



![image](https://github.com/user-attachments/assets/91a1396c-0c0b-4d8e-a404-c9b4e0fd6f69)


# Style-b

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>God’s Grace Emphasis</title>
  <style>
    .grace-message {
      max-width: 800px;
      margin: 40px auto;
      padding: 30px;
      background: linear-gradient(135deg, #e8f5e9, #fce4ec);
      border-left: 6px solid #8e24aa;
      border-radius: 12px;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.08);
      font-family: 'Segoe UI', sans-serif;
      color: #333;
    }

    .grace-message h2 {
      font-size: 24px;
      color: #6a1b9a;
      margin-bottom: 16px;
    }

    .grace-message p {
      font-size: 18px;
      line-height: 1.7;
      margin-bottom: 16px;
    }

    .highlight {
      color: #2e7d32;
      font-weight: 600;
    }

    .highlight-purple {
      color: #8e24aa;
      font-weight: 600;
    }

    .highlight-blue {
      color: #1565c0;
      font-weight: 600;
    }
  </style>
</head>
<body>
  <div class="grace-message">
    <h2>Welcome to Abundant Grace for Life</h2>
    <p>This space is to emphasize the <span class="highlight">essence of God</span> as <span class="highlight-purple">loving</span> and <span class="highlight-blue">inclusive</span>, highlighting His desire for <span class="highlight">all of humanity</span> to experience <span class="highlight-purple">grace</span> and <span class="highlight-blue">truth</span>.</p>
    <p>It presents a vision of faith rooted in <span class="highlight">God’s universal love</span>, transcending barriers and reaching every soul.</p>
    <p>It is a place to encounter the <span class="highlight-purple">boundless love and grace of God</span>. Whether you're seeking <span class="highlight-blue">spiritual growth</span>, <span class="highlight">encouragement</span>, or a deeper walk with Christ, we’re here to walk with you on the journey of faith.</p>
  </div>
</body>
</html>
```

![image](https://github.com/user-attachments/assets/94137b59-7dc2-49c4-886d-5edc9f19405c)

# Style - c

```html
<style>
  .grace-scriptures {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    padding: 20px;
    background-color: #f4f9f6;
    border-radius: 12px;
    font-family: 'Segoe UI', sans-serif;
  }

  .verse-card {
    background-color: #ffffff;
    border-left: 5px solid #66bb6a;
    padding: 16px 20px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    border-radius: 8px;
    transition: transform 0.2s ease;
  }

  .verse-card:hover {
    transform: scale(1.02);
  }

  .verse-ref {
    font-weight: bold;
    color: #388e3c;
    margin-bottom: 8px;
  }

  .verse-text {
    color: #333;
    font-size: 15px;
  }
</style>

<div class="grace-scriptures">
  <div class="verse-card">
    <div class="verse-ref">John 1:16</div>
    <div class="verse-text">For of His fullness we have all received, and grace upon grace.</div>
  </div>
  <div class="verse-card">
    <div class="verse-ref">John 1:17</div>
    <div class="verse-text">For the Law was given through Moses; grace and truth were realized through Jesus Christ.</div>
  </div>
  <div class="verse-card">
    <div class="verse-ref">Ephesians 2:8–9</div>
    <div class="verse-text">For by grace you have been saved through faith; and this is not of yourselves, it is the gift of God.</div>
  </div>
  <div class="verse-card">
    <div class="verse-ref">Titus 2:11</div>
    <div class="verse-text">For the grace of God has appeared, bringing salvation to all people.</div>
  </div>
</div>
````


![image](https://github.com/user-attachments/assets/25d6d7e9-749b-460a-97cd-13c8753011e1)

