FROM ubuntu:26.04

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
      texlive-latex-extra \
      texlive-fonts-recommended \
      texlive-fonts-extra \
      texlive-bibtex-extra \
      texlive-publishers \
      latexmk \
      make \
      zip && \
    rm -rf /var/lib/apt/lists/*
