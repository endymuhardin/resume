#!/bin/bash
set -e

docker run --rm \
    -v "$(pwd)":/workspace \
    -w /workspace \
    texlive/texlive:latest \
    sh -c "apt-get update -qq && apt-get install -y -qq pandoc && \
           pandoc --metadata-file=src/cv-data.yaml --template=src/cv-template.tex -o output/cv-endy.tex /dev/null && \
           cd output && pdflatex cv-endy.tex"
