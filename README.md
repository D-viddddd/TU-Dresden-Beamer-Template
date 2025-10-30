# TU-Dresden-Beamer-Template

Clean, lightweight Beamer appearance inspired by TU Dresden’s current corporate design. **This is an unofficial template** provided for personal and academic presentations; it is not affiliated with or endorsed by TU Dresden. The demo presentation shows a white canvas with TU blue accents, a compact footline, and a progress headline. It draws ideas from TU Dresden’s official corporate design manuals and community Beamer themes such as `beamerthemetud` as well as clean blue layouts seen in Tsinghua University slides like [THUBeamer](https://github.com/tl3shi/THUBeamer), while simplifying the setup for quick reuse.

## Highlights
- Single-file theme: `template/beamerthemeTUDneo.sty`
- Progress indicator in the headline (toggle with `headprogress=false`)
- Automatic logo helper `\TUDCenteredLogo{<basename>}` supporting PDF/PNG/JPG/SVG
- Ships with a XeLaTeX-first toolchain (`latexmk`) and sensible defaults for assets in `assets/`

## Quick start
```bash
# Recommended build (writes output to build/demo.pdf and copies to example/demo.pdf)
latexmk -xelatex example/demo.tex

# Optional fallback
pdflatex example/demo.tex && pdflatex example/demo.tex
```

Requirements: TeX Live (or MiKTeX) with `latexmk`, `biblatex`, and XeLaTeX enabled. If you want SVG logo support you also need the `svg` package **and** Inkscape on your PATH.

VS Code (LaTeX Workshop) users can just press `Cmd+S` on macOS or `Ctrl+S` on Windows: the extension triggers the bundled `latexmk` workflow automatically.

## Using the theme
```tex
\documentclass{beamer}
\usepackage{graphicx}
\graphicspath{{../assets/}}
\usepackage[headprogress=true]{beamerthemeTUDneo}

\title{Your Talk}
\author{You}
\begin{document}

\begin{frame}[plain]
  \TUDCenteredLogo[0.15\paperwidth]{Logo_TU_Dresden_2025}
  \titlepage
\end{frame}

\end{document}
```

Place logos and other assets in `assets/`. The default latexmk configuration (`.latexmkrc`) extends `TEXINPUTS`/`XDVIPDFMXINPUTS`, so both XeLaTeX and the PDF driver can find those files no matter where the build directory lives. It also adds the root `ref/` directory to `BIBINPUTS`, so `\addbibresource{../ref/refs.bib}` works from inside `example/`.

## Project layout
```
TU-Dresden-Beamer-Template/
├─ assets/                      # Logos, sample graphics
├─ example/
│  └─ demo.tex                  # Showcases the theme
├─ template/
│  └─ beamerthemeTUDneo.sty     # Theme implementation
├─ ref/                         # Example BibLaTeX database
├─ .latexmkrc                   # latexmk configuration (XeLaTeX by default)
├─ Makefile                     # Convenience targets for CI/local builds
└─ README.md
```

## Tips
- The demo uses `latexmk -xelatex` and Biber; rerun the command after editing slides.
- `\TUDCenteredLogo` prefers PDF/PNG/JPG/JPEG assets. If only an SVG exists and the `svg` package is loaded, it will call `\includesvg`; otherwise it emits a warning.
- Want a darker background? Fork the theme and tweak `structure`, `normal text`, and block colors directly in `template/beamerthemeTUDneo.sty`.

## License
LaTeX Project Public License (LPPL) 1.3c or later. See `LICENSE` or <https://www.latex-project.org/lppl/lppl-1-3c/>. Avoid committing trademarked logos you are not licensed to distribute.
