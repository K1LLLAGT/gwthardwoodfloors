#!/usr/bin/env bash
# GWT Hardwood Floors — full design rebuild.
# Overwrites every page + style.css + main.js with the new high-end design.
# Leaves README.md, deploy/, .nojekyll, and .git untouched.
# Run from inside your repo:  bash rebuild-site.sh
set -e

cat > style.css << 'GWTFILEEOF'
/* ==========================================================================
   GWT HARDWOOD FLOORS — design system
   Ink / bone / brass. Editorial serif at scale, hairlines instead of cards,
   specimen panels instead of stock photography. See README for rationale.
   ========================================================================== */

:root {
  /* Color */
  --ink:        #15120F;
  --ink-soft:   #2B241D;
  --bone:       #F6F2EA;
  --paper:      #FBF8F2;
  --parchment:  #EEE6D6;
  --walnut:     #3B2A1E;
  --brass:      #9C7A45;
  --brass-soft: #C9AD7C;
  --mist:       #84796A;
  --line:       rgba(21,18,15,.14);
  --line-soft:  rgba(21,18,15,.08);
  --line-dk:    rgba(246,242,234,.20);
  --line-dk-soft: rgba(246,242,234,.10);

  /* Type */
  --serif: 'Fraunces', serif;
  --sans:  'Inter', sans-serif;

  /* Rhythm */
  --section-pad: clamp(4.5rem, 9vw, 8rem);
  --container-w: 1180px;
  --side-pad: clamp(1.25rem, 5vw, 3rem);
}

/* ----- Reset --------------------------------------------------------- */
*, *::before, *::after { box-sizing: border-box; }
html { scroll-behavior: smooth; }
body {
  margin: 0;
  background: var(--bone);
  color: var(--ink-soft);
  font-family: var(--sans);
  font-size: 16px;
  line-height: 1.65;
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}
img { max-width: 100%; display: block; }
a { color: inherit; text-decoration: none; }
ul { list-style: none; margin: 0; padding: 0; }
h1, h2, h3, h4, p { margin: 0; }
button { font: inherit; background: none; border: none; cursor: pointer; color: inherit; }

.container { max-width: var(--container-w); margin-inline: auto; padding-inline: var(--side-pad); }

/* ----- Typography ------------------------------------------------------ */
h1, h2, h3 { font-family: var(--serif); font-weight: 400; color: var(--ink); letter-spacing: -0.01em; }

h1 { font-size: clamp(2.6rem, 6vw, 5rem); font-weight: 340; line-height: 1.04; letter-spacing: -0.022em; }
h2 { font-size: clamp(1.9rem, 4vw, 3rem); line-height: 1.1; }
h3 { font-size: clamp(1.25rem, 2vw, 1.55rem); font-weight: 500; }

.lead { font-size: clamp(1.05rem, 1.6vw, 1.2rem); color: var(--ink-soft); line-height: 1.7; max-width: 46ch; }
.lead--wide { max-width: 60ch; }

.eyebrow {
  display: inline-flex; align-items: center; gap: .65em;
  font: 600 .72rem/1 var(--sans); letter-spacing: .17em; text-transform: uppercase;
  color: var(--brass); margin-bottom: 1.1rem;
}
.eyebrow::before { content: ''; width: 26px; height: 1px; background: var(--brass); flex-shrink: 0; }
.eyebrow--dark { color: var(--brass-soft); }

.cap { font: 500 .82rem/1 var(--sans); letter-spacing: .06em; text-transform: uppercase; color: var(--mist); }

em { font-style: italic; color: var(--ink); }

/* ----- Buttons ----------------------------------------------------------- */
.btn {
  display: inline-flex; align-items: center; gap: .6rem;
  font: 600 .8rem var(--sans); letter-spacing: .08em; text-transform: uppercase;
  padding: 1rem 1.9rem; border: 1px solid var(--ink); background: var(--ink); color: var(--bone);
  transition: background .25s ease, color .25s ease, border-color .25s ease;
  white-space: nowrap;
}
.btn:hover { background: var(--brass); border-color: var(--brass); color: var(--ink); }
.btn .arrow { transition: transform .25s ease; }
.btn:hover .arrow { transform: translateX(3px); }

.btn--ghost { background: transparent; color: var(--ink); border-color: var(--ink); }
.btn--ghost:hover { background: var(--ink); color: var(--bone); border-color: var(--ink); }

.btn--ghost-dark { background: transparent; color: var(--bone); border-color: var(--line-dk); }
.btn--ghost-dark:hover { background: var(--brass-soft); color: var(--ink); border-color: var(--brass-soft); }

.link-arrow {
  display: inline-flex; align-items: center; gap: .45em;
  font: 600 .85rem var(--sans); letter-spacing: .03em; color: var(--ink);
  border-bottom: 1px solid var(--line); padding-bottom: .15rem;
  transition: border-color .2s ease, color .2s ease;
}
.link-arrow:hover { color: var(--brass); border-color: var(--brass); }
.link-arrow .arrow { transition: transform .2s ease; }
.link-arrow:hover .arrow { transform: translateX(3px); }

.btn-row { display: flex; flex-wrap: wrap; gap: 1rem; }

/* ----- Header / nav ------------------------------------------------------ */
.site-header {
  position: sticky; top: 0; z-index: 50;
  background: rgba(246,242,234,.92); backdrop-filter: blur(8px);
  border-bottom: 1px solid var(--line);
}
.nav { display: flex; align-items: center; justify-content: space-between; padding-block: 1.3rem; gap: 2rem; }

.brand { display: flex; align-items: baseline; gap: .65rem; }
.brand-mark { font: 500 1.05rem var(--serif); letter-spacing: .14em; color: var(--ink); }
.brand-name { display: block; font: 500 .76rem var(--sans); letter-spacing: .02em; color: var(--ink); }
.brand-sub { display: block; font: 500 .64rem var(--sans); letter-spacing: .1em; text-transform: uppercase; color: var(--mist); margin-top: .15rem; }

.nav-links-desktop { display: flex; align-items: center; gap: 2.1rem; }
.nav-links-desktop a {
  font: 600 .76rem var(--sans); letter-spacing: .09em; text-transform: uppercase; color: var(--ink-soft);
  position: relative; padding-bottom: .3rem;
}
.nav-links-desktop a::after {
  content: ''; position: absolute; left: 0; right: 0; bottom: 0; height: 1px; background: var(--brass);
  transform: scaleX(0); transform-origin: left; transition: transform .25s ease;
}
.nav-links-desktop a:hover::after, .nav-links-desktop a.active::after { transform: scaleX(1); }
.nav-links-desktop a.active { color: var(--ink); }

.nav-cta-desktop { flex-shrink: 0; }

/* Mobile nav — native <details>, works with zero JS */
.nav-mobile { display: none; }
.nav-mobile summary {
  list-style: none; cursor: pointer;
  display: flex; align-items: center; gap: .6rem;
  font: 600 .76rem var(--sans); letter-spacing: .1em; text-transform: uppercase; color: var(--ink);
}
.nav-mobile summary::-webkit-details-marker { display: none; }
.nav-mobile .burger { position: relative; width: 20px; height: 14px; flex-shrink: 0; }
.nav-mobile .burger span {
  position: absolute; left: 0; right: 0; height: 1px; background: var(--ink); transition: transform .2s ease, opacity .2s ease, top .2s ease;
}
.nav-mobile .burger span:nth-child(1) { top: 0; }
.nav-mobile .burger span:nth-child(2) { top: 6px; }
.nav-mobile .burger span:nth-child(3) { top: 12px; }
.nav-mobile[open] .burger span:nth-child(1) { top: 6px; transform: rotate(45deg); }
.nav-mobile[open] .burger span:nth-child(2) { opacity: 0; }
.nav-mobile[open] .burger span:nth-child(3) { top: 6px; transform: rotate(-45deg); }

.nav-mobile-panel {
  position: absolute; top: 100%; left: 0; right: 0; z-index: 45;
  background: var(--bone); border-top: 1px solid var(--line); border-bottom: 1px solid var(--line);
  padding: 1.4rem var(--side-pad) 1.8rem;
  display: flex; flex-direction: column; gap: 0;
  max-height: calc(100vh - 100%); overflow-y: auto;
}
.nav-mobile-panel a {
  font: 400 1.5rem var(--serif); color: var(--ink);
  padding: .85rem 0; border-bottom: 1px solid var(--line-soft);
}
.nav-mobile-panel .nav-cta-mobile { margin-top: 1.4rem; align-self: flex-start; border-bottom: none; padding: 0; }

/* ----- Sections / layout ------------------------------------------------- */
.section { padding-block: var(--section-pad); }
.section--tight { padding-block: clamp(2.5rem, 5vw, 4rem); }
.section--dark { background: var(--ink); color: var(--bone); }
.section--dark h2, .section--dark h1 { color: var(--bone); }
.section--parchment { background: var(--parchment); }
.section--rule-top { border-top: 1px solid var(--line); }
.section--rule-top.section--dark { border-top: 1px solid var(--line-dk); }

.section-head { max-width: 56ch; margin-bottom: clamp(2.5rem, 5vw, 4rem); }

.center { text-align: center; margin-inline: auto; }
.center .eyebrow::before { display: none; }
.center .eyebrow { justify-content: center; }

.split { display: grid; grid-template-columns: 1fr 1fr; gap: clamp(2.5rem, 6vw, 5rem); align-items: center; }
.split--wide-left { grid-template-columns: 1.15fr .85fr; }

/* ----- Page hero (interior pages) ---------------------------------------- */
.page-hero { background: var(--ink); color: var(--bone); padding-block: clamp(4rem, 9vw, 6.5rem) clamp(3rem, 6vw, 4.5rem); }
.page-hero h1 { color: var(--bone); }
.page-hero .lead { color: rgba(246,242,234,.74); margin-top: 1.1rem; }

/* ----- Home hero ---------------------------------------------------------- */
.hero { background: var(--bone); padding-block: clamp(3rem, 7vw, 5.5rem) clamp(3.5rem, 7vw, 6rem); }
.hero-inner { display: grid; grid-template-columns: 1.05fr .95fr; gap: clamp(2.5rem, 6vw, 5rem); align-items: center; }
.hero-copy { animation: rise .8s cubic-bezier(.2,.7,.2,1) both; }
.hero-copy .eyebrow { animation: rise .7s cubic-bezier(.2,.7,.2,1) both; }
.hero-copy h1 { animation: rise .8s .08s cubic-bezier(.2,.7,.2,1) both; }
.hero-copy .lead { animation: rise .8s .16s cubic-bezier(.2,.7,.2,1) both; margin-top: 1.3rem; }
.hero-copy .btn-row { animation: rise .8s .24s cubic-bezier(.2,.7,.2,1) both; margin-top: 2rem; }
.hero-media { animation: fadeIn 1.1s .2s cubic-bezier(.2,.7,.2,1) both; }

@keyframes rise { from { opacity: 0; transform: translateY(14px); } to { opacity: 1; transform: none; } }
@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }

/* ----- Specimen panel (the signature element) -----------------------------
   Used for: hero material, stain catalog, and every "photography" slot
   site-wide. A material swatch with a catalog tag, standing in for photos
   until real jobsite imagery is ready. */
.specimen { border: 1px solid var(--line); background: var(--paper); }
.specimen--dark { border-color: var(--line-dk); background: var(--ink); }
.specimen-media {
  position: relative; aspect-ratio: 4 / 3.1; overflow: hidden;
  background-image: repeating-linear-gradient(100deg, rgba(255,255,255,.05) 0px, rgba(255,255,255,.05) 1px, transparent 1px, transparent 3px);
}
.specimen-media--tall { aspect-ratio: 3 / 4; }
.specimen-media--wide { aspect-ratio: 16 / 9; }
.specimen-tag {
  position: absolute; top: .9rem; left: .9rem;
  font: 600 .64rem var(--sans); letter-spacing: .12em; text-transform: uppercase; color: var(--ink);
  background: rgba(251,248,242,.88); padding: .4rem .65rem;
}
.specimen-body { padding: 1.3rem 1.4rem; border-top: 1px solid var(--line); }
.specimen--dark .specimen-body { border-top-color: var(--line-dk); }
.specimen-name { font: 500 1.05rem var(--serif); color: var(--ink); }
.specimen--dark .specimen-name { color: var(--bone); }
.specimen-meta { font: 400 .82rem var(--sans); color: var(--mist); margin-top: .35rem; line-height: 1.5; }
.specimen--dark .specimen-meta { color: rgba(246,242,234,.6); }

/* Generic neutral material panel (non-stain photography slots) */
.material-panel {
  position: relative; overflow: hidden; border: 1px solid var(--line);
  background:
    repeating-linear-gradient(110deg, rgba(21,18,15,.025) 0px, rgba(21,18,15,.025) 1px, transparent 1px, transparent 4px),
    linear-gradient(160deg, var(--parchment), var(--bone) 60%);
}
.material-panel .specimen-tag { background: rgba(251,248,242,.9); }
.material-panel--dark {
  background:
    repeating-linear-gradient(110deg, rgba(246,242,234,.035) 0px, rgba(246,242,234,.035) 1px, transparent 1px, transparent 4px),
    linear-gradient(160deg, #221c16, #15120F 65%);
  border-color: var(--line-dk);
}
.material-panel--dark .specimen-tag { background: rgba(21,18,15,.78); color: var(--bone); }

/* ----- Stats strip -------------------------------------------------------- */
.stats-strip {
  display: grid; grid-template-columns: repeat(4, 1fr);
  border-top: 1px solid var(--line); border-bottom: 1px solid var(--line);
}
.stat { padding: 2.4rem 1.5rem; text-align: center; border-left: 1px solid var(--line); }
.stat:first-child { border-left: none; }
.stat .num { font: 340 2.4rem var(--serif); color: var(--ink); line-height: 1; }
.stat .label { margin-top: .65rem; font: 600 .68rem var(--sans); letter-spacing: .1em; text-transform: uppercase; color: var(--mist); }

/* ----- Editorial list rows (services) ------------------------------------- */
.row-list { border-top: 1px solid var(--line); }
.row-item { display: grid; grid-template-columns: 150px 1fr; gap: clamp(1.5rem, 4vw, 3rem); padding: clamp(2rem, 4vw, 2.8rem) 0; border-bottom: 1px solid var(--line); }
.row-item .cap { padding-top: .35rem; }
.row-item h3 { margin-bottom: .6rem; }
.row-item .desc { max-width: 62ch; }
.row-item .why { margin-top: 1rem; padding-top: 1rem; border-top: 1px solid var(--line-soft); font-size: .92rem; color: var(--ink-soft); max-width: 62ch; }
.row-item .why strong { color: var(--brass); font-weight: 600; }
.row-item .row-foot { margin-top: 1.1rem; }

/* ----- Cards (used sparingly: values, contact) ---------------------------- */
.plate { border: 1px solid var(--line); padding: 2rem 1.8rem; }
.plate--dark { border-color: var(--line-dk); }
.plate .cap { color: var(--brass); margin-bottom: .9rem; }
.plate h3 { margin-bottom: .6rem; }
.plate p { font-size: .94rem; color: var(--ink-soft); }
.plate--dark p { color: rgba(246,242,234,.7); }

.grid { display: grid; gap: 1.5rem; }
.grid-2 { grid-template-columns: 1fr 1fr; }
.grid-3 { grid-template-columns: repeat(3, 1fr); }
.grid-4 { grid-template-columns: repeat(4, 1fr); }

/* ----- Spec list (key/value rows) ----------------------------------------- */
.spec-list { border-top: 1px solid var(--line); }
.spec-list li { display: flex; justify-content: space-between; gap: 1.5rem; padding: .95rem 0; border-bottom: 1px solid var(--line); font-size: .94rem; }
.spec-list .k { color: var(--mist); }
.spec-list .v { color: var(--ink); font-weight: 500; text-align: right; }
.spec-list--dark { border-top-color: var(--line-dk); }
.spec-list--dark li { border-bottom-color: var(--line-dk); }
.spec-list--dark .k { color: rgba(246,242,234,.55); }
.spec-list--dark .v { color: var(--bone); }

/* ----- Pricing rows --------------------------------------------------------- */
.rate-list { border-top: 1px solid var(--line); }
.rate-row { display: grid; grid-template-columns: 1fr auto; align-items: baseline; gap: 1.5rem; padding: clamp(1.8rem, 3vw, 2.4rem) 0; border-bottom: 1px solid var(--line); }
.rate-row .cap { margin-bottom: .5rem; }
.rate-row .desc { margin-top: .6rem; max-width: 56ch; color: var(--ink-soft); font-size: .94rem; }
.rate-row .price { font: 340 2.1rem var(--serif); color: var(--ink); white-space: nowrap; }
.rate-row .price small { font-family: var(--sans); font-size: .85rem; font-weight: 500; color: var(--mist); letter-spacing: 0; }
.rate-includes { margin-top: 1rem; display: flex; flex-wrap: wrap; gap: .5rem 1.3rem; }
.rate-includes span { font-size: .82rem; color: var(--mist); }
.rate-includes span::before { content: '— '; color: var(--brass); }

/* ----- FAQ ------------------------------------------------------------------ */
.faq-list { border-top: 1px solid var(--line); }
.faq-item { border-bottom: 1px solid var(--line); }
.faq-item summary {
  list-style: none; cursor: pointer; display: flex; align-items: center; justify-content: space-between; gap: 1.5rem;
  padding: 1.6rem 0; font: 400 1.12rem var(--serif); color: var(--ink);
}
.faq-item summary::-webkit-details-marker { display: none; }
.faq-item .toggle { flex-shrink: 0; width: 22px; height: 22px; position: relative; }
.faq-item .toggle::before, .faq-item .toggle::after {
  content: ''; position: absolute; top: 50%; left: 50%; background: var(--brass); transition: transform .2s ease;
}
.faq-item .toggle::before { width: 14px; height: 1px; transform: translate(-50%,-50%); }
.faq-item .toggle::after { width: 1px; height: 14px; transform: translate(-50%,-50%); }
.faq-item[open] .toggle::after { transform: translate(-50%,-50%) rotate(90deg); opacity: 0; }
.faq-item .answer { padding-bottom: 1.7rem; max-width: 65ch; color: var(--ink-soft); }

/* ----- Care lists ------------------------------------------------------------ */
.tick-list li { padding: .8rem 0 .8rem 1.6rem; border-bottom: 1px solid var(--line-soft); position: relative; font-size: .96rem; }
.tick-list li::before { content: ''; position: absolute; left: 0; top: 1.15rem; width: 9px; height: 1px; background: var(--brass); }
.tick-list--avoid li::before { background: var(--mist); }

/* ----- Footer ------------------------------------------------------------------ */
.site-footer { background: var(--ink); color: rgba(246,242,234,.8); padding-block: clamp(3.5rem, 7vw, 5rem) 2rem; }
.footer-top { display: grid; grid-template-columns: 1.4fr 1fr 1fr 1.1fr; gap: 2.5rem; padding-bottom: 3rem; border-bottom: 1px solid var(--line-dk); }
.footer-brand .brand-mark, .footer-brand .brand-name { color: var(--bone); }
.footer-brand p { margin-top: 1rem; font-size: .9rem; color: rgba(246,242,234,.55); max-width: 32ch; line-height: 1.6; }
.footer-col h4 { font: 600 .72rem var(--sans); letter-spacing: .12em; text-transform: uppercase; color: var(--brass-soft); margin-bottom: 1.1rem; }
.footer-col ul { display: flex; flex-direction: column; gap: .7rem; }
.footer-col a, .footer-col span { font-size: .88rem; color: rgba(246,242,234,.72); }
.footer-col a:hover { color: var(--brass-soft); }
.footer-bottom { display: flex; justify-content: space-between; flex-wrap: wrap; gap: .8rem; padding-top: 1.6rem; font-size: .78rem; color: rgba(246,242,234,.42); letter-spacing: .02em; }

/* ----- Reveal (progressive enhancement — visible by default; JS adds the
   hidden-then-revealed treatment so content never depends on JS) ---------- */
.js .reveal { opacity: 0; transform: translateY(16px); transition: opacity .7s ease, transform .7s ease; }
.js .reveal.in { opacity: 1; transform: none; }

/* ----- Responsive --------------------------------------------------------- */
@media (max-width: 980px) {
  .hero-inner { grid-template-columns: 1fr; }
  .hero-media { order: -1; max-width: 420px; margin-inline: auto; }
  .split, .split--wide-left { grid-template-columns: 1fr; }
  .grid-4 { grid-template-columns: repeat(2, 1fr); }
  .grid-3 { grid-template-columns: repeat(2, 1fr); }
  .footer-top { grid-template-columns: 1fr 1fr; row-gap: 2.5rem; }
  .row-item { grid-template-columns: 1fr; gap: .6rem; }
}

@media (max-width: 760px) {
  .nav-links-desktop, .nav-cta-desktop { display: none; }
  .nav-mobile { display: block; }
  .stats-strip { grid-template-columns: repeat(2, 1fr); }
  .stat:nth-child(3) { border-left: none; }
  .stat { border-bottom: 1px solid var(--line); }
  .stat:nth-child(3), .stat:nth-child(4) { border-bottom: none; }
  .grid-4, .grid-3, .grid-2 { grid-template-columns: 1fr; }
  .footer-top { grid-template-columns: 1fr; }
  .rate-row { grid-template-columns: 1fr; }
  .rate-row .price { font-size: 1.8rem; }
}

@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation: none !important; transition: none !important; scroll-behavior: auto !important; }
  .js .reveal { opacity: 1; transform: none; }
}

:focus-visible { outline: 2px solid var(--brass); outline-offset: 3px; }
GWTFILEEOF

cat > main.js << 'GWTFILEEOF'
/* GWT Hardwood Floors — minimal interactions (no dependencies) */
(function () {
  // Mobile nav is a native <details> element — works with zero JS.
  // This just closes it automatically after a link is tapped.
  var nav = document.querySelector('.nav-mobile');
  if (nav) {
    nav.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') nav.removeAttribute('open');
    });
  }

  // Scroll-reveal (progressive enhancement — content is visible by default;
  // see .js .reveal in style.css). Respects reduced-motion via CSS fallback.
  var reveals = document.querySelectorAll('.reveal');
  if ('IntersectionObserver' in window && reveals.length) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('in');
          io.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12 });
    reveals.forEach(function (el) { io.observe(el); });
  } else {
    reveals.forEach(function (el) { el.classList.add('in'); });
  }
})();
GWTFILEEOF

cat > index.html << 'GWTFILEEOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>GWT Hardwood Floors — Refinishing & Installation in Metro Detroit</title>
  <meta name="description" content="Second-generation, family-built hardwood flooring in Pontiac and Metro Detroit. Refinishing, installation, staircases, and hand-mixed custom stain work.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,300;9..144,340;9..144,400;9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <script>document.documentElement.classList.add('js');</script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <nav class="nav" aria-label="Primary">
        <a class="brand" href="index.html">
          <span class="brand-mark">G·W·T</span>
          <span><span class="brand-name">Hardwood Floors</span><span class="brand-sub">Pontiac · Metro Detroit</span></span>
        </a>
        <ul class="nav-links-desktop">
          <li><a href="index.html" class="active">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="stain-gallery.html">Stain Gallery</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="faq.html">FAQ</a></li>
          <li><a href="floor-care.html">Floor Care</a></li>
          <li><a href="pricing.html">Pricing</a></li>
        </ul>
        <div class="nav-cta-desktop"><a class="btn" href="pricing.html#quote">Request a quote</a></div>
        <details class="nav-mobile">
          <summary><span class="burger"><span></span><span></span><span></span></span>Menu</summary>
          <div class="nav-mobile-panel">
            <a href="index.html">Home</a>
            <a href="services.html">Services</a>
            <a href="stain-gallery.html">Stain Gallery</a>
            <a href="about.html">About</a>
            <a href="faq.html">FAQ</a>
            <a href="floor-care.html">Floor Care</a>
            <a href="pricing.html">Pricing</a>
            <a class="btn nav-cta-mobile" href="pricing.html#quote">Request a quote</a>
          </div>
        </details>
      </nav>
    </div>
  </header>

  <main>
    <!-- HERO -->
    <section class="hero">
      <div class="container hero-inner">
        <div class="hero-copy">
          <span class="eyebrow">Second generation · Built in Michigan</span>
          <h1>Floors worth standing on for the next thirty years.</h1>
          <p class="lead">A family-built flooring company delivering high-quality refinishing, installation, and custom stain work across Pontiac and Metro Detroit. We sand to bare wood, mix every color by hand, and finish floors that wear as well as they look.</p>
          <div class="btn-row">
            <a class="btn" href="pricing.html#quote">Request a quote <span class="arrow">→</span></a>
            <a class="btn btn--ghost" href="services.html">Explore our services</a>
          </div>
        </div>
        <div class="hero-media">
          <div class="specimen">
            <div class="specimen-media specimen-media--tall" style="background-image:repeating-linear-gradient(100deg, rgba(255,255,255,.05) 0px, rgba(255,255,255,.05) 1px, transparent 1px, transparent 3px), linear-gradient(155deg,#c9b393,#b39c7c 45%,#9c855f)">
              <span class="specimen-tag">Signature blend</span>
            </div>
            <div class="specimen-body">
              <div class="specimen-name">WheatStone Oak</div>
              <div class="specimen-meta">Duraseal Nutmeg + Country White, mixed 1:1 · Pallmann Ultra Matte topcoat</div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- STATS -->
    <div class="container">
      <div class="stats-strip">
        <div class="stat"><div class="num">60+</div><div class="label">Years combined experience</div></div>
        <div class="stat"><div class="num">2</div><div class="label">Generations of craftsmen</div></div>
        <div class="stat"><div class="num">2000s</div><div class="label">Family-owned since</div></div>
        <div class="stat"><div class="num">All&nbsp;MI</div><div class="label">Michigan service area</div></div>
      </div>
    </div>

    <!-- WHAT WE DO -->
    <section class="section">
      <div class="container">
        <div class="section-head reveal">
          <span class="eyebrow">What we do</span>
          <h2>The work our family is known for</h2>
          <p class="lead" style="margin-top:1rem">From a single worn staircase to a whole-home refinish, every job gets the same care — sharp equipment, clean prep, and a finish applied right.</p>
        </div>
        <div class="row-list reveal">
          <div class="row-item">
            <span class="cap">Refinish</span>
            <div>
              <h3>Refinishing</h3>
              <p class="desc">Sanding tired floors back to bare wood and bringing them back to life with the right stain and finish system.</p>
              <div class="row-foot"><a class="link-arrow" href="services.html#refinishing">Learn more <span class="arrow">→</span></a></div>
            </div>
          </div>
          <div class="row-item">
            <span class="cap">Install</span>
            <div>
              <h3>Installation</h3>
              <p class="desc">New solid and engineered hardwood laid level, tight, and true — built to settle in and last for decades.</p>
              <div class="row-foot"><a class="link-arrow" href="services.html#installation">Learn more <span class="arrow">→</span></a></div>
            </div>
          </div>
          <div class="row-item">
            <span class="cap">Stairs</span>
            <div>
              <h3>Staircases</h3>
              <p class="desc">Treads, risers, and rails refinished or rebuilt so your stairs match the floors they connect.</p>
              <div class="row-foot"><a class="link-arrow" href="services.html#staircases">Learn more <span class="arrow">→</span></a></div>
            </div>
          </div>
          <div class="row-item">
            <span class="cap">Color</span>
            <div>
              <h3>Custom Stain Mixing</h3>
              <p class="desc">Sample boards and hand-blended Duraseal color until the floor sits right with your cabinets, trim, and light.</p>
              <div class="row-foot"><a class="link-arrow" href="services.html#stain">Learn more <span class="arrow">→</span></a></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- WHY GWT -->
    <section class="section section--dark">
      <div class="container">
        <div class="split reveal">
          <div>
            <span class="eyebrow eyebrow--dark">Why families call us back</span>
            <h2>A family business, not a franchise.</h2>
            <p class="lead" style="color:rgba(246,242,234,.74); margin-top:1.1rem">Gary and Mary Turner started this company in the early 2000s on craftsmanship, honesty, and respect. Their sons Jake and Greg grew up learning the trade at their father's side and carry it forward today. When we say <em style="color:var(--bone)">whatever it takes</em>, that's our actual schedule — we stay until the floor is right.</p>
            <p class="cap" style="margin-top:1.6rem;color:rgba(246,242,234,.5)">Stains by Duraseal · Finishes by Glitsa, Pallmann, Bona &amp; Loba</p>
          </div>
          <div class="grid" style="gap:1.2rem">
            <div class="plate plate--dark">
              <span class="cap" style="color:var(--brass-soft)">Reliable</span>
              <h3 style="color:var(--bone)">We show up and finish</h3>
              <p>Clear timelines, clean job sites, and honest updates from start to last coat.</p>
            </div>
            <div class="plate plate--dark">
              <span class="cap" style="color:var(--brass-soft)">Skilled</span>
              <h3 style="color:var(--bone)">Color matched by hand</h3>
              <p>Custom Duraseal mixing and sample boards so the finished floor is the one you pictured.</p>
            </div>
            <div class="plate plate--dark">
              <span class="cap" style="color:var(--brass-soft)">Built to last</span>
              <h3 style="color:var(--bone)">Floors that wear well</h3>
              <p>Proper prep and the right finish system mean floors that hold up to real life.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CONTACT -->
    <section class="section">
      <div class="container">
        <div class="split split--wide-left reveal">
          <div>
            <span class="eyebrow">Get in touch</span>
            <h2>Let's talk about your floors</h2>
            <p class="lead" style="margin-top:1rem">Call or email any of us for a walkthrough and a detailed quote. We serve Pontiac, Metro Detroit, and homeowners across Michigan.</p>
          </div>
          <div class="grid grid-3">
            <div class="plate">
              <span class="cap">Owner</span>
              <h3>Gary</h3>
              <p><a class="link-arrow" href="tel:+12483796826" style="display:block;margin-top:.5rem">248-379-6826</a></p>
              <p style="margin-top:.4rem"><a href="mailto:gwthardwoodfloors@gmail.com" style="font-size:.85rem;color:var(--mist)">gwthardwoodfloors@gmail.com</a></p>
            </div>
            <div class="plate">
              <span class="cap">Craftsman</span>
              <h3>Jake</h3>
              <p><a class="link-arrow" href="tel:+12486323244" style="display:block;margin-top:.5rem">248-632-3244</a></p>
            </div>
            <div class="plate">
              <span class="cap">Craftsman</span>
              <h3>Greg</h3>
              <p><a class="link-arrow" href="tel:+19479574996" style="display:block;margin-top:.5rem">947-957-4996</a></p>
              <p style="margin-top:.4rem"><a href="mailto:g19479574996t@gmail.com" style="font-size:.85rem;color:var(--mist)">g19479574996t@gmail.com</a></p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="footer-top">
        <div class="footer-brand">
          <a class="brand" href="index.html"><span class="brand-mark">G·W·T</span><span><span class="brand-name">Hardwood Floors</span></span></a>
          <p>Second-generation hardwood flooring craftsmanship — refinishing, installation, and custom stain work across Pontiac and Metro Detroit.</p>
        </div>
        <div class="footer-col"><h4>Explore</h4><ul><li><a href="services.html">Services</a></li><li><a href="stain-gallery.html">Stain Gallery</a></li><li><a href="about.html">About Us</a></li></ul></div>
        <div class="footer-col"><h4>Helpful</h4><ul><li><a href="faq.html">FAQ</a></li><li><a href="floor-care.html">Floor Care Guide</a></li><li><a href="pricing.html">Pricing Guide</a></li><li><a href="pricing.html#quote">Request a Quote</a></li></ul></div>
        <div class="footer-col"><h4>Contact</h4><ul>
          <li><a href="tel:+12483796826">Gary · 248-379-6826</a></li>
          <li><a href="tel:+12486323244">Jake · 248-632-3244</a></li>
          <li><a href="tel:+19479574996">Greg · 947-957-4996</a></li>
          <li><a href="mailto:gwthardwoodfloors@gmail.com">gwthardwoodfloors@gmail.com</a></li>
          <li><span>Serving all of Michigan</span></li>
        </ul></div>
      </div>
      <div class="footer-bottom">
        <span>© 2026 GWT Hardwood Floors · Family-owned, Michigan-built</span>
        <span>Stains by Duraseal · Finishes by Glitsa, Pallmann, Bona, Loba</span>
      </div>
    </div>
  </footer>
  <script src="main.js"></script>
</body>
</html>
GWTFILEEOF

cat > services.html << 'GWTFILEEOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Services — Hardwood Floor Refinishing & Installation | GWT Hardwood Floors</title>
  <meta name="description" content="Refinishing, installation, staircase work, custom Duraseal stain mixing, bleaching, and water-, oil-, and alcohol-based finishing, done in-house by GWT Hardwood Floors.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,300;9..144,340;9..144,400;9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <script>document.documentElement.classList.add('js');</script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <nav class="nav" aria-label="Primary">
        <a class="brand" href="index.html">
          <span class="brand-mark">G·W·T</span>
          <span><span class="brand-name">Hardwood Floors</span><span class="brand-sub">Pontiac · Metro Detroit</span></span>
        </a>
        <ul class="nav-links-desktop">
          <li><a href="index.html">Home</a></li>
          <li><a href="services.html" class="active">Services</a></li>
          <li><a href="stain-gallery.html">Stain Gallery</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="faq.html">FAQ</a></li>
          <li><a href="floor-care.html">Floor Care</a></li>
          <li><a href="pricing.html">Pricing</a></li>
        </ul>
        <div class="nav-cta-desktop"><a class="btn" href="pricing.html#quote">Request a quote</a></div>
        <details class="nav-mobile">
          <summary><span class="burger"><span></span><span></span><span></span></span>Menu</summary>
          <div class="nav-mobile-panel">
            <a href="index.html">Home</a>
            <a href="services.html">Services</a>
            <a href="stain-gallery.html">Stain Gallery</a>
            <a href="about.html">About</a>
            <a href="faq.html">FAQ</a>
            <a href="floor-care.html">Floor Care</a>
            <a href="pricing.html">Pricing</a>
            <a class="btn nav-cta-mobile" href="pricing.html#quote">Request a quote</a>
          </div>
        </details>
      </nav>
    </div>
  </header>

  <main>
    <section class="page-hero">
      <div class="container">
        <span class="eyebrow eyebrow--dark">Services</span>
        <h1>Every service, from bare wood to final coat.</h1>
        <p class="lead">We handle the whole job in-house, start to finish. Here's what each service involves, when you need it, and why our family does it the way we do.</p>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="row-list reveal">

          <div class="row-item" id="refinishing">
            <span class="cap">Sand · Stain · Finish</span>
            <div>
              <h3>Hardwood Floor Refinishing</h3>
              <p class="desc">We sand existing hardwood down to fresh, bare wood, repair what needs it, then apply new stain and a protective finish — essentially resetting your floor to new.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> Worn traffic paths, dull or flaking finish, surface scratches, pet damage, water marks, or simply a color you've outgrown. Most solid hardwood can be refinished several times over its life.</p>
              <div class="why"><strong>Why GWT.</strong> Clean sanding is the whole game. We grade through the right abrasive sequence so the floor takes stain evenly — no swirl marks, no blotch — which is what separates a floor that looks redone from one that just looks recoated.</div>
            </div>
          </div>

          <div class="row-item" id="installation">
            <span class="cap">Solid &amp; Engineered</span>
            <div>
              <h3>Hardwood Floor Installation</h3>
              <p class="desc">Laying new hardwood — solid or engineered — including subfloor prep, acclimation, layout, fastening, and finishing.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> New construction, additions, replacing carpet or tile, or pulling up flooring that's too far gone to refinish.</p>
              <div class="why"><strong>Why GWT.</strong> We let the wood acclimate, set proper expansion gaps, and plan board layout so the room reads right from the doorway. A floor installed with patience stays flat and tight for decades.</div>
            </div>
          </div>

          <div class="row-item" id="staircases">
            <span class="cap">Treads · Risers · Rails</span>
            <div>
              <h3>Staircase Refinishing</h3>
              <p class="desc">Refinishing or rebuilding stair treads, risers, and handrails so the staircase matches the floors it connects to.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> Stairs take more wear than any other surface in the house. When the finish on the nosing or the color no longer matches a freshly refinished floor, the stairs need attention too.</p>
              <div class="why"><strong>Why GWT.</strong> Stairs are detailed, hand-worked surfaces with far more edges than open floor — no room for shortcuts. We match the floor's stain and sheen exactly so the transition looks like it was always one piece.</div>
            </div>
          </div>

          <div class="row-item" id="stain">
            <span class="cap">Duraseal Custom Mixing</span>
            <div>
              <h3>Custom Stain Mixing</h3>
              <p class="desc">Blending two or more Duraseal stains to create a color that's yours — then proving it on sample boards milled from your actual floor before we commit.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> When an off-the-shelf color doesn't sit right into your cabinets, trim, or lighting. Most high-end results come from a custom blend, not a single can.</p>
              <div class="why"><strong>Why GWT.</strong> This is our signature. Our WheatStone Oak finish was a 1:1 Nutmeg and Country White blend developed over several sample boards to sit right with two different cabinet tones. We don't guess on color — we prove it.</div>
            </div>
          </div>

          <div class="row-item" id="bleaching">
            <span class="cap">Tone Correction</span>
            <div>
              <h3>Bleaching</h3>
              <p class="desc">Chemically lightening wood to remove deep color, even out a naturally uneven background, or reach pale, modern tones that stain alone can't deliver.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> Going light or white-washed on a naturally warm species like oak, neutralizing yellow or pink undertones, or lifting old water and pet stains before refinishing.</p>
              <div class="why"><strong>Why GWT.</strong> Bleaching is unforgiving — uneven application shows forever. We control timing, neutralization, and grain raise so the wood ends up clean and ready to take a light stain evenly.</div>
            </div>
          </div>

          <div class="row-item" id="water-based">
            <span class="cap">Pallmann · Bona · Loba</span>
            <div>
              <h3>Water-Based Finishing</h3>
              <p class="desc">A clear, durable topcoat that dries fast and stays color-true, keeping light woods and cool tones from ambering over time.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> When you want the floor to keep its exact color, need lower odor, or are finishing in an occupied home.</p>
              <div class="why"><strong>Why GWT.</strong> We finish with professional systems like Pallmann, Bona, and Loba and apply in controlled coats — the fast cure window rewards a steady, experienced hand.</div>
            </div>
          </div>

          <div class="row-item" id="alcohol-based">
            <span class="cap">Glitsa-Style Systems</span>
            <div>
              <h3>Alcohol-Based Finishing</h3>
              <p class="desc">A traditional Swedish-style finish system known for a hard, glass-clear film with exceptional clarity and depth.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> When you want the classic, time-tested look and a tough surface — often specified for its clarity over fine grain.</p>
              <div class="why"><strong>Why GWT.</strong> We've worked with Glitsa-style systems for years. These finishes demand ventilation, timing, and respect — exactly the kind of detailed work our family was built on.</div>
            </div>
          </div>

          <div class="row-item" id="oil-based">
            <span class="cap">Traditional Topcoat</span>
            <div>
              <h3>Oil-Based Finishing</h3>
              <p class="desc">A classic polyurethane topcoat that builds warmth and a slight amber glow as it cures, deepening the wood's character over time.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> When you want the traditional warm tone, especially on red oak and darker stains, with a forgiving, well-proven finish.</p>
              <div class="why"><strong>Why GWT.</strong> Oil-based finishes flow and level beautifully when applied right. We control coat thickness and dry time so you get the warmth without runs, bubbles, or an uneven sheen.</div>
            </div>
          </div>

          <div class="row-item" id="repairs">
            <span class="cap">Boards · Trim · Transitions</span>
            <div>
              <h3>Repairs &amp; Patching</h3>
              <p class="desc">Replacing damaged boards, weaving in new wood, and blending repairs into the surrounding floor so they disappear.</p>
              <p class="desc" style="margin-top:.5rem"><strong style="color:var(--ink)">When it's needed.</strong> Water damage, deep gouges, pet stains, failed previous repairs, or transitions left behind by removed walls and old doorways.</p>
              <div class="why"><strong>Why GWT.</strong> A good patch is invisible. We match species, grain direction, and board size, then feather the stain and finish so your eye never catches the seam.</div>
            </div>
          </div>

        </div>
      </div>
    </section>

    <section class="section section--dark">
      <div class="container center reveal">
        <span class="eyebrow eyebrow--dark">Not sure what you need?</span>
        <h2>Tell us about your floors</h2>
        <p class="lead" style="color:rgba(246,242,234,.74); margin-inline:auto; margin-top:1.1rem">We'll walk the space, talk through options honestly, and put together a detailed quote — no pressure, no upsell.</p>
        <div style="margin-top:1.9rem"><a class="btn" href="pricing.html#quote">Request a quote <span class="arrow">→</span></a></div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="footer-top">
        <div class="footer-brand">
          <a class="brand" href="index.html"><span class="brand-mark">G·W·T</span><span><span class="brand-name">Hardwood Floors</span></span></a>
          <p>Second-generation hardwood flooring craftsmanship — refinishing, installation, and custom stain work across Pontiac and Metro Detroit.</p>
        </div>
        <div class="footer-col"><h4>Explore</h4><ul><li><a href="services.html">Services</a></li><li><a href="stain-gallery.html">Stain Gallery</a></li><li><a href="about.html">About Us</a></li></ul></div>
        <div class="footer-col"><h4>Helpful</h4><ul><li><a href="faq.html">FAQ</a></li><li><a href="floor-care.html">Floor Care Guide</a></li><li><a href="pricing.html">Pricing Guide</a></li><li><a href="pricing.html#quote">Request a Quote</a></li></ul></div>
        <div class="footer-col"><h4>Contact</h4><ul>
          <li><a href="tel:+12483796826">Gary · 248-379-6826</a></li>
          <li><a href="tel:+12486323244">Jake · 248-632-3244</a></li>
          <li><a href="tel:+19479574996">Greg · 947-957-4996</a></li>
          <li><a href="mailto:gwthardwoodfloors@gmail.com">gwthardwoodfloors@gmail.com</a></li>
          <li><span>Serving all of Michigan</span></li>
        </ul></div>
      </div>
      <div class="footer-bottom">
        <span>© 2026 GWT Hardwood Floors · Family-owned, Michigan-built</span>
        <span>Stains by Duraseal · Finishes by Glitsa, Pallmann, Bona, Loba</span>
      </div>
    </div>
  </footer>
  <script src="main.js"></script>
</body>
</html>
GWTFILEEOF

cat > stain-gallery.html << 'GWTFILEEOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Duraseal Stain Catalog — Hardwood Floor Stain Colors | GWT Hardwood Floors</title>
  <meta name="description" content="The full Duraseal stain catalog we work from — 36 colors from Neutral to True Black — plus our signature WheatStone Oak custom blend.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,300;9..144,340;9..144,400;9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <script>document.documentElement.classList.add('js');</script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <nav class="nav" aria-label="Primary">
        <a class="brand" href="index.html">
          <span class="brand-mark">G·W·T</span>
          <span><span class="brand-name">Hardwood Floors</span><span class="brand-sub">Pontiac · Metro Detroit</span></span>
        </a>
        <ul class="nav-links-desktop">
          <li><a href="index.html">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="stain-gallery.html" class="active">Stain Gallery</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="faq.html">FAQ</a></li>
          <li><a href="floor-care.html">Floor Care</a></li>
          <li><a href="pricing.html">Pricing</a></li>
        </ul>
        <div class="nav-cta-desktop"><a class="btn" href="pricing.html#quote">Request a quote</a></div>
        <details class="nav-mobile">
          <summary><span class="burger"><span></span><span></span><span></span></span>Menu</summary>
          <div class="nav-mobile-panel">
            <a href="index.html">Home</a>
            <a href="services.html">Services</a>
            <a href="stain-gallery.html">Stain Gallery</a>
            <a href="about.html">About</a>
            <a href="faq.html">FAQ</a>
            <a href="floor-care.html">Floor Care</a>
            <a href="pricing.html">Pricing</a>
            <a class="btn nav-cta-mobile" href="pricing.html#quote">Request a quote</a>
          </div>
        </details>
      </nav>
    </div>
  </header>

  <main>
    <section class="page-hero">
      <div class="container">
        <span class="eyebrow eyebrow--dark">Stain Catalog</span>
        <h1>The Duraseal colors we work from.</h1>
        <p class="lead">We finish almost every floor with Duraseal — a deep, reliable line we know inside and out. The full catalog is below to get your eye going. The same stain looks different on every species, grain, and room's light, so we always prove your final color on a sample board milled from your own floor.</p>
      </div>
    </section>

    <!-- WHEATSTONE HIGHLIGHT -->
    <section class="section">
      <div class="container">
        <div class="split reveal">
          <div>
            <span class="eyebrow">Why custom?</span>
            <h2>The same stain, two different floors</h2>
            <p class="lead" style="margin-top:1.1rem">Wood is a living material. A color that reads warm on white oak can turn pink on red oak; a gray that looks perfect in showroom light can go cold in a north-facing room. That's why we treat a color chart as a starting point, never a final answer.</p>
            <p class="lead" style="margin-top:1rem">We blend from the full Duraseal line and prove the result on sample boards built from your actual floor — next to your cabinets, your trim, and your daylight. Some of our best colors, like our signature WheatStone Oak, are two Duraseal stains mixed by hand.</p>
          </div>
          <div class="specimen" style="align-self:start">
            <div class="specimen-media specimen-media--tall" style="background-image:repeating-linear-gradient(100deg, rgba(255,255,255,.05) 0px, rgba(255,255,255,.05) 1px, transparent 1px, transparent 3px), linear-gradient(150deg,#c8b294,#b39c7e 55%,#a8927a)">
              <span class="specimen-tag">Signature blend</span>
            </div>
            <div class="specimen-body">
              <div class="specimen-name">WheatStone Oak</div>
              <div class="specimen-meta">Duraseal Nutmeg + Country White, mixed 1:1 · Pallmann Ultra Matte topcoat</div>
              <p style="font-size:.88rem;color:var(--mist);margin-top:.8rem;line-height:1.55">A desaturated light brown with gray, green-neutralizing, and soft pink-oak undertones — equally at home in warm or cool interiors.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CATALOG -->
    <section class="section section--parchment">
      <div class="container">
        <div class="section-head reveal">
          <span class="eyebrow">No. 01 – 36</span>
          <h2>The full Duraseal catalog</h2>
          <p class="lead" style="margin-top:1rem">Every stain we work from, numbered as a reference catalog. Swatches below are on-screen approximations to help you narrow things down — for each color photographed on real White Oak and Red Oak, see Duraseal's official gallery. Your final color is always proven on a sample board first.</p>
          <div style="margin-top:1.4rem"><a class="btn btn--ghost" href="https://www.duraseal.com/stain-gallery/" target="_blank" rel="noopener">View Duraseal's official gallery <span class="arrow">→</span></a></div>
        </div>

        <h3 style="margin-bottom:1.4rem">Whites &amp; Neutrals</h3>
        <div class="grid grid-3 reveal" style="margin-bottom:3.5rem">
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#e3d4b8,#d3c09f)"><span class="specimen-tag">No. 01</span></div><div class="specimen-body"><div class="specimen-name">Neutral</div><div class="specimen-meta">Clear, near-natural</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#d9c8ad,#c7b48f)"><span class="specimen-tag">No. 02</span></div><div class="specimen-body"><div class="specimen-name">Country White</div><div class="specimen-meta">Soft whitewash</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#cbb491,#b39a73)"><span class="specimen-tag">No. 03</span></div><div class="specimen-body"><div class="specimen-name">Rustic Beige</div><div class="specimen-meta">Light warm beige</div></div></div>
        </div>

        <h3 style="margin-bottom:1.4rem">Grays</h3>
        <div class="grid grid-3 reveal" style="margin-bottom:3.5rem">
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#b6ab9d,#9d9285)"><span class="specimen-tag">No. 04</span></div><div class="specimen-body"><div class="specimen-name">Silvered Gray</div><div class="specimen-meta">Pale silvery gray</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#aaa298,#918980)"><span class="specimen-tag">No. 05</span></div><div class="specimen-body"><div class="specimen-name">Classic Gray</div><div class="specimen-meta">Neutral light gray</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#a2978a,#887d70)"><span class="specimen-tag">No. 06</span></div><div class="specimen-body"><div class="specimen-name">Warm Gray</div><div class="specimen-meta">Soft greige</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#b1a58f,#978b75)"><span class="specimen-tag">No. 07</span></div><div class="specimen-body"><div class="specimen-name">Weathered Oak</div><div class="specimen-meta">Driftwood gray-tan</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#8d8070,#6f6453)"><span class="specimen-tag">No. 08</span></div><div class="specimen-body"><div class="specimen-name">Aged Barrel</div><div class="specimen-meta">Weathered gray-brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#6e6962,#4f4b46)"><span class="specimen-tag">No. 09</span></div><div class="specimen-body"><div class="specimen-name">Dark Gray</div><div class="specimen-meta">Deep charcoal gray</div></div></div>
        </div>

        <h3 style="margin-bottom:1.4rem">Golden &amp; Light Browns</h3>
        <div class="grid grid-3 reveal" style="margin-bottom:3.5rem">
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#c89a5a,#b1843e)"><span class="specimen-tag">No. 10</span></div><div class="specimen-body"><div class="specimen-name">Golden Oak</div><div class="specimen-meta">Light golden</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#bd8b4f,#a3723a)"><span class="specimen-tag">No. 11</span></div><div class="specimen-body"><div class="specimen-name">Golden Pecan</div><div class="specimen-meta">Warm golden-brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#b78a5c,#9e6e42)"><span class="specimen-tag">No. 12</span></div><div class="specimen-body"><div class="specimen-name">Fruitwood</div><div class="specimen-meta">Light reddish tan</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#9c6f44,#835830)"><span class="specimen-tag">No. 13</span></div><div class="specimen-body"><div class="specimen-name">Early American</div><div class="specimen-meta">Classic light brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#b17a3f,#97612a)"><span class="specimen-tag">No. 14</span></div><div class="specimen-body"><div class="specimen-name">Colonial Maple</div><div class="specimen-meta">Golden amber</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#97653a,#7c4f28)"><span class="specimen-tag">No. 15</span></div><div class="specimen-body"><div class="specimen-name">Golden Brown</div><div class="specimen-meta">Warm golden brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#8a5a33,#6e4426)"><span class="specimen-tag">No. 16</span></div><div class="specimen-body"><div class="specimen-name">Nutmeg</div><div class="specimen-meta">Warm mid-brown</div></div></div>
        </div>

        <h3 style="margin-bottom:1.4rem">Warm Browns</h3>
        <div class="grid grid-3 reveal" style="margin-bottom:3.5rem">
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#6f4f35,#553a25)"><span class="specimen-tag">No. 17</span></div><div class="specimen-body"><div class="specimen-name">Special Walnut</div><div class="specimen-meta">Even medium brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#7a5536,#5e4027)"><span class="specimen-tag">No. 18</span></div><div class="specimen-body"><div class="specimen-name">Provincial</div><div class="specimen-meta">Balanced brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#7c5232,#613c22)"><span class="specimen-tag">No. 19</span></div><div class="specimen-body"><div class="specimen-name">Chestnut</div><div class="specimen-meta">Reddish mid-brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#6a4329,#4e301c)"><span class="specimen-tag">No. 20</span></div><div class="specimen-body"><div class="specimen-name">English Chestnut</div><div class="specimen-meta">Deep warm brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#74502f,#593b21)"><span class="specimen-tag">No. 21</span></div><div class="specimen-body"><div class="specimen-name">Medium Brown</div><div class="specimen-meta">True medium brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#6f4a2c,#55371f)"><span class="specimen-tag">No. 22</span></div><div class="specimen-body"><div class="specimen-name">Spice Brown</div><div class="specimen-meta">Warm spiced brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#5c3c25,#422a18)"><span class="specimen-tag">No. 23</span></div><div class="specimen-body"><div class="specimen-name">Heritage Brown</div><div class="specimen-meta">Deep heritage tone</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#543824,#3b2718)"><span class="specimen-tag">No. 24</span></div><div class="specimen-body"><div class="specimen-name">Antique Brown</div><div class="specimen-meta">Dark warm brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#8a4f31,#6d3a22)"><span class="specimen-tag">No. 25</span></div><div class="specimen-body"><div class="specimen-name">Gunstock</div><div class="specimen-meta">Reddish brown</div></div></div>
        </div>

        <h3 style="margin-bottom:1.4rem">Reds &amp; Mahogany</h3>
        <div class="grid grid-3 reveal" style="margin-bottom:3.5rem">
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#8a4630,#6c3120)"><span class="specimen-tag">No. 26</span></div><div class="specimen-body"><div class="specimen-name">Sedona Red</div><div class="specimen-meta">Earthy red-brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#8f4733,#723221)"><span class="specimen-tag">No. 27</span></div><div class="specimen-body"><div class="specimen-name">Cherry</div><div class="specimen-meta">Warm reddish</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#6e3322,#511e15)"><span class="specimen-tag">No. 28</span></div><div class="specimen-body"><div class="specimen-name">Red Mahogany</div><div class="specimen-meta">Deep red-brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#5e2a1f,#431912)"><span class="specimen-tag">No. 29</span></div><div class="specimen-body"><div class="specimen-name">Royal Mahogany</div><div class="specimen-meta">Rich mahogany</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#4e2820,#351812)"><span class="specimen-tag">No. 30</span></div><div class="specimen-body"><div class="specimen-name">Rosewood</div><div class="specimen-meta">Dark red-brown</div></div></div>
        </div>

        <h3 style="margin-bottom:1.4rem">Rich Darks</h3>
        <div class="grid grid-3 reveal">
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#4a3221,#2e1f14)"><span class="specimen-tag">No. 31</span></div><div class="specimen-body"><div class="specimen-name">Coffee Brown</div><div class="specimen-meta">Deep coffee brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#4a3526,#2e2017)"><span class="specimen-tag">No. 32</span></div><div class="specimen-body"><div class="specimen-name">Dark Walnut</div><div class="specimen-meta">Classic dark walnut</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#3a2a1e,#211610)"><span class="specimen-tag">No. 33</span></div><div class="specimen-body"><div class="specimen-name">Jacobean</div><div class="specimen-meta">Very dark brown</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#332218,#1c120d)"><span class="specimen-tag">No. 34</span></div><div class="specimen-body"><div class="specimen-name">Espresso</div><div class="specimen-meta">Near-black warmth</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#241c16,#13100b)"><span class="specimen-tag">No. 35</span></div><div class="specimen-body"><div class="specimen-name">Ebony</div><div class="specimen-meta">Deep near-black</div></div></div>
          <div class="specimen"><div class="specimen-media" style="background-image:repeating-linear-gradient(100deg,rgba(255,255,255,.05) 0px,rgba(255,255,255,.05) 1px,transparent 1px,transparent 3px),linear-gradient(135deg,#1a1714,#0c0a09)"><span class="specimen-tag">No. 36</span></div><div class="specimen-body"><div class="specimen-name">True Black</div><div class="specimen-meta">Solid black</div></div></div>
        </div>

      </div>
    </section>

    <section class="section section--tight">
      <div class="container center reveal" style="max-width:680px">
        <p class="lead" style="color:var(--mist); margin-inline:auto">Screens and printers show color differently, so treat the catalog above as a guide. Duraseal's official gallery photographs every color on real White Oak and Red Oak — and we'll mix and prove your exact color on a board from your own floor before any finish goes down.</p>
      </div>
    </section>

    <section class="section section--dark">
      <div class="container center reveal">
        <span class="eyebrow eyebrow--dark">Find your color</span>
        <h2>Let's make a sample board</h2>
        <p class="lead" style="color:rgba(246,242,234,.74); margin-inline:auto; margin-top:1.1rem">Bring us a cabinet door, a trim sample, or just an idea. We'll blend Duraseal stains and test until the color is unmistakably yours.</p>
        <div style="margin-top:1.9rem"><a class="btn" href="pricing.html#quote">Start with a consultation <span class="arrow">→</span></a></div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="footer-top">
        <div class="footer-brand">
          <a class="brand" href="index.html"><span class="brand-mark">G·W·T</span><span><span class="brand-name">Hardwood Floors</span></span></a>
          <p>Second-generation hardwood flooring craftsmanship — refinishing, installation, and custom stain work across Pontiac and Metro Detroit.</p>
        </div>
        <div class="footer-col"><h4>Explore</h4><ul><li><a href="services.html">Services</a></li><li><a href="stain-gallery.html">Stain Gallery</a></li><li><a href="about.html">About Us</a></li></ul></div>
        <div class="footer-col"><h4>Helpful</h4><ul><li><a href="faq.html">FAQ</a></li><li><a href="floor-care.html">Floor Care Guide</a></li><li><a href="pricing.html">Pricing Guide</a></li><li><a href="pricing.html#quote">Request a Quote</a></li></ul></div>
        <div class="footer-col"><h4>Contact</h4><ul>
          <li><a href="tel:+12483796826">Gary · 248-379-6826</a></li>
          <li><a href="tel:+12486323244">Jake · 248-632-3244</a></li>
          <li><a href="tel:+19479574996">Greg · 947-957-4996</a></li>
          <li><a href="mailto:gwthardwoodfloors@gmail.com">gwthardwoodfloors@gmail.com</a></li>
          <li><span>Serving all of Michigan</span></li>
        </ul></div>
      </div>
      <div class="footer-bottom">
        <span>© 2026 GWT Hardwood Floors · Family-owned, Michigan-built</span>
        <span>Stains by Duraseal · Finishes by Glitsa, Pallmann, Bona, Loba</span>
      </div>
    </div>
  </footer>
  <script src="main.js"></script>
</body>
</html>
GWTFILEEOF

cat > about.html << 'GWTFILEEOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us — A Family-Built Flooring Company | GWT Hardwood Floors</title>
  <meta name="description" content="GWT Hardwood Floors was founded in the early 2000s by Gary and Mary Turner. Their sons Jake and Greg carry the craft forward — 60+ years combined across Metro Detroit.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,300;9..144,340;9..144,400;9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <script>document.documentElement.classList.add('js');</script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <nav class="nav" aria-label="Primary">
        <a class="brand" href="index.html">
          <span class="brand-mark">G·W·T</span>
          <span><span class="brand-name">Hardwood Floors</span><span class="brand-sub">Pontiac · Metro Detroit</span></span>
        </a>
        <ul class="nav-links-desktop">
          <li><a href="index.html">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="stain-gallery.html">Stain Gallery</a></li>
          <li><a href="about.html" class="active">About</a></li>
          <li><a href="faq.html">FAQ</a></li>
          <li><a href="floor-care.html">Floor Care</a></li>
          <li><a href="pricing.html">Pricing</a></li>
        </ul>
        <div class="nav-cta-desktop"><a class="btn" href="pricing.html#quote">Request a quote</a></div>
        <details class="nav-mobile">
          <summary><span class="burger"><span></span><span></span><span></span></span>Menu</summary>
          <div class="nav-mobile-panel">
            <a href="index.html">Home</a>
            <a href="services.html">Services</a>
            <a href="stain-gallery.html">Stain Gallery</a>
            <a href="about.html">About</a>
            <a href="faq.html">FAQ</a>
            <a href="floor-care.html">Floor Care</a>
            <a href="pricing.html">Pricing</a>
            <a class="btn nav-cta-mobile" href="pricing.html#quote">Request a quote</a>
          </div>
        </details>
      </nav>
    </div>
  </header>

  <main>
    <section class="page-hero">
      <div class="container">
        <span class="eyebrow eyebrow--dark">About Us</span>
        <h1>Two generations, one standard.</h1>
        <p class="lead">GWT Hardwood Floors is a family business — started by a husband and wife, carried on by their two sons, and held to the same standard it was built on more than twenty years ago.</p>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="split split--wide-left reveal">
          <div>
            <span class="eyebrow">Where it started</span>
            <h2>Gary &amp; Mary Turner, early 2000s</h2>
            <p class="lead" style="margin-top:1.1rem">The business was founded in the early 2000s by Gary and Mary Turner, who built their reputation on craftsmanship, honesty, and high-quality hardwood work throughout Pontiac and the Metro Detroit area.</p>
            <p class="lead" style="margin-top:1rem">Gary handled the technical side of the craft — sanding, refinishing, installation, and custom stain work. Mary managed operations and customer relationships. Together they built a company known for reliability, attention to detail, and floors that stand the test of time. Their standard still guides the business today.</p>
          </div>
          <div class="material-panel">
            <div class="specimen-media" style="background-image:repeating-linear-gradient(110deg, rgba(21,18,15,.025) 0px, rgba(21,18,15,.025) 1px, transparent 1px, transparent 4px), linear-gradient(160deg, var(--parchment), var(--bone) 60%)">
              <span class="specimen-tag">Photograph — Founders</span>
            </div>
            <div class="specimen-body"><div class="specimen-name">Gary &amp; Mary Turner</div><div class="specimen-meta">Founders</div></div>
          </div>
        </div>
      </div>
    </section>

    <section class="section section--parchment">
      <div class="container">
        <div class="split reveal">
          <div class="material-panel">
            <div class="specimen-media" style="background-image:repeating-linear-gradient(110deg, rgba(21,18,15,.025) 0px, rgba(21,18,15,.025) 1px, transparent 1px, transparent 4px), linear-gradient(160deg, #e7dcc6, #f4ecdf 60%)">
              <span class="specimen-tag">Photograph — On the Job</span>
            </div>
            <div class="specimen-body"><div class="specimen-name">Jake &amp; Greg Turner</div><div class="specimen-meta">Second generation</div></div>
          </div>
          <div>
            <span class="eyebrow">The next generation</span>
            <h2>Jake &amp; Greg, learning at their father's side</h2>
            <p class="lead" style="margin-top:1.1rem">Gary and Mary's two sons, Jake and Greg, have been part of the business since graduating high school in 2004 and 2008. Both grew up learning the trade directly from their father, and over the years have become an even more refined version of him at installing and refinishing hardwood floors.</p>
            <p class="lead" style="margin-top:1rem">Today the family brings decades of combined experience, pride, and care to every home — delivering floors that look beautiful, wear well, and make homeowners proud of their space.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- VALUES -->
    <section class="section">
      <div class="container">
        <div class="section-head reveal">
          <span class="eyebrow">What we stand on</span>
          <h2>The values Gary and Mary built the company on</h2>
        </div>
        <div class="grid grid-3 reveal" style="gap:1.2rem">
          <div class="plate"><span class="cap">Craftsmanship</span><h3>Sharp tools, patient hands</h3><p>Clean prep and finishes applied with patience. The details you can't see are what make the floor last.</p></div>
          <div class="plate"><span class="cap">Honesty</span><h3>Straight answers</h3><p>What your floor needs, and what it doesn't. No upsell, no surprises on the invoice.</p></div>
          <div class="plate"><span class="cap">Respect</span><h3>For your home</h3><p>And your time, and your floors. We keep the job site clean and treat the work like it's our own house.</p></div>
          <div class="plate"><span class="cap">Reliability</span><h3>We show up</h3><p>We communicate, and stay until it's right. "Whatever it takes" is our actual schedule.</p></div>
          <div class="plate"><span class="cap">Attention to detail</span><h3>Checked in real light</h3><p>Color matched on sample boards, edges hand-worked, sheen checked before we call it done.</p></div>
          <div class="plate"><span class="cap">Built to last</span><h3>Floors that hold up</h3><p>The right finish system for the job means floors that handle kids, pets, and Michigan winters for decades.</p></div>
        </div>
      </div>
    </section>

    <!-- EXPERIENCE STRIP -->
    <div class="container">
      <div class="stats-strip">
        <div class="stat"><div class="num">60+</div><div class="label">Years combined experience</div></div>
        <div class="stat"><div class="num">2000s</div><div class="label">Family-owned since</div></div>
        <div class="stat"><div class="num">2</div><div class="label">Generations of the trade</div></div>
        <div class="stat"><div class="num">All&nbsp;MI</div><div class="label">Michigan service area</div></div>
      </div>
    </div>

    <section class="section section--dark">
      <div class="container center reveal">
        <span class="eyebrow eyebrow--dark">Work with the family</span>
        <h2>We'd be glad to help with your floors</h2>
        <p class="lead" style="color:rgba(246,242,234,.74); margin-inline:auto; margin-top:1.1rem">Call Gary, Jake, or Greg directly — you'll always be talking to someone who'll be on the job.</p>
        <div style="margin-top:1.9rem"><a class="btn" href="pricing.html#quote">Request a quote <span class="arrow">→</span></a></div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="footer-top">
        <div class="footer-brand">
          <a class="brand" href="index.html"><span class="brand-mark">G·W·T</span><span><span class="brand-name">Hardwood Floors</span></span></a>
          <p>Second-generation hardwood flooring craftsmanship — refinishing, installation, and custom stain work across Pontiac and Metro Detroit.</p>
        </div>
        <div class="footer-col"><h4>Explore</h4><ul><li><a href="services.html">Services</a></li><li><a href="stain-gallery.html">Stain Gallery</a></li><li><a href="about.html">About Us</a></li></ul></div>
        <div class="footer-col"><h4>Helpful</h4><ul><li><a href="faq.html">FAQ</a></li><li><a href="floor-care.html">Floor Care Guide</a></li><li><a href="pricing.html">Pricing Guide</a></li><li><a href="pricing.html#quote">Request a Quote</a></li></ul></div>
        <div class="footer-col"><h4>Contact</h4><ul>
          <li><a href="tel:+12483796826">Gary · 248-379-6826</a></li>
          <li><a href="tel:+12486323244">Jake · 248-632-3244</a></li>
          <li><a href="tel:+19479574996">Greg · 947-957-4996</a></li>
          <li><a href="mailto:gwthardwoodfloors@gmail.com">gwthardwoodfloors@gmail.com</a></li>
          <li><span>Serving all of Michigan</span></li>
        </ul></div>
      </div>
      <div class="footer-bottom">
        <span>© 2026 GWT Hardwood Floors · Family-owned, Michigan-built</span>
        <span>Stains by Duraseal · Finishes by Glitsa, Pallmann, Bona, Loba</span>
      </div>
    </div>
  </footer>
  <script src="main.js"></script>
</body>
</html>
GWTFILEEOF

cat > faq.html << 'GWTFILEEOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FAQ — Hardwood Floor Questions Answered | GWT Hardwood Floors</title>
  <meta name="description" content="Common questions about hardwood floor refinishing and installation: timelines, dust, odor, pets, furniture, maintenance, and our Metro Detroit service area.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,300;9..144,340;9..144,400;9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <script>document.documentElement.classList.add('js');</script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <nav class="nav" aria-label="Primary">
        <a class="brand" href="index.html">
          <span class="brand-mark">G·W·T</span>
          <span><span class="brand-name">Hardwood Floors</span><span class="brand-sub">Pontiac · Metro Detroit</span></span>
        </a>
        <ul class="nav-links-desktop">
          <li><a href="index.html">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="stain-gallery.html">Stain Gallery</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="faq.html" class="active">FAQ</a></li>
          <li><a href="floor-care.html">Floor Care</a></li>
          <li><a href="pricing.html">Pricing</a></li>
        </ul>
        <div class="nav-cta-desktop"><a class="btn" href="pricing.html#quote">Request a quote</a></div>
        <details class="nav-mobile">
          <summary><span class="burger"><span></span><span></span><span></span></span>Menu</summary>
          <div class="nav-mobile-panel">
            <a href="index.html">Home</a>
            <a href="services.html">Services</a>
            <a href="stain-gallery.html">Stain Gallery</a>
            <a href="about.html">About</a>
            <a href="faq.html">FAQ</a>
            <a href="floor-care.html">Floor Care</a>
            <a href="pricing.html">Pricing</a>
            <a class="btn nav-cta-mobile" href="pricing.html#quote">Request a quote</a>
          </div>
        </details>
      </nav>
    </div>
  </header>

  <main>
    <section class="page-hero">
      <div class="container">
        <span class="eyebrow eyebrow--dark">FAQ</span>
        <h1>Questions homeowners ask us.</h1>
        <p class="lead">Straight answers about what a hardwood project actually looks like — timelines, dust, odor, pets, and everything in between. Don't see your question? Just call.</p>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="faq-list reveal" style="max-width:820px">

          <details class="faq-item" open>
            <summary><span>How long does a typical refinishing job take?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Most whole-floor refinishes run about three to five days, depending on square footage, the stain, and the finish system. Sanding and staining happen first, then each coat of finish needs time to dry between passes. We'll give you a firm timeline once we've seen the floor.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>Is hardwood refinishing very dusty?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Far less than people expect. We sand with professional, dust-contained equipment that captures the vast majority of dust at the source. You'll still want to wipe down a few surfaces afterward, but the days of a house buried in fine grit are behind us.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>Will the finish smell? Can we stay in the house?</span><span class="toggle"></span></summary>
            <div class="answer"><p>It depends on the finish you choose. Water-based systems are low-odor and clear quickly. Oil-based and traditional alcohol-based finishes carry a stronger smell and need more ventilation. For odor-sensitive households or occupied homes, we'll usually recommend a water-based system and walk you through what to expect.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>What about my pets?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Pets and fresh finish don't mix — paws track and curiosity gets the better of them. We ask that pets stay out of the work area while floors are curing. We're happy to plan the job in sections when possible so your home stays livable.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>Do you move the furniture?</span><span class="toggle"></span></summary>
            <div class="answer"><p>We can help with the heavy pieces, but we ask that you clear small items, electronics, rugs, and breakables before we start. A clear room lets us prep properly and protects your belongings from dust and finish.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>How soon can we walk on the floors and put furniture back?</span><span class="toggle"></span></summary>
            <div class="answer"><p>You can usually walk on the floors in socks within a day of the final coat. We recommend waiting before putting rugs down and moving furniture back, since finishes keep curing to full hardness for a couple of weeks. We'll give you exact times for your specific finish.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>Can you match a custom color to my cabinets or trim?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Yes — this is some of our favorite work. We blend Duraseal stains and prove the color on sample boards milled from your own floor before we commit. Our WheatStone Oak finish came from exactly this process: matching a floor to two different cabinet tones in the same home.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>How many times can a floor be refinished?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Solid hardwood can typically be refinished several times over its lifetime, because each refinish only removes a thin layer. Engineered floors have a thinner wear layer and can usually be refinished fewer times. We'll check your floor's thickness and let you know what's left to work with.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>Should I refinish or replace my floors?</span><span class="toggle"></span></summary>
            <div class="answer"><p>If the boards are solid and have enough thickness left, refinishing is almost always the better value — you keep the original wood and get a like-new result. Replacement makes sense when there's severe water damage, structural issues, or the wear layer is gone. We'll give you an honest read either way.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>What's the difference between water-, oil-, and alcohol-based finishes?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Water-based finishes dry fast, stay clear, and keep your color true. Oil-based finishes add warmth and a slight amber tone and are very forgiving. Traditional alcohol-based (Swedish-style) finishes are prized for a hard, glass-clear film. Each has a place — we'll recommend the right one for your color, traffic, and household.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>Can you repair water damage, pet stains, or a few bad boards?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Yes. We replace damaged boards, weave in new wood, and blend repairs into the surrounding floor so they disappear. A good patch matches species, grain, and board size — then the stain and finish are feathered so your eye never finds the seam.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>Do you install new hardwood, or only refinish?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Both. We install new solid and engineered hardwood — including subfloor prep, acclimation, layout, and finishing — and we refinish existing floors and staircases. Many projects combine the two.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>What areas do you serve?</span><span class="toggle"></span></summary>
            <div class="answer"><p>We're based in the Pontiac and Metro Detroit area and work with homeowners all over Michigan. If you're not sure whether you're in range, just give us a call.</p></div>
          </details>

          <details class="faq-item">
            <summary><span>How do I get a quote?</span><span class="toggle"></span></summary>
            <div class="answer"><p>Call or email Gary or Greg, tell us a little about your space, and we'll set up a walkthrough. After we've seen the floor, you'll get a detailed quote with no pressure to book. Reach us at 248-379-6826 (Gary) or 947-957-4996 (Greg).</p></div>
          </details>

        </div>
      </div>
    </section>

    <section class="section section--dark">
      <div class="container center reveal">
        <span class="eyebrow eyebrow--dark">Still have a question?</span>
        <h2>Ask us directly</h2>
        <p class="lead" style="color:rgba(246,242,234,.74); margin-inline:auto; margin-top:1.1rem">We're happy to talk through your project before you commit to anything.</p>
        <div style="margin-top:1.9rem"><a class="btn" href="pricing.html#quote">Get in touch <span class="arrow">→</span></a></div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="footer-top">
        <div class="footer-brand">
          <a class="brand" href="index.html"><span class="brand-mark">G·W·T</span><span><span class="brand-name">Hardwood Floors</span></span></a>
          <p>Second-generation hardwood flooring craftsmanship — refinishing, installation, and custom stain work across Pontiac and Metro Detroit.</p>
        </div>
        <div class="footer-col"><h4>Explore</h4><ul><li><a href="services.html">Services</a></li><li><a href="stain-gallery.html">Stain Gallery</a></li><li><a href="about.html">About Us</a></li></ul></div>
        <div class="footer-col"><h4>Helpful</h4><ul><li><a href="faq.html">FAQ</a></li><li><a href="floor-care.html">Floor Care Guide</a></li><li><a href="pricing.html">Pricing Guide</a></li><li><a href="pricing.html#quote">Request a Quote</a></li></ul></div>
        <div class="footer-col"><h4>Contact</h4><ul>
          <li><a href="tel:+12483796826">Gary · 248-379-6826</a></li>
          <li><a href="tel:+12486323244">Jake · 248-632-3244</a></li>
          <li><a href="tel:+19479574996">Greg · 947-957-4996</a></li>
          <li><a href="mailto:gwthardwoodfloors@gmail.com">gwthardwoodfloors@gmail.com</a></li>
          <li><span>Serving all of Michigan</span></li>
        </ul></div>
      </div>
      <div class="footer-bottom">
        <span>© 2026 GWT Hardwood Floors · Family-owned, Michigan-built</span>
        <span>Stains by Duraseal · Finishes by Glitsa, Pallmann, Bona, Loba</span>
      </div>
    </div>
  </footer>
  <script src="main.js"></script>
</body>
</html>
GWTFILEEOF

cat > floor-care.html << 'GWTFILEEOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Floor Care Guide — Keep Your Hardwood Beautiful | GWT Hardwood Floors</title>
  <meta name="description" content="A practical hardwood floor care guide: daily and weekly cleaning, what to avoid, how to protect your floors, and when to call for refinishing or repairs.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,300;9..144,340;9..144,400;9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <script>document.documentElement.classList.add('js');</script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <nav class="nav" aria-label="Primary">
        <a class="brand" href="index.html">
          <span class="brand-mark">G·W·T</span>
          <span><span class="brand-name">Hardwood Floors</span><span class="brand-sub">Pontiac · Metro Detroit</span></span>
        </a>
        <ul class="nav-links-desktop">
          <li><a href="index.html">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="stain-gallery.html">Stain Gallery</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="faq.html">FAQ</a></li>
          <li><a href="floor-care.html" class="active">Floor Care</a></li>
          <li><a href="pricing.html">Pricing</a></li>
        </ul>
        <div class="nav-cta-desktop"><a class="btn" href="pricing.html#quote">Request a quote</a></div>
        <details class="nav-mobile">
          <summary><span class="burger"><span></span><span></span><span></span></span>Menu</summary>
          <div class="nav-mobile-panel">
            <a href="index.html">Home</a>
            <a href="services.html">Services</a>
            <a href="stain-gallery.html">Stain Gallery</a>
            <a href="about.html">About</a>
            <a href="faq.html">FAQ</a>
            <a href="floor-care.html">Floor Care</a>
            <a href="pricing.html">Pricing</a>
            <a class="btn nav-cta-mobile" href="pricing.html#quote">Request a quote</a>
          </div>
        </details>
      </nav>
    </div>
  </header>

  <main>
    <section class="page-hero">
      <div class="container">
        <span class="eyebrow eyebrow--dark">Floor Care Guide</span>
        <h1>How to keep your floors looking new.</h1>
        <p class="lead">A good hardwood floor rewards a little routine. Follow these habits and your finish will stay beautiful for years between refinishes — whether your floors are brand new or freshly restored.</p>
      </div>
    </section>

    <section class="section">
      <div class="container" style="max-width:880px">

        <div class="reveal" style="padding-block:2rem; border-top:1px solid var(--line)">
          <span class="cap" style="color:var(--brass)">Step 01</span>
          <h3 style="margin-top:.5rem">Daily &amp; weekly cleaning</h3>
          <p class="lead" style="margin-top:.7rem">The goal is simple: keep grit off the surface, because fine dirt is what dulls a finish over time.</p>
          <ul class="tick-list" style="margin-top:1.3rem">
            <li><strong>Daily / as needed:</strong> Sweep or dry dust-mop high-traffic areas. A microfiber mop lifts grit without scratching.</li>
            <li><strong>Weekly:</strong> Vacuum with a hard-floor setting or a soft-brush head — never a beater bar.</li>
            <li><strong>Weekly or as needed:</strong> Damp-mop with a cleaner made for hardwood. Use a well-wrung microfiber pad — the floor should look barely damp and dry within seconds.</li>
            <li><strong>Spills:</strong> Wipe up promptly. Standing liquid is the enemy of any wood floor.</li>
          </ul>
        </div>

        <div class="reveal" style="padding-block:2rem; border-top:1px solid var(--line)">
          <span class="cap" style="color:var(--brass)">Step 02</span>
          <h3 style="margin-top:.5rem">What to avoid</h3>
          <p class="lead" style="margin-top:.7rem">Most floor damage we're called to fix comes from the wrong cleaning method, not normal wear.</p>
          <div class="grid grid-2" style="margin-top:1.3rem">
            <div>
              <span class="cap">Do</span>
              <ul class="tick-list" style="margin-top:.8rem">
                <li>Use cleaners made specifically for hardwood floors</li>
                <li>Keep the mop barely damp and dry quickly</li>
                <li>Test any new product in a closet or corner first</li>
                <li>Follow your finish manufacturer's recommendations</li>
              </ul>
            </div>
            <div>
              <span class="cap">Avoid</span>
              <ul class="tick-list tick-list--avoid" style="margin-top:.8rem">
                <li><strong>Steam mops</strong> — heat and moisture can cloud or lift a finish</li>
                <li>Wet mopping or letting water pool on the floor</li>
                <li>Vinegar, ammonia, bleach, or all-purpose sprays</li>
                <li>Oil soaps and wax on a polyurethane finish</li>
                <li>Vacuum beater bars and stiff-bristle brooms</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="reveal" style="padding-block:2rem; border-top:1px solid var(--line)">
          <span class="cap" style="color:var(--brass)">Step 03</span>
          <h3 style="margin-top:.5rem">How to protect your floors</h3>
          <p class="lead" style="margin-top:.7rem">A few small habits prevent the scratches and dents that send floors to early refinishing.</p>
          <ul class="tick-list" style="margin-top:1.3rem">
            <li><strong>Rugs &amp; mats:</strong> Place walk-off mats at every entry to catch grit and road salt — important through a Michigan winter. Use breathable, non-staining rug pads.</li>
            <li><strong>Furniture pads:</strong> Put felt pads under all furniture legs and check them regularly — a worn pad with embedded grit acts like sandpaper.</li>
            <li><strong>Pet nails:</strong> Keep nails trimmed. Even a well-finished floor will show scratches from long claws over time.</li>
            <li><strong>Sunlight:</strong> Wood color shifts with UV exposure. Rotate rugs and area pieces occasionally so the floor ages evenly.</li>
            <li><strong>Humidity:</strong> Wood expands and contracts with the seasons. Keep indoor humidity in a stable, moderate range to minimize gapping in winter and cupping in summer.</li>
            <li><strong>Shoes:</strong> Keep heels in good repair and grit outside — small habits add up over years.</li>
          </ul>
        </div>

        <div class="reveal" style="padding-block:2rem; border-top:1px solid var(--line); border-bottom:1px solid var(--line)">
          <span class="cap" style="color:var(--brass)">Step 04</span>
          <h3 style="margin-top:.5rem">When to call for refinishing or repairs</h3>
          <p class="lead" style="margin-top:.7rem">Catching wear early often means a simpler, less expensive fix. Reach out when you notice:</p>
          <ul class="tick-list" style="margin-top:1.3rem">
            <li>Dull, worn finish in traffic paths, hallways, or in front of the sink and stove</li>
            <li>Surface scratches that have started reaching bare wood</li>
            <li>Gray or black spots, which can mean moisture has gotten past the finish</li>
            <li>Boards that are cupping, crowning, or have noticeable gaps</li>
            <li>Water damage, pet stains, or a few boards that need replacing</li>
            <li>A color that no longer fits your space — a refinish is the time to change it</li>
          </ul>
          <p class="lead" style="margin-top:1.2rem">When a finish is worn but the wood underneath is sound, a <em>recoat or refinish</em> restores protection before damage reaches the wood. We're glad to take a look and tell you honestly what your floor needs.</p>
        </div>

      </div>
    </section>

    <section class="section section--dark">
      <div class="container center reveal">
        <span class="eyebrow eyebrow--dark">Time for a refresh?</span>
        <h2>We'll assess your floors honestly</h2>
        <p class="lead" style="color:rgba(246,242,234,.74); margin-inline:auto; margin-top:1.1rem">Whether it's a simple recoat or a full refinish, we'll tell you what makes sense for your floor and your budget.</p>
        <div style="margin-top:1.9rem"><a class="btn" href="pricing.html#quote">Request a quote <span class="arrow">→</span></a></div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="footer-top">
        <div class="footer-brand">
          <a class="brand" href="index.html"><span class="brand-mark">G·W·T</span><span><span class="brand-name">Hardwood Floors</span></span></a>
          <p>Second-generation hardwood flooring craftsmanship — refinishing, installation, and custom stain work across Pontiac and Metro Detroit.</p>
        </div>
        <div class="footer-col"><h4>Explore</h4><ul><li><a href="services.html">Services</a></li><li><a href="stain-gallery.html">Stain Gallery</a></li><li><a href="about.html">About Us</a></li></ul></div>
        <div class="footer-col"><h4>Helpful</h4><ul><li><a href="faq.html">FAQ</a></li><li><a href="floor-care.html">Floor Care Guide</a></li><li><a href="pricing.html">Pricing Guide</a></li><li><a href="pricing.html#quote">Request a Quote</a></li></ul></div>
        <div class="footer-col"><h4>Contact</h4><ul>
          <li><a href="tel:+12483796826">Gary · 248-379-6826</a></li>
          <li><a href="tel:+12486323244">Jake · 248-632-3244</a></li>
          <li><a href="tel:+19479574996">Greg · 947-957-4996</a></li>
          <li><a href="mailto:gwthardwoodfloors@gmail.com">gwthardwoodfloors@gmail.com</a></li>
          <li><span>Serving all of Michigan</span></li>
        </ul></div>
      </div>
      <div class="footer-bottom">
        <span>© 2026 GWT Hardwood Floors · Family-owned, Michigan-built</span>
        <span>Stains by Duraseal · Finishes by Glitsa, Pallmann, Bona, Loba</span>
      </div>
    </div>
  </footer>
  <script src="main.js"></script>
</body>
</html>
GWTFILEEOF

cat > pricing.html << 'GWTFILEEOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pricing Guide — Hardwood Floor Cost Ranges | GWT Hardwood Floors</title>
  <meta name="description" content="Understand what affects hardwood flooring cost — square footage, floor condition, stain complexity, finish system, stairs, and repairs. Request a detailed quote.">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,300;9..144,340;9..144,400;9..144,500;9..144,600&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="style.css">
  <script>document.documentElement.classList.add('js');</script>
</head>
<body>
  <header class="site-header">
    <div class="container">
      <nav class="nav" aria-label="Primary">
        <a class="brand" href="index.html">
          <span class="brand-mark">G·W·T</span>
          <span><span class="brand-name">Hardwood Floors</span><span class="brand-sub">Pontiac · Metro Detroit</span></span>
        </a>
        <ul class="nav-links-desktop">
          <li><a href="index.html">Home</a></li>
          <li><a href="services.html">Services</a></li>
          <li><a href="stain-gallery.html">Stain Gallery</a></li>
          <li><a href="about.html">About</a></li>
          <li><a href="faq.html">FAQ</a></li>
          <li><a href="floor-care.html">Floor Care</a></li>
          <li><a href="pricing.html" class="active">Pricing</a></li>
        </ul>
        <div class="nav-cta-desktop"><a class="btn" href="pricing.html#quote">Request a quote</a></div>
        <details class="nav-mobile">
          <summary><span class="burger"><span></span><span></span><span></span></span>Menu</summary>
          <div class="nav-mobile-panel">
            <a href="index.html">Home</a>
            <a href="services.html">Services</a>
            <a href="stain-gallery.html">Stain Gallery</a>
            <a href="about.html">About</a>
            <a href="faq.html">FAQ</a>
            <a href="floor-care.html">Floor Care</a>
            <a href="pricing.html">Pricing</a>
            <a class="btn nav-cta-mobile" href="pricing.html#quote">Request a quote</a>
          </div>
        </details>
      </nav>
    </div>
  </header>

  <main>
    <section class="page-hero">
      <div class="container">
        <span class="eyebrow eyebrow--dark">Pricing Guide</span>
        <h1>Honest pricing, no surprises.</h1>
        <p class="lead">Every floor is different, so we quote every job individually after seeing it. The ranges below give you a sense of where projects typically start — the real number comes from a quick walkthrough.</p>
      </div>
    </section>

    <!-- RATE SHEET -->
    <section class="section">
      <div class="container" style="max-width:880px">
        <div class="rate-list reveal">

          <div class="rate-row">
            <div>
              <span class="cap">Most common</span>
              <h3 style="margin-top:.5rem">Refinishing</h3>
              <p class="desc">Sand to bare wood, stain, and finish. Range reflects condition, stain complexity, and finish system.</p>
              <div class="rate-includes">
                <span>Full sand &amp; refinish</span>
                <span>Single stain or custom blend</span>
                <span>Water-, oil-, or alcohol-based finish</span>
              </div>
            </div>
            <div class="price">$3<small>– $6+ / sq ft</small></div>
          </div>

          <div class="rate-row">
            <div>
              <span class="cap">New floors</span>
              <h3 style="margin-top:.5rem">Installation</h3>
              <p class="desc">Material plus labor for new solid or engineered hardwood, including subfloor prep and finishing.</p>
              <div class="rate-includes">
                <span>Solid or engineered hardwood</span>
                <span>Subfloor prep &amp; acclimation</span>
                <span>Sand, stain &amp; finish on site</span>
              </div>
            </div>
            <div class="price">$8<small>– $14+ / sq ft</small></div>
          </div>

          <div class="rate-row">
            <div>
              <span class="cap">By the project</span>
              <h3 style="margin-top:.5rem">Stairs &amp; Repairs</h3>
              <p class="desc">Staircases, board replacement, patching, and custom work are priced by scope after a look.</p>
              <div class="rate-includes">
                <span>Staircase refinishing</span>
                <span>Board swaps &amp; patching</span>
                <span>Custom stain matching</span>
              </div>
            </div>
            <div class="price" style="font-size:1.4rem">Quoted per job</div>
          </div>

        </div>
        <p class="lead" style="color:var(--mist); font-size:.85rem; margin-top:1.5rem">Ranges are general estimates for planning only and vary with each home. They are not a quote. Larger areas often price more efficiently per square foot; complex color work and difficult conditions add to it.</p>
      </div>
    </section>

    <!-- WHAT AFFECTS PRICE -->
    <section class="section section--parchment">
      <div class="container">
        <div class="section-head reveal">
          <span class="eyebrow">What affects the price</span>
          <h2>Where your quote comes from</h2>
          <p class="lead" style="margin-top:1rem">Six things move a flooring quote up or down. Knowing them helps you understand exactly what you're paying for.</p>
        </div>
        <div class="grid grid-2 reveal" style="column-gap:3rem">
          <div class="plate"><span class="cap">01</span><h3>Square footage</h3><p>The biggest single factor. Larger continuous areas are usually more efficient per square foot than several small, broken-up rooms.</p></div>
          <div class="plate"><span class="cap">02</span><h3>Condition of the floor</h3><p>Deep scratches, water damage, pet stains, cupping, or failed prior finishes take more prep before color even goes down.</p></div>
          <div class="plate"><span class="cap">03</span><h3>Stain complexity</h3><p>A single off-the-shelf color is straightforward. Custom blends, bleaching, and cabinet-matching mean sample boards and extra time.</p></div>
          <div class="plate"><span class="cap">04</span><h3>Finish system</h3><p>Water-, oil-, and alcohol-based systems differ in product cost, number of coats, and dry time, which affects both price and schedule.</p></div>
          <div class="plate"><span class="cap">05</span><h3>Stairs</h3><p>Staircases are detailed, hand-worked surfaces with many edges. They're priced separately from open floor area.</p></div>
          <div class="plate"><span class="cap">06</span><h3>Repairs &amp; extras</h3><p>Board replacement, transitions, trim, and moving large or built-in items add scope to the job.</p></div>
        </div>
      </div>
    </section>

    <!-- QUOTE CTA -->
    <section class="section section--dark" id="quote">
      <div class="container">
        <div class="split split--wide-left reveal">
          <div>
            <span class="eyebrow eyebrow--dark">Request a quote</span>
            <h2>Get a real number for your floors</h2>
            <p class="lead" style="color:rgba(246,242,234,.74); margin-top:1.1rem">Call or email Gary or Greg with a little about your space — rooms, rough square footage, and what you're hoping for. We'll set up a walkthrough and follow up with a detailed quote. No pressure to book.</p>
            <p class="cap" style="margin-top:1.2rem; color:rgba(246,242,234,.5)">Serving Pontiac, Metro Detroit, and homeowners across Michigan. Hours? Whatever it takes.</p>
          </div>
          <div class="grid" style="gap:1.2rem">
            <div class="plate plate--dark">
              <span class="cap" style="color:var(--brass-soft)">Owner</span>
              <h3 style="color:var(--bone)">Gary</h3>
              <p><a class="link-arrow" style="display:block;margin-top:.5rem;color:var(--bone);border-color:var(--line-dk)" href="tel:+12483796826">248-379-6826</a></p>
              <p style="margin-top:.4rem"><a href="mailto:gwthardwoodfloors@gmail.com" style="font-size:.85rem">gwthardwoodfloors@gmail.com</a></p>
            </div>
            <div class="plate plate--dark">
              <span class="cap" style="color:var(--brass-soft)">Craftsman</span>
              <h3 style="color:var(--bone)">Greg</h3>
              <p><a class="link-arrow" style="display:block;margin-top:.5rem;color:var(--bone);border-color:var(--line-dk)" href="tel:+19479574996">947-957-4996</a></p>
              <p style="margin-top:.4rem"><a href="mailto:g19479574996t@gmail.com" style="font-size:.85rem">g19479574996t@gmail.com</a></p>
            </div>
            <div class="plate plate--dark">
              <span class="cap" style="color:var(--brass-soft)">Craftsman</span>
              <h3 style="color:var(--bone)">Jake</h3>
              <p><a class="link-arrow" style="display:block;margin-top:.5rem;color:var(--bone);border-color:var(--line-dk)" href="tel:+12486323244">248-632-3244</a></p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <div class="footer-top">
        <div class="footer-brand">
          <a class="brand" href="index.html"><span class="brand-mark">G·W·T</span><span><span class="brand-name">Hardwood Floors</span></span></a>
          <p>Second-generation hardwood flooring craftsmanship — refinishing, installation, and custom stain work across Pontiac and Metro Detroit.</p>
        </div>
        <div class="footer-col"><h4>Explore</h4><ul><li><a href="services.html">Services</a></li><li><a href="stain-gallery.html">Stain Gallery</a></li><li><a href="about.html">About Us</a></li></ul></div>
        <div class="footer-col"><h4>Helpful</h4><ul><li><a href="faq.html">FAQ</a></li><li><a href="floor-care.html">Floor Care Guide</a></li><li><a href="pricing.html">Pricing Guide</a></li><li><a href="pricing.html#quote">Request a Quote</a></li></ul></div>
        <div class="footer-col"><h4>Contact</h4><ul>
          <li><a href="tel:+12483796826">Gary · 248-379-6826</a></li>
          <li><a href="tel:+12486323244">Jake · 248-632-3244</a></li>
          <li><a href="tel:+19479574996">Greg · 947-957-4996</a></li>
          <li><a href="mailto:gwthardwoodfloors@gmail.com">gwthardwoodfloors@gmail.com</a></li>
          <li><span>Serving all of Michigan</span></li>
        </ul></div>
      </div>
      <div class="footer-bottom">
        <span>© 2026 GWT Hardwood Floors · Family-owned, Michigan-built</span>
        <span>Stains by Duraseal · Finishes by Glitsa, Pallmann, Bona, Loba</span>
      </div>
    </div>
  </footer>
  <script src="main.js"></script>
</body>
</html>
GWTFILEEOF

echo "Rebuild complete: 7 pages + style.css + main.js replaced with the new design."
