# Resume - Endy Muhardin

LaTeX-based CV/Resume with data-driven content using YAML and Pandoc.

## Prerequisites

- Docker

## Build

```bash
./build.sh
```

Output: `output/cv-endy.pdf`

## Project Structure

```
.
├── src/
│   ├── cv-data.yaml       # CV content (edit this)
│   └── cv-template.tex    # LaTeX template (Pandoc syntax)
├── output/                # Generated files (gitignored)
│   ├── cv-endy.tex
│   └── cv-endy.pdf
├── build.sh               # Build script
├── Dockerfile
└── README.md
```

## Editing Content

Edit `src/cv-data.yaml` to update:
- Personal info (`personal.*`)
- Style options (`style.*`)
- Professional summary (`summary`)
- Core competencies (`skills`)
- Work experience (`experience`)
- Software projects (`software_development`)
- Consulting engagements (`consulting`)
- Training topics (`training_topics`)
- Open source projects (`opensource`)
- Publications (`writings`)
- Education (`education`)

## Changing Style

Edit `style` section in `src/cv-data.yaml`:

```yaml
style:
  theme: classic      # classic, casual, banking, oldstyle
  color: red          # blue, orange, green, red, purple, grey, burgundy
  last_update: "20250103"
```

Font (Lato) is configured in the template.
