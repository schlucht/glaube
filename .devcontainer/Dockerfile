FROM debian:stable-slim

# System-Updates und Grundpakete
RUN apt-get update && apt-get install -y \
    wget \
    perl \
    make \
    git \
    xz-utils \
    fontconfig \
    lmodern \
    biber \
    latexmk \
    texlive-full \
    && rm -rf /var/lib/apt/lists/*

# Deutschsprachige Unterstützung (optional, falls nicht in texlive-full enthalten)
RUN apt-get update && apt-get install -y texlive-lang-german && rm -rf /var/lib/apt/lists/*

# Arbeitsverzeichnis setzen
WORKDIR /workspaces/glaube

# Standardbefehl (kann angepasst werden)
CMD ["bash"]
