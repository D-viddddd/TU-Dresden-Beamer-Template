# TU-Dresden-Beamer-Template

Clean, lightweight Beamer appearance inspired by TU Dresden’s current corporate design. The demo presentation shows a white canvas with TU blue accents, a compact footline, and a progress headline.

## Highlights
- Single-file theme: `example/beamerthemeTUDneo.sty`
- Progress indicator in the headline (toggle with `headprogress=false`)
- Automatic logo helper `\TUDCenteredLogo{<basename>}` supporting PDF/PNG/JPG/SVG
- Ships with a XeLaTeX-first toolchain (`latexmk`) and sensible defaults for assets in `assets/`

## Quick start
```bash
# Recommended build (writes output to build/demo.pdf)
latexmk -xelatex example/demo.tex

# Optional fallback
pdflatex example/demo.tex && pdflatex example/demo.tex
```

Requirements: TeX Live (or MiKTeX) with `latexmk`, `biblatex`, and XeLaTeX enabled. If you want SVG logo support you also need the `svg` package **and** Inkscape on your PATH.

## Using the theme
```tex
\documentclass{beamer}
\usepackage[headprogress=true]{beamerthemeTUDneo}

\title{Your Talk}
\author{You}
\begin{document}

\begin{frame}[plain]
  \TUDCenteredLogo[0.15\paperwidth]{../assets/Logo_TU_Dresden_2025}
  \titlepage
\end{frame}

\end{document}
```

Place logos and other assets in `assets/`. The default latexmk configuration (`.latexmkrc`) extends `TEXINPUTS`/`XDVIPDFMXINPUTS`, so both XeLaTeX and the PDF driver can find those files no matter where the build directory lives.

## Project layout
```
TU-Dresden-Beamer-Template/
├─ assets/                      # Logos, sample graphics
├─ example/
│  ├─ demo.tex                  # Showcases the theme
│  └─ beamerthemeTUDneo.sty     # Theme implementation
├─ ref/                         # Example BibLaTeX database
├─ .latexmkrc                   # latexmk configuration (XeLaTeX by default)
├─ Makefile                     # Convenience targets for CI/local builds
└─ README.md
```

## Tips
- The demo uses `latexmk -xelatex` and Biber; rerun the command after editing slides.
- `\TUDCenteredLogo` prefers PDF/PNG/JPG/JPEG assets. If only an SVG exists and the `svg` package is loaded, it will call `\includesvg`; otherwise it emits a warning.
- Want a darker background? Fork the theme and tweak `structure`, `normal text`, and block colors directly in `beamerthemeTUDneo.sty`.

## License
LaTeX Project Public License (LPPL) 1.3c or later. See `LICENSE` or <https://www.latex-project.org/lppl/lppl-1-3c/>. Avoid committing trademarked logos you are not licensed to distribute.
