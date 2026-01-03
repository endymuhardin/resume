FROM texlive/texlive:latest

WORKDIR /workspace

ENTRYPOINT ["pdflatex"]
