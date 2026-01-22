# Lecture Preparation Rules (Master Guidelines)

## 1. Writing Style and Pedagogy

* All lecture notes must be written in a **textbook-style, free-flowing narrative**.

* The target audience is a **first-time learner**, not an expert.

* Every topic must follow a **gentle progression**:

  **Intuition → Motivation → Definitions → Explanation → Examples → Architectural/Practical Implications**

* Explanations must be:

  * Clear
  * Elaborate
  * Patient
  * Continuous (no abrupt jumps)

* Do **not** compress explanations for brevity.

* Do **not** assume prior knowledge unless explicitly stated earlier.

---

## 2. Language Requirements

* Use **simple, clear language**, but with **deep explanation**.
* Avoid short, clipped sentences that feel like slides.
* Prefer **longer explanatory paragraphs** that walk the student through ideas.
* Every technical term must be:

  * Introduced before use
  * Explained in plain language
  * Reinforced through examples if needed

---

## 3. Professional Tone (Strict)

Lecture notes must be **purely professional and academic**.

Do **NOT** include:

* ❌ “The author says…”
* ❌ “According to the textbook…”
* ❌ Meta-comments about simplification
* ❌ Teaching instructions to students
* ❌ Casual or conversational remarks

Do include:

* ✓ Neutral academic tone
* ✓ Objective explanations
* ✓ Clean textbook prose

---

## 4. Structural Rules (LaTeX-Oriented)

* Use structured sections:

  * `\section`
  * `\subsection`
  * `\subsubsection` (only when genuinely required)

* Sections should be written so they can be:

  * Converted to HTML
  * Used with an automatic Table of Contents

* Avoid bullet lists unless they **clearly improve understanding**.

---

## 5. Examples and Intuition

* Examples must be:

  * Embedded naturally in the prose
  * Realistic (web apps, services, users, workloads, etc.)
  * Explained step-by-step

* When explaining concepts like:

  * Scaling
  * Virtualization
  * Containers
  * Abstraction

  Always include:

  * What problem it solves
  * How it works conceptually
  * Why it matters in real systems

---

## 6. Figure Handling Rules (Very Important)

### 6.1 Figure Code

* All LaTeX `figure` environments must be **commented out**.
* Figures are **not rendered** in LaTeX at this stage.

Example:

```latex
% \begin{figure}[H]
% \centering
% \includegraphics[width=0.85\textwidth]{/pictures/example.png}
% \caption{Example diagram}
% \end{figure}
```

---

### 6.2 Figure Placeholder Format (Strict)

Immediately after the commented figure, insert **exactly one line** in the following format:

```
[Figure Placeholder – Description of figure, Erl, page XX]
```

Rules:

* Use **single-line placeholders only**
* Do NOT explain the figure in prose
* Do NOT mention the figure explicitly in the text
* Keep the book reference short as **Erl**

---

## 7. Use of Highlight Boxes (`impbox`)

* Use `impbox` **sparingly**

* Only for:

  * Core conceptual takeaways
  * Architectural principles
  * Important warnings or boundaries

* Do NOT overuse boxes for definitions or examples.

---

## 8. Concept Introduction Discipline

Before using any of the following, they must be **explicitly introduced and explained**:

* Virtual machine
* Hypervisor
* Kernel
* User space
* Resource pooling
* Load balancer
* Stateless vs stateful services
* Scaling (vertical and horizontal)
* Container image
* Isolation
* Orchestration

No unexplained jargon.

---

## 9. Depth Requirement

* Always err on the side of **over-explaining**, not under-explaining.
* A student reading the notes should **not need external explanation** to understand the core idea.
* Depth should resemble:

  * A **good undergraduate / early postgraduate textbook**
  * Not slides
  * Not quick notes

---

## 10. Consistency Across Units

* Writing style must remain consistent across all units.
* Units should feel like chapters of the **same book**, not separate documents.
* Earlier concepts may be referenced, but never assumed without reminder.

---

## 11. Conversion Readiness

All notes must be suitable for:

* LaTeX → HTML
* Static website rendering
* PDF compilation

Avoid:

* Hard-coded references to slides
* Tool-specific instructions
* Platform-specific assumptions

---

## 12. Guiding Principle (One Line)

> **Write as if you are authoring a first-principles textbook for a careful, intelligent beginner.**

---


