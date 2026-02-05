# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# Build all formats (PDF + HTML)
./build.sh all

# Build specific template
./build.sh artivisi    # Custom Artivisi template (recommended, 2 pages)
./build.sh moderncv    # ModernCV template (4 pages)
./build.sh altacv      # AltaCV two-column (3 pages)
./build.sh jakes       # ATS-friendly minimal (2 pages)
./build.sh html        # GitHub Pages version → index.html
./build.sh card        # Digital business card → card.html
```

Requires Docker. Outputs go to `output/cv-endy-YYYYMMDD-<template>.pdf`.

## Architecture

Data-driven CV system using Pandoc templating:

```
src/cv-data.yaml          → Single source of truth for all CV content
src/templates/*/template.tex → LaTeX templates with Pandoc variables
src/templates/html/template.html → HTML template for web version
```

**Data flow:** `cv-data.yaml` → Pandoc + template → `.tex` → LaTeX compiler → PDF

Each template uses Pandoc variable syntax (`$variable$`, `$for(list)$...$endfor$`, `$if(condition)$...$endif$`) to interpolate YAML data.

## Template System

Templates use different LaTeX engines:
- `moderncv`, `jakes`, `artivisi`: pdflatex
- `awesome-cv`: xelatex
- `altacv`: lualatex

Custom `.cls` files (altacv.cls, awesome-cv.cls) are copied to output/ before compilation.

## YAML Data Structure

Key sections in `cv-data.yaml`:
- `personal`: Contact info (firstname, familyname, email, phone, homepage, address)
- `style`: Theme settings (color, last_update)
- `summary`: Professional summary text
- `skills`: Array of {category, items}
- `experience`: Array of {year, organization, role, description}
- `software_development`: Project portfolio with {year, project, client, role, description, tech}
- `consulting`: Consulting engagements
- `training_topics`: Training expertise areas
- `education`: Academic background

## Adding New Content

Edit `src/cv-data.yaml` directly. Templates automatically render new entries. To modify layout, edit the corresponding `template.tex` file.
