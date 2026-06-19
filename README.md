# GWT Hardwood Floors

The official website for **GWT Hardwood Floors** — a second-generation, family-run hardwood flooring company serving Pontiac, Metro Detroit, and homeowners across Michigan. Refinishing, installation, and hand-mixed custom Duraseal stain work.

🔗 **Live site:** https://k1lllagt.github.io/gwthardwoodfloors/
*(or [gwthardwoodfloors.com](https://gwthardwoodfloors.com) once the custom domain is connected — see below)*

---

## About this site

A fast, fully static website — no frameworks, no build step, no database. Just hand-written HTML, CSS, and a small amount of vanilla JavaScript. It loads instantly, works without JavaScript, and is free to host on GitHub Pages.

**Seven pages:**

| Page | File | What's on it |
|------|------|--------------|
| Home | `index.html` | Hero, what we do, why families call us back, contact |
| Services | `services.html` | All 9 services as a detailed reference list |
| Stain Gallery | `stain-gallery.html` | The full 36-color Duraseal catalog, numbered, plus our WheatStone Oak signature blend |
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
├── stain-gallery.html
├── about.html
├── faq.html
├── floor-care.html
├── pricing.html
├── style.css           # Full design system (one shared stylesheet)
├── main.js             # Mobile nav close-on-click + scroll-reveal
├── .nojekyll            # Tells GitHub Pages to serve files as-is
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

This repo publishes straight from the `main` branch — every push goes live automatically.

**One-time setup (already done for this repo):**

1. Repo → **Settings** → **Pages**.
2. **Source:** Deploy from a branch.
3. **Branch:** `main`, folder **`/ (root)`** → **Save**.

**Every update after that is just:**

```bash
git add -A
git commit -m "Describe what changed"
git push origin main
```

Wait about a minute, then reload the site. No CLI tools, no Cloudflare, no server to maintain.

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

**Add real photography.** There's no job-site photography yet, so every image area on the
site — the homepage hero, the About page, the stain catalog — uses a **specimen panel**:
a textured material swatch with a small catalog-style tag, standing in for a photo. This
keeps the site looking intentional rather than "image missing."

To swap a specimen panel for a real photo, find its `.specimen-media` or `.material-panel`
`<div>` and replace it with an `<img>`:

```html
<div class="specimen-media">
  <img src="images/your-photo.jpg" alt="Describe the photo" loading="lazy" style="width:100%;height:100%;object-fit:cover">
  <span class="specimen-tag">Your caption</span>
</div>
```

Create an `images/` folder in the repo, commit your photos there, and reference them by path.
Once you have a body of real project photos, bringing back a dedicated portfolio page
(removed earlier for privacy reasons) would be the single biggest trust upgrade for the site.

**Update contact info.** Phone numbers and emails appear in the footer and contact sections of
every page. Find-and-replace across all `.html` files to change them everywhere at once.

**Change colors or fonts.** Everything visual is controlled by CSS variables at the top of
`style.css` (the `:root { ... }` block): `--ink`, `--bone`, `--brass`, and the rest of the
palette, plus the Fraunces / Inter type pairing. Change a value there and it updates site-wide.

**Edit the stain catalog.** Each Duraseal color is one `.specimen` block inside
`stain-gallery.html`, grouped by family (Whites & Neutrals, Grays, Golden & Light Browns,
Warm Browns, Reds & Mahogany, Rich Darks) and numbered sequentially (No. 01–36). Swatches
are CSS gradients, not photos — see the in-page note linking to Duraseal's official gallery
for true photographed colors.

---

## Design notes

- **Type:** Fraunces, light weight (300–400) at large sizes for headlines — editorial, not
  decorative — paired with Inter for body text and tracked-uppercase labels.
- **Palette:** near-black ink, bone and parchment paper, deep walnut, and an antique brass
  accent used only as hairlines, labels, and hover states — never a filled button or card.
- **Layout:** hairline-divided editorial lists instead of rounded card grids (see Services
  and Pricing) — closer to a spec sheet or menu than a typical contractor site.
- **Signature element:** the specimen panel — a material-grain swatch with a small catalog
  tag, used for the hero image, the Duraseal stain catalog, and every other "photography"
  slot on the site until real jobsite photos are ready.
- **Navigation:** the mobile menu is a native `<details>` element, so it opens and closes
  correctly even with JavaScript disabled. `main.js` only adds a "close on link tap" polish
  on top.
- **Accessibility:** all content is visible without JavaScript; scroll-reveal animations are
  a progressive enhancement layered on top via a `.js` class set before paint. Honors
  `prefers-reduced-motion` and uses visible focus outlines for keyboard navigation.

---

*Built for GWT Hardwood Floors — family-owned, Michigan-built.*
