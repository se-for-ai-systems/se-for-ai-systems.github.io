# Root Makefile for ITVeST course materials
# Run `make` from the repo root to build everything.
# Run `make lectures` or `make assignments` to build a subset.
#
# TEXINPUTS tells LaTeX where to find itvest.cls (the shared/ directory).

SHARED   := $(CURDIR)/shared
TEXFLAGS := TEXINPUTS="$(SHARED):" BIBINPUTS="$(SHARED):"
LATEXMK  := $(TEXFLAGS) latexmk -pdf -bibtex -interaction=nonstopmode -halt-on-error

LECTURE_DOCS   := $(wildcard lectures/*/*/main.tex)
ASSIGNMENT_DOCS := $(wildcard assignments/*/*/main.tex)
ALL_DOCS        := $(LECTURE_DOCS) $(ASSIGNMENT_DOCS)

.PHONY: all lectures assignments clean

all: lectures assignments clean

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

clean:
	@for f in $(ALL_DOCS); do \
	  (cd $$(dirname $$f) && latexmk main.tex); \
	done
