FROM texlive/texlive:latest

RUN apt-get update && apt-get install -y \
    latexmk \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-lang-german \
    texlive-science \
    texlive-humanities \
    biber \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN tlmgr install iftex

WORKDIR /workspaces/glaube
