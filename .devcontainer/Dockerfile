FROM debian:stable-slim

# System-Updates und Grundpakete
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
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
ENV TEXINPUTS=/workspaces/glaube/inc//:/workspaces/glaube/assets//:
CMD ["bash"]

# ---------------------------------------------------------
# SBL Hebrew + SBL Greek installieren
# ---------------------------------------------------------



# ---------------------------------------------------------
# Gentium Plus installieren
# ---------------------------------------------------------
# RUN mkdir