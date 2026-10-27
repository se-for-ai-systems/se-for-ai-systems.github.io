# Portfolio Template – Software Engineering for AI Systems

## Files

- `main.tex` – your report. This is the only file you need to edit.
- `itvest.cls` – the course layout. Do not edit it.
- `bib.bib` – references. Add your own in BibTeX format.

## Build

- **Overleaf:** New Project → Upload Project → choose this zip file.
- **Locally:** install a TeX distribution (TeX Live, MacTeX or MiKTeX), then run
  `latexmk -pdf main.tex` in this folder.

## Before you start

1. Set `\reportsubtitle{Case: ...}` to a short, anonymised name for your case.
2. Set `\author{...}`. For a group, separate the names with `\and`:
   `\author{Name 1 \and Name 2}`.

## Writing

- The text in each section says what to write. Replace it with your own.
- Replace `...` in the tables and add rows as needed.
- Number scenarios (QA-1, QA-2, ...) and ADRs (ADR-1, ADR-2, ...) across all three
  portfolios, so that P2 and P3 can refer back to P1. Continue the ADR numbering from
  your previous portfolio.
- **Figures:** put the image files (PDF or PNG) next to `main.tex`, and replace each
  framed box with `\includegraphics[width=\textwidth]{file-name}`.
- **References:** cite with `\cite{key}`. Keep at least one citation, or BibTeX stops
  with an error.
- Delete the *Assessment criteria* box before you submit. In P1, delete the LLM section
  if your case does not use an LLM.
- Keep it confidential: no company names, code, data or model weights.

## Submit

Submit the compiled PDF. Deadlines and the submission system are on the
*Portfolio & Exam* page of the course website.
