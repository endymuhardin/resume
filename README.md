# Resume - Endy Muhardin

Data-driven CV using YAML content + LaTeX/HTML templates with Pandoc.

## Quick Start

```bash
# Build all formats
./build.sh all

# Build specific template
./build.sh artivisi    # Custom Artivisi template (recommended)
./build.sh architect   # Solution Architect specialized CV
./build.sh moderncv    # ModernCV template
./build.sh altacv      # AltaCV template
./build.sh jakes       # Jake's Resume template
./build.sh html        # HTML for GitHub Pages
./build.sh card        # Digital business card
```

## Output

- `output/cv-endy-YYYYMMDD-artivisi.pdf` - Custom template (2 pages)
- `output/cv-endy-YYYYMMDD-moderncv.pdf` - ModernCV (4 pages)
- `output/cv-endy-YYYYMMDD-altacv.pdf` - AltaCV (3 pages)
- `output/cv-endy-YYYYMMDD-jakes.pdf` - Jake's Resume (2 pages)
- `index.html` - GitHub Pages version
- `card.html` - Digital business card (standalone)

## Prerequisites

- Docker

## Project Structure

```
.
├── src/
│   ├── cv-data.yaml              # CV content (edit this)
│   ├── cv-template.tex           # ModernCV template
│   └── templates/
│       ├── artivisi/template.tex # Custom Artivisi template
│       ├── altacv/               # AltaCV template + class
│       ├── jakes/template.tex    # Jake's Resume template
│       ├── html/template.html    # HTML template
│       └── card/template.html   # Business card template
├── output/                       # Generated PDFs
├── index.html                    # Generated HTML
├── card.html                     # Generated business card
├── build.sh                      # Build script
└── README.md
```

## Editing Content

Edit `src/cv-data.yaml`:

| Section | Description |
|---------|-------------|
| `personal` | Name, title, contact info |
| `summary` | Professional summary |
| `skills` | Technical competencies |
| `experience` | Work history |
| `software_development` | Project portfolio |
| `consulting` | Consulting engagements |
| `training_topics` | Training expertise |
| `education` | Academic background |

## Templates

| Template | Pages | Style | Best For |
|----------|-------|-------|----------|
| artivisi | 2 | Minimalist, brand colors | Primary/recommended |
| moderncv | 4 | Classic professional | Detailed CV |
| altacv | 3 | Two-column modern | Creative roles |
| jakes | 2 | ATS-friendly minimal | Online applications |
| card | 1 | Digital business card | Sharing, networking |

## GitHub Pages

After pushing, enable GitHub Pages (Settings → Pages → Source: main) to serve at:
`https://<username>.github.io/resume/`
