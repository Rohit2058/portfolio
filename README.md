# Rohit Kumar Sah — Freelance Portfolio

Freelance electrical engineer portfolio website built with **Astro** and plain CSS. Static site with Markdown-driven content, mobile-first, accessible, self-hosted fonts, engineering blueprint theme.

**Live site:** https://rohit2058.github.io/portfolio/

## Features

- ⚡ **Astro** — static site generation, zero JS by default
- 📝 **Markdown content** — content collections for projects, samples, and site copy
- 🎨 **Engineering blueprint theme** — navy (#0B1220), amber (#ffb703), cyan (#4cc9f0)
- 🌓 **Dark/Light/System theme toggle** — with localStorage persistence
- 📱 **Mobile-first responsive** — CSS Grid, Flexbox, fluid typography
- ♿ **Accessible** — semantic HTML, focus states, skip links, reduced motion support
- 🔤 **Self-hosted fonts** — Space Grotesk, Inter, JetBrains Mono (WOFF2)
- 🚀 **GitHub Pages deployment** — with `withastro/action` + `actions/deploy-pages`
- 📦 **Content-driven** — all text in Markdown files under `src/content/`

## Project Structure

```
├── .github/workflows/deploy.yml    # GitHub Pages CI/CD
├── public/
│   ├── favicon.svg
│   ├── fonts/                      # Self-hosted WOFF2 fonts
│   └── content/                    # Images, figures, sample files (copied from src/content/)
├── src/
│   ├── components/                 # Reusable Astro components
│   │   ├── BlueprintGrid.astro     # SVG blueprint grid background
│   │   ├── FloatingWhatsApp.astro  # Fixed WhatsApp button
│   │   ├── Navbar.astro            # Sticky navbar with mobile menu
│   │   └── ThemeToggle.astro       # Dark/light/system theme switcher
│   ├── content/                    # Markdown content (source of truth)
│   │   ├── config.ts               # Content collections schema
│   │   ├── figures/                # Project images
│   │   ├── images/                 # Profile photo
│   │   ├── projects/               # Project markdown files
│   │   ├── samples/                # Sample deliverable files
│   │   └── site-copy.md            # Site-wide copy
│   ├── layouts/
│   │   └── BaseLayout.astro        # Root layout with CSS variables
│   ├── pages/
│   │   ├── index.astro             # Home page
│   │   ├── about.astro             # About page
│   │   ├── services.astro          # Services page
│   │   ├── work.astro              # Work portfolio page
│   │   ├── work/avr-pss.astro      # AVR-PSS case study
│   │   ├── work/load-flow.astro    # 5-bus load flow worked example
│   │   └── contact.astro           # Contact page
│   └── styles/
│       └── global.css              # Global styles (imported in BaseLayout)
├── astro.config.mjs                # Astro config (site, base, integrations)
└── package.json
```

## Pages

| Page | Path | Description |
|------|------|-------------|
| Home | `/` | Hero, trust strip, services short list, selected work, how I work, contact CTA |
| About | `/about/` | Bio, tools, teaching, TODO badge for NEC registration |
| Services | `/services/` | 8 services with descriptions and "Get quote" buttons |
| Work | `/work/` | Academic project (AVR-PSS) + 3 sample deliverables with download links |
| AVR-PSS Case Study | `/work/avr-pss/` | Full academic project detail with tables, figures, results |
| 5-Bus Load Flow | `/work/load-flow/` | Worked example with system data, convergence, results, downloads |
| Contact | `/contact/` | WhatsApp, email, LinkedIn cards + quick actions |

## Development

```bash
# Install dependencies
npm install

# Start dev server (localhost:4321)
npm run dev

# Build for production (outputs to ./dist)
npm run build

# Preview production build locally
npm run preview

# Run Astro CLI
npm run astro -- --help
```

## Deployment

The site is configured for GitHub Pages at `https://rohit2058.github.io/portfolio/` with base path `/portfolio/`.

1. Push to `main` branch
2. GitHub Actions runs `.github/workflows/deploy.yml`
3. Builds with `npm run build` (respects `base: '/portfolio/'` in `astro.config.mjs`)
4. Deploys `./dist` to GitHub Pages

**Important:** The repository is NOT `<username>.github.io` — it's a project repo named `portfolio`, so the base path **must** be `/portfolio/`.

## Content Management

All content lives in `src/content/` as Markdown files with frontmatter:

- **Site copy** → `src/content/site-copy.md`
- **Projects** → `src/content/projects/*.md` (e.g., `avr-pss.md`)
- **Samples** → `src/content/samples/*.md` + associated files

Add new projects by creating a `.md` file in `src/content/projects/` with the schema defined in `src/content/config.ts`.

## Theme System

CSS custom properties in `BaseLayout.astro` define the design tokens:

```css
:root {
  --navy: #0B1220;
  --amber: #ffb703;
  --cyan: #4cc9f0;
  --ink: #e8ecf1;
  --muted: #9aa4b2;
  --glass: rgba(255,255,255,0.04);
  --glass-border: rgba(255,255,255,0.08);
  --font-heading: 'Space Grotesk', ...;
  --font-body: 'Inter', ...;
  --font-mono: 'JetBrains Mono', ...;
}

[data-theme="light"] { /* light overrides */ }
```

The `ThemeToggle` component cycles: **System → Dark → Light** and persists to `localStorage`.

## Accessibility

- Semantic HTML5 (`<main>`, `<nav>`, `<section>`, `<article>`)
- Skip link for keyboard users
- Focus-visible styles on all interactive elements
- `prefers-reduced-motion` respected (animations disabled)
- Sufficient color contrast in both themes
- Alt text on all images
- ARIA labels on icon-only buttons

## Fonts (Self-Hosted)

| Font | Weights | File |
|------|---------|------|
| Space Grotesk | Variable (300-700) | `/fonts/space-grotesk.woff2` |
| Inter | Variable (100-900) | `/fonts/inter.woff2` |
| JetBrains Mono | Variable (100-800) | `/fonts/jetbrains-mono.woff2` |

Preloaded in `BaseLayout.astro` for fast text rendering.

## Sample Files Disclaimer

All sample deliverables under **Work → Sample deliverables** are **worked examples with assumed data** — not client projects. The site includes visible badges and a footer note:

> *Sample files are worked examples with assumed values. Check them against current standards and NEA rules before real use.*

## Author

**Rohit Kumar Sah**  
BE Electrical Engineering, Tribhuvan University (2025)  
Instructor, Banepa Polytechnic Institute  
Based in Banepa, Nepal — working remotely  

- WhatsApp: +977 9716100765
- Email: rs28102058@gmail.com
- LinkedIn: [rohit-sah-202026229](https://www.linkedin.com/in/rohit-sah-202026229/)

## License

MIT License — feel free to use as a template for your own portfolio.