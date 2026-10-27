# Root Makefile for ITVeST course materials
# Run `make` from the repo root to build everything.
# Run `make lectures` or `make assignments` to build a subset.
# Run `make templates` to package the portfolio templates as student zips.
#
# TEXINPUTS tells LaTeX where to find itvest.cls (the shared/ directory).

SHARED   := $(CURDIR)/shared
TEXFLAGS := TEXINPUTS="$(SHARED):" BIBINPUTS="$(SHARED):"
LATEXMK  := $(TEXFLAGS) latexmk -pdf -bibtex -interaction=nonstopmode -halt-on-error

LECTURE_DOCS   := $(wildcard lectures/*/*/main.tex)
ASSIGNMENT_DOCS := $(wildcard assignments/*/*/main.tex)
TEMPLATE_DOCS   := $(wildcard assignments/portfolio/*/main.tex)
ALL_DOCS        := $(LECTURE_DOCS) $(ASSIGNMENT_DOCS)

.PHONY: all lectures assignments templates clean

all: lectures assignments templates clean

lectures: $(LECTURE_DOCS)
	@for f in $^; do \
	  echo "Building $$f"; \
	  (cd $$(dirname $$f) && latexmk main.tex && $(LATEXMK) main.tex); \
	done

assignments: $(ASSIGNMENT_DOCS)
	@for f in $^; do \
	  echo "Building $$f"; \
	  (cd $$(dirname $$f) && latexmk main.tex && $(LATEXMK) main.tex); \
	done

# Each zip is self-contained (template, class, bibliography, README), so it
# builds on Overleaf or with `latexmk -pdf main.tex` without this repo.
templates: $(TEMPLATE_DOCS)
	@for f in $^; do \
	  d=$$(dirname $$f); \
	  echo "Packaging $$d"; \
	  rm -f $$d/$$(basename $$d).zip; \
	  zip -j -q $$d/$$(basename $$d).zip $$f $(SHARED)/itvest.cls $(SHARED)/bib.bib assignments/portfolio/README.md; \
	done

clean:
	@for f in $(ALL_DOCS); do \
	  (cd $$(dirname $$f) && latexmk main.tex); \
	done
