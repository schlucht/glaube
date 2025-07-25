FROM texlive/texlive:latest
COPY ./src /src
    WORKDIR /src
RUN tlmgr install iftex
CMD ["echo", "Container gestartet. Bereit zur Kompilierung."]
