# LaTeX sources

Sources of the course documents: the portfolio templates (`assignments/portfolio/`), the shared class
`shared/itvest.cls` and the bibliography `shared/bib.bib`.

## Build

```bash
make -C latex              # all documents and the student template zips
make -C latex assignments  # documents only
make -C latex templates    # template zips only
```

You need a TeX distribution with `latexmk`, plus `make` and `zip`. The `Dockerfile` defines the build image used in CI
(`ghcr.io/se-for-ai-systems/course-texlive`).

## Publishing

The `Build and Deploy Site` workflow builds everything on each push to `main` and publishes `main.pdf` and the
template zips under `assets/` on the course website (e.g.
`assets/assignments/portfolio/p1-software-architecture/main.pdf`). Built files are not committed.
