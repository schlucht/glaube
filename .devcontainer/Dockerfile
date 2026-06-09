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

# ---------------------------------------------------------
# SBL Hebrew + SBL Greek installieren
# ---------------------------------------------------------
RUN mkdir -p /usr/local/share/fonts/truetype/sbl \
    && wget -O /usr/local/share/fonts/truetype/sbl/SBL_Hbrw.ttf https://www.sbl-site.org/Fonts/SBL_Hbrw.ttf \
    && wget -O /usr/local/share/fonts/truetype/sbl/SBL_grk.ttf https://www.sbl-site.org/Fonts/SBL_grk.ttf

# ---------------------------------------------------------
# Gentium Plus installieren
# ---------------------------------------------------------
RUN mkdir