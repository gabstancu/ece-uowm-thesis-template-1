# ECE UoWM Thesis Template

This is a **LaTeX thesis template** for the **Department of Electrical and Computer Engineering, University of Western Macedonia (UoWM)**.  
<!-- It supports **Greek** and **English** languages, bilingual captions, custom cover pages, lists (tables, figures, images, algorithms), and an optional acronyms section. -->

## Features

- Fully bilingual (**Greek** / **English**) with [`polyglossia`](https://ctan.org/pkg/polyglossia)  
- Predefined caption translations for:
  - Chapters, Appendices
  - Lists of Tables, Figures, Images, Algorithms
  - Bibliography  
- Three predefined cover page styles (in Greek & English)
- Custom acronyms list with internal links
- Appendix support  
- IEEE-style bibliography (`biblatex` + `biber`)  
- Ready-made structure with `doc/` folder for chapters, appendices, figures, images, etc.

---

## Getting Started

### Compiler
Use **XeLaTeX** (or LuaLaTeX) with **Biber** as the bibliography backend.  

In Overleaf:
1. Go to **Menu → Settings**  
2. Set **Compiler** to `XeLaTeX`  
3. Set **Bibliography** to `Biber`

---

### Logos
Official UoWM logos can be found here: [https://noc.uowm.gr/www/logo/](https://noc.uowm.gr/www/logo/)  
The `logos/` directory already contains **Greek** and **English** versions in horizontal and vertical formats.
Edit the corresponding `covers/` file to change the logo or position.
```
logos/
├── en/
│    ├── uowm-logo-horizontal-en.png
│    └── uowm-logo-vertical-en.png
└── gr/
├── uowm-logo-horizontal-gr.png
└── uowm-logo-vertical-gr.png
```
---

### Folder Structure
```
covers/             → Three cover page designs (cover1, cover2, cover3) in Greek & English
doc/
├── chapter1/       → First chapter parts
├── chapter2/       → Second chapter parts
├── appendices/     → Appendix files
├── figures/        → Figure images
├── images/         → Image floats
└── acronyms.tex    → Acronyms list
logos/              → Official UoWM logos (GR & EN)
main.tex            → Main thesis file
uowmthesis.cls      → Custom LaTeX class file
settings.sty        → Shared style/configuration
references.bib      → Bibliography entries
```

### Language Switching

- Set **main language** in `main.tex`:
  ```latex
  \setmainlanguage{greek}
  \setotherlanguage{english}
  ```

- Switch mid-document:

    ```latex    
    \selectlanguage{english}
    ```
### Define acronyms in `doc/acronyms.tex`:

```latex
\begin{description}
    \acitem{LP}{Linear Programming}
    \acitem{CPU}{Central Processing Unit}
    \acitem{AI}{Artificial Intelligence}
\end{description}
```

### Customising Settings
The `settings.sty` file contains many customisation options for language shortcuts, TikZ styles, and code appearance.

Example — changing code appearance (uses `minted`):

```latex
\newenvironment{codeblock}[1]{%
  \selectlanguage{english}
  \minted[
    fontsize=\small,
    linenos=true,
    breaklines,
    frame=single,
    framerule=0.05pt,
    framesep=4mm,
    bgcolor=white!5,
    tabsize=2
  ]{#1}%
}{\endminted}
```

Modify these parameters to adjust font size, line numbering, frame, background color, etc.

### Licence

This template is released under the **Eclipse Public License 2.0**.
See the `LICENSE` file for more details.
