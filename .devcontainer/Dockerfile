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
RUN apt-get update && apt-get install -y \
    locales \
    texlive-lang-german \
&& sed -i '/de_CH.UTF-8/s/^# //g' /etc/locale.gen \
&& locale-gen \
&& rm -rf /var/lib/apt/lists/*

ENV LANG=de_CH.UTF-8
ENV LC_ALL=de_CH.UTF-8
ENV TEXINPUTS=/workspaces/glaube/inc//:/workspaces/glaube/assets//:

CMD ["bash"]

# ---------------------------------------------------------
# SBL Hebrew + SBL Greek installieren
# ---------------------------------------------------------



# ---------------------------------------------------------
# Gentium Plus installieren
# ---------------------------------------------------------
# RUN mkdir