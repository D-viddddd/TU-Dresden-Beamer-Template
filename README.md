# TU-Dresden-Beamer-Template

Clean, lightweight Beamer appearance inspired by TU Dresden’s current corporate design. **This is an unofficial template** provided for personal and academic presentations; it is not affiliated with or endorsed by TU Dresden. The demo presentation shows a white canvas with TU blue accents, a compact footline, and a progress headline. It draws ideas from TU Dresden’s official corporate design manuals and community Beamer themes such as `beamerthemetud` as well as clean blue layouts seen in Tsinghua University slides like [THUBeamer](https://github.com/tl3shi/THUBeamer), while simplifying the setup for quick reuse.

## Highlights
- Original lightweight theme: `template/beamerthemeTUDneo.sty`
- New official 2025 layout: `template/beamerthemeTUDofficial2025.sty` with cover helper and TU-blue footline
- Outline frame auto-breaks across slides with compact spacing that only expands when subsections exist
- Cover date line configurable via `\completiontime{<text>}` plus centered title/subtitle typography
- Progress indicator in the headline (toggle with `headprogress=false`)
- Automatic logo helper `\TUDCenteredLogo{<basename>}` supporting PDF/PNG/JPG/SVG
- Ships with a XeLaTeX-first toolchain (`latexmk`) and sensible defaults for assets in `assets/`

## Quick start
```bash
# Recommended builds (XeLaTeX + Biber)
latexmk -xelatex example/demo.tex           # Lightweight neo theme demo
latexmk -xelatex example/demo_official.tex  # Official TU 2025 theme demo

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

### 2025 official slides template
```tex
\documentclass[aspectratio=169]{beamer}
\usepackage[headprogress=true]{beamerthemeTUDofficial2025}

\title{Methods in Transport Policy}
\subtitle{Task Part A — Consumer Surplus}
\author[group04]{Sihao Wei \\ Farid Gadirov \\ Aysel Aliyeva \\ Franco Perez Saavedra San Roman}
\TUDSetSpeaker{group04} % footline + cover, default already "group04"

\begin{document}

\completiontime{Finished \today} % optional; defaults to \insertdate
\TUDOfficialTitleFrame % auto cover: TU blue background + logo

\begin{frame}{Agenda}
  \tableofcontents
\end{frame}

\end{document}
```
`beamerthemeTUDofficial2025` mirrors the official corporate PPT (Brillantblau (#00008C) cover, white content canvas, TU footer). By default the speaker badge in the footer is `group04`; override it with `\TUDSetSpeaker{<name>}`. The title frame prints the footline speaker on the first line (e.g., “group04”) and the full author list right below, so populate `\author[group04]{Name A \\ Name B}` to show the two-line structure requested by the design guide. Use `\completiontime{<text>}` once before `\begin{document}` to override the cover’s date line (falls back to `\insertdate` if omitted).

Place logos and other assets in `assets/`. The default latexmk configuration (`.latexmkrc`) extends `TEXINPUTS`/`XDVIPDFMXINPUTS`, so both XeLaTeX and the PDF driver can find those files no matter where the build directory lives. It also adds the root `ref/` directory to `BIBINPUTS`, so `\addbibresource{../ref/refs.bib}` works from inside `example/`.

## Project layout
```
TU-Dresden-Beamer-Template/
├─ assets/                      # Logos, sample graphics
├─ example/
│  ├─ demo.tex                  # Showcases the lightweight theme
│  └─ demo_official.tex         # Official 2025 theme demo (same content, TU styling)
├─ template/
│  ├─ beamerthemeTUDneo.sty             # Lightweight theme
│  └─ beamerthemeTUDofficial2025.sty    # Official TU blue template
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
