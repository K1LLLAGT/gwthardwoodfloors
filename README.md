# GWT Hardwood Floors

The official website for **GWT Hardwood Floors** — a second-generation, family-run hardwood flooring company serving Pontiac, Metro Detroit, and homeowners across Michigan. Refinishing, installation, and custom hand-mixed stain work.

🔗 **Live site:** https://k1lllagt.github.io/gwthardwoodfloors/
*(or [gwthardwoodfloors.com](https://gwthardwoodfloors.com) once the custom domain is connected — see below)*

---

## About this site

A fast, fully static website — no frameworks, no build step, no database. Just hand-written HTML, CSS, and a small amount of vanilla JavaScript. It loads instantly, works without JavaScript, and is cheap (free) to host on GitHub Pages.

**Eight pages:**

| Page | File | What's on it |
|------|------|--------------|
| Home | `index.html` | Hero, services overview, featured project, family story |
| Services | `services.html` | All 9 services with what/when/why detail |
| Portfolio | `portfolio.html` | The Isaac & Rachel Red Oak case study |
| Stain Gallery | `stain-gallery.html` | Custom color families, hand-built stain swatches |
| About | `about.html` | The Turner family story and values |
| FAQ | `faq.html` | 14 common questions answered |
| Floor Care | `floor-care.html` | How to clean and protect your floors |
| Pricing | `pricing.html` | Price ranges and what drives a quote |

---

## Project structure

```
gwthardwoodfloors/
├── index.html          # Home
├── services.html
├── portfolio.html
├── stain-gallery.html
├── about.html
├── faq.html
├── floor-care.html
├── pricing.html
├── style.css           # Full design system (one shared stylesheet)
├── main.js             # Mobile nav + scroll-reveal (progressive enhancement)
├── .nojekyll           # Tells GitHub Pages to serve files as-is
└── README.md
```

> The header, footer, and navigation are duplicated across every page (there is no
> templating engine). To change a phone number, email, or nav link everywhere, do a
> find-and-replace across all `.html` files.

---

## Run it locally

No tooling required. From inside the project folder:

```bash
python3 -m http.server 8000
```

Then open **http://localhost:8000** in a browser. Edit a file, refresh the page, see the change. Stop the server with `Ctrl-C`.

---

## Deploy to GitHub Pages

This repo is set up to publish straight from the `main` branch — every push goes live automatically.

**One-time setup:**

1. Push your code to `main` (if you haven't already):
   ```bash
   git add .
   git commit -m "Update site"
   git push origin main
   ```
2. On GitHub, go to the repo → **Settings** → **Pages**.
3. Under **Build and deployment → Source**, choose **Deploy from a branch**.
4. Set **Branch** to `main` and the folder to **`/ (root)`**, then click **Save**.
5. Wait ~1 minute. The site goes live at **https://k1lllagt.github.io/gwthardwoodfloors/**.

After that, every `git push` to `main` redeploys the site on its own. No CLI tools, no Cloudflare, no server to maintain.

> **Why `.nojekyll`?** GitHub Pages runs files through Jekyll by default, which can ignore
> some files and folders. This site is plain HTML, so the empty `.nojekyll` file disables
> that step and guarantees every file is served exactly as written.

---

## Connect the custom domain (gwthardwoodfloors.com)

Optional — do this once you own the domain and want it to replace the `github.io` URL.

**1. Add the domain on GitHub**

Repo → **Settings → Pages → Custom domain** → type `gwthardwoodfloors.com` → **Save**.
This commits a `CNAME` file to the repo automatically.

**2. Add DNS records at your domain registrar**

For the apex domain (`gwthardwoodfloors.com`), create four **A records** pointing to GitHub's IPs:

```
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

*(Optional IPv6 — add these as AAAA records too:)*

```
2606:50c0:8000::153
2606:50c0:8001::153
2606:50c0:8002::153
2606:50c0:8003::153
```

For the `www` version, add one **CNAME record**: host `www` → `k1lllagt.github.io`.

**3. Enable HTTPS**

Back in **Settings → Pages**, wait for the domain to verify (can take up to 24 hours for DNS to propagate), then tick **Enforce HTTPS**. GitHub issues the SSL certificate for free.

---

## Editing guide

**Swap placeholder images for real photos.** The portfolio and gallery currently use styled
placeholder blocks. To drop in a real photo, replace a placeholder `<div>` with:

```html
<img src="images/your-photo.jpg" alt="Describe the photo" loading="lazy">
```

Create an `images/` folder in the repo, commit your photos there, and reference them by path.

**Update contact info.** Phone numbers and emails appear in the footer and contact sections of
every page. Find-and-replace across all `.html` files to change them everywhere at once.

**Change colors or fonts.** Everything visual is controlled by CSS variables at the top of
`style.css` (the `:root { ... }` block) — colors, the honey-amber accent, spacing, and the
Fraunces / Hanken Grotesk type pairing. Change a value there and it updates site-wide.

---

## Design notes

- **Type:** Fraunces (display headings) + Hanken Grotesk (body), loaded from Google Fonts.
- **Palette:** warm walnut and espresso browns against off-white "paper," with a honey-amber accent — the bare-oak-to-finished-wood metaphor of the craft.
- **Signature element:** the stain swatch cards, built as CSS gradients, mirror the physical
  sample boards the family mixes for every custom color.
- **Accessibility:** all content is visible without JavaScript; the scroll animations are a
  progressive enhancement layered on top. Honors `prefers-reduced-motion` and uses visible
  focus outlines for keyboard navigation.

---

*Built for GWT Hardwood Floors — family-owned, Michigan-built.*

