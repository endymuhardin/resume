#!/bin/bash
set -e

TEMPLATE=${1:-moderncv}
DATE=$(date +%Y%m%d)
OUTPUT_NAME="cv-endy-${DATE}-${TEMPLATE}.pdf"

echo "Building with template: $TEMPLATE"

case $TEMPLATE in
  moderncv)
    docker run --rm \
      -v "$(pwd)":/workspace \
      -w /workspace \
      texlive/texlive:latest \
      sh -c "apt-get update -qq && apt-get install -y -qq pandoc && \
             pandoc --metadata-file=src/cv-data.yaml --template=src/cv-template.tex -o output/cv-endy.tex /dev/null && \
             cd output && pdflatex cv-endy.tex && \
             rm -f cv-endy.aux cv-endy.log cv-endy.out cv-endy.tex"
    ;;
  awesome-cv)
    docker run --rm \
      -v "$(pwd)":/workspace \
      -w /workspace \
      texlive/texlive:latest \
      sh -c "apt-get update -qq && apt-get install -y -qq pandoc && \
             cp src/templates/awesome-cv/awesome-cv.cls output/ && \
             pandoc --metadata-file=src/cv-data.yaml --template=src/templates/awesome-cv/template.tex -o output/cv-endy.tex /dev/null && \
             cd output && xelatex cv-endy.tex && \
             rm -f cv-endy.aux cv-endy.log cv-endy.out cv-endy.tex awesome-cv.cls"
    ;;
  altacv)
    docker run --rm \
      -v "$(pwd)":/workspace \
      -w /workspace \
      texlive/texlive:latest \
      sh -c "apt-get update -qq && apt-get install -y -qq pandoc && \
             cp src/templates/altacv/altacv.cls output/ && \
             pandoc --metadata-file=src/cv-data.yaml --template=src/templates/altacv/template.tex -o output/cv-endy.tex /dev/null && \
             cd output && lualatex cv-endy.tex && \
             rm -f cv-endy.aux cv-endy.log cv-endy.out cv-endy.tex altacv.cls pdfa.xmpi"
    ;;
  jakes)
    docker run --rm \
      -v "$(pwd)":/workspace \
      -w /workspace \
      texlive/texlive:latest \
      sh -c "apt-get update -qq && apt-get install -y -qq pandoc && \
             pandoc --metadata-file=src/cv-data.yaml --template=src/templates/jakes/template.tex -o output/cv-endy.tex /dev/null && \
             cd output && pdflatex cv-endy.tex && \
             rm -f cv-endy.aux cv-endy.log cv-endy.out cv-endy.tex"
    ;;
  artivisi)
    docker run --rm \
      -v "$(pwd)":/workspace \
      -w /workspace \
      texlive/texlive:latest \
      sh -c "apt-get update -qq && apt-get install -y -qq pandoc && \
             pandoc --metadata-file=src/cv-data.yaml --template=src/templates/artivisi/template.tex -o output/cv-endy.tex /dev/null && \
             cd output && pdflatex cv-endy.tex && pdflatex cv-endy.tex && \
             rm -f cv-endy.aux cv-endy.log cv-endy.out cv-endy.tex"
    ;;
  html)
    docker run --rm \
      -v "$(pwd)":/workspace \
      -w /workspace \
      texlive/texlive:latest \
      sh -c "apt-get update -qq && apt-get install -y -qq pandoc && \
             pandoc --metadata-file=src/cv-data.yaml --template=src/templates/html/template.html -o index.html /dev/null"
    echo "Output: index.html"
    exit 0
    ;;
  card)
    docker run --rm \
      -v "$(pwd)":/workspace \
      -w /workspace \
      texlive/texlive:latest \
      sh -c "apt-get update -qq && apt-get install -y -qq pandoc && \
             pandoc --metadata-file=src/cv-data.yaml --template=src/templates/card/template.html -o card.html /dev/null"
    echo "Output: card.html"
    exit 0
    ;;
  all)
    echo "Building all templates..."
    for t in artivisi moderncv altacv jakes html card; do
      echo "=== Building $t ==="
      $0 $t || echo "Failed: $t"
    done
    echo "Done. Check output/cv-endy-*.pdf, index.html, and card.html"
    exit 0
    ;;
  *)
    echo "Usage: $0 [artivisi|moderncv|awesome-cv|altacv|jakes|html|card|all]"
    exit 1
    ;;
esac

# Rename to final output name
mv output/cv-endy.pdf "output/${OUTPUT_NAME}"
echo "Output: output/${OUTPUT_NAME}"
