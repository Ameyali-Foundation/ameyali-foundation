# Hero animation — drifting dust

Instructions for another engineer or LLM to add the drifting-dust hero animation to `index.html` in this repository.

The animation adds warm dust particles rising across the arena photo in the hero, plus a very gentle Ken-Burns zoom on the image itself. Effect matches the actual dust captured in the golden-hour photo. Everything is CSS-only — no JavaScript, no libraries, GPU-accelerated.

## What you're implementing

- **12 dust particles** (small warm-toned dots) that rise from the bottom of the hero and drift up and left, then fade out. Each has its own delay and duration so the loop looks organic instead of mechanical.
- **Slow image zoom** on the hero background photo (`.hero-img`): 1.05× → 1.10× scale over 30 seconds, easing back and forth. Very subtle — you barely notice it consciously, but the hero feels "alive."
- **Text fade-in** on the hero eyebrow, headline, subhead, and CTAs when the page first loads. Staggered 50 ms apart.
- **Reduced-motion respect**: users with `prefers-reduced-motion: reduce` get a static hero (no zoom, no dust drift, no fade-in). This is non-negotiable — do not skip it.

## Where to edit

Only one file: **`index.html`** at the repo root.

The file is large (~3 MB with base64-embedded photos). Do **not** try to read or rewrite the whole file through any token-limited tool. Use direct text edits or a script — see `CLAUDE.md` and previous commits for the pattern.

## Step 1 — Add CSS

Find the closing `</style>` tag in the file (there is exactly one). Insert the block below **immediately before** that closing tag.

```css
/* ============================================================
   Hero drifting-dust animation
   Warm dust particles + subtle Ken-Burns zoom on the hero image.
   All CSS, no JS. Fully disabled for prefers-reduced-motion.
   ============================================================ */

/* Gentle image zoom — 30s cycle, alternates direction */
.hero-img{animation:heroZoom 30s ease-in-out infinite alternate;transform-origin:50% 40%}
@keyframes heroZoom{
  0%  {transform:scale(1.05)}
  100%{transform:scale(1.10)}
}

/* Dust particle layer — sits above image, below the dark gradient overlay */
.hero-dust{position:absolute;inset:0;pointer-events:none;z-index:1;overflow:hidden}
.hero-dust span{
  position:absolute;bottom:-24px;
  width:6px;height:6px;border-radius:50%;
  background:radial-gradient(circle,rgba(255,224,168,.85) 0%,rgba(255,224,168,.05) 70%,transparent 100%);
  opacity:0;
  animation:heroDust 9s linear infinite;
  will-change:transform,opacity;
}
/* Twelve particles, each with its own left position, delay, duration, and size.
   Keep exactly 12 — more looks busy, fewer looks sparse. */
.hero-dust span:nth-child(1) {left:12%;animation-delay:0s;   animation-duration:9s;   width:8px;height:8px}
.hero-dust span:nth-child(2) {left:22%;animation-delay:1.4s; animation-duration:11s;  width:4px;height:4px}
.hero-dust span:nth-child(3) {left:38%;animation-delay:2.6s; animation-duration:8.5s}
.hero-dust span:nth-child(4) {left:47%;animation-delay:4.2s; animation-duration:12s;  width:5px;height:5px}
.hero-dust span:nth-child(5) {left:58%;animation-delay:.8s;  animation-duration:9.5s; width:7px;height:7px}
.hero-dust span:nth-child(6) {left:68%;animation-delay:3.1s; animation-duration:10s}
.hero-dust span:nth-child(7) {left:76%;animation-delay:5s;   animation-duration:8s;   width:4px;height:4px}
.hero-dust span:nth-child(8) {left:85%;animation-delay:2s;   animation-duration:11.5s;width:6px;height:6px}
.hero-dust span:nth-child(9) {left:29%;animation-delay:6s;   animation-duration:9s;   width:5px;height:5px}
.hero-dust span:nth-child(10){left:64%;animation-delay:4.6s; animation-duration:10.5s;width:8px;height:8px}
.hero-dust span:nth-child(11){left:15%;animation-delay:7.2s; animation-duration:9.5s}
.hero-dust span:nth-child(12){left:52%;animation-delay:5.5s; animation-duration:12s;  width:4px;height:4px}

/* Rise-and-drift-left path, fading in then out */
@keyframes heroDust{
  0%  {transform:translate(0,0);          opacity:0}
  15% {                                    opacity:.85}
  85% {                                    opacity:.6}
  100%{transform:translate(-30px,-520px); opacity:0}
}

/* Text entry fade for the hero copy */
.hero-content .eyebrow  {animation:heroFadeIn .9s .05s ease-out both}
.hero-content h1.display{animation:heroFadeIn 1.1s .20s ease-out both}
.hero-content .hero-sub {animation:heroFadeIn 1.1s .35s ease-out both}
.hero-content .hero-ctas{animation:heroFadeIn 1.1s .50s ease-out both}
@keyframes heroFadeIn{
  from{opacity:0;transform:translateY(14px)}
  to  {opacity:1;transform:translateY(0)}
}

/* Accessibility — kill all hero motion for reduced-motion users */
@media (prefers-reduced-motion: reduce){
  .hero-img,
  .hero-dust span,
  .hero-content .eyebrow,
  .hero-content h1.display,
  .hero-content .hero-sub,
  .hero-content .hero-ctas{
    animation:none !important;
    transform:none !important;
    opacity:1 !important;
  }
}
```

Notes:
- The `.hero-img`, `.hero-content`, `.eyebrow`, `.hero-sub`, `.hero-ctas`, and `h1.display` selectors already exist in the file. You are adding *animation* to them, not redefining structure.
- `will-change:transform,opacity` on the particles hints the compositor to promote them to their own layer. Do not add `will-change` to `.hero-img` — that layer is huge and would waste GPU memory.
- Keep the block right before `</style>` so it wins the cascade over anything earlier.

## Step 2 — Add the dust DOM node

Find the `<section class="hero">` element. Inside it, there is already a `<div class="hero-img" ...>` element. **Immediately after** that div (and before `.hero-overlay`), add:

```html
    <div class="hero-dust" aria-hidden="true">
      <span></span><span></span><span></span><span></span>
      <span></span><span></span><span></span><span></span>
      <span></span><span></span><span></span><span></span>
    </div>
```

Twelve empty `<span>` elements. The `aria-hidden="true"` on the container keeps screen readers from tripping on the decorative layer.

The correct layer order inside `.hero`, top-of-DOM to bottom, should be:

1. `.hero-backdrop` (existing, may be display:none on mobile)
2. `.hero-img` (existing)
3. **`.hero-dust`** ← new, sits above the image, below the dark gradient
4. `.hero-overlay` (existing)
5. `.hero-content` (existing text + CTAs)

If `.hero-overlay` currently has `z-index:1` and `.hero-content` has `z-index:2`, the new `.hero-dust` slot at `z-index:1` (same as overlay but before it in DOM) means the overlay's dark gradient still lands on top of the particles — that's what we want, so the dark corners at the bottom of the hero don't compete with the dust. The CSS above sets `z-index:1` for `.hero-dust` to make this explicit.

## Step 3 — Validate

Load the site locally (`open index.html` or a simple `python3 -m http.server`) and check:

- [ ] The hero image is very slowly zooming/breathing over ~30 seconds. On first view you shouldn't consciously notice it; on a second look you should.
- [ ] Warm dust particles rise from the bottom of the hero and drift up-and-left before fading. Twelve of them, staggered so no two peak at the same moment.
- [ ] On page load, the eyebrow ("ESCARAMUZA AMEYALI · A CALIFORNIA NONPROFIT"), the H1 ("Riding for heritage. Riding for the children."), the subhead, and the CTAs each fade in from slightly below, in that order, over ~1 second total.
- [ ] Text remains readable — dust must not overlap the H1 or subhead in a way that hurts contrast. Peek at both mobile (375 px) and desktop (1440 px) widths.
- [ ] In macOS **System Settings → Accessibility → Display → Reduce motion** (or the equivalent OS toggle), reload the site — the hero should be **completely static**: no zoom, no dust, no fade. Just the photo and the text sitting there.
- [ ] Browser devtools **Performance** tab shows the hero animation running on the compositor thread (no layout thrash, no paint flashing on the image plate). If the FPS drops below 55 on a mid-range laptop, reduce the particle count from 12 to 8 — do not increase animation duration to compensate, that will make it look sluggish.
- [ ] Scroll the page. The hero animation should keep looping quietly while you scroll — but no other section should get affected. If any other element on the page appears to zoom or fade unexpectedly, an unintended selector match happened; check the CSS block.

## Step 4 — Commit

Commit message:

```
feat: drifting-dust hero animation

Adds a subtle Ken-Burns zoom on the hero image and 12 warm dust
particles rising across the arena. Matches the golden-hour dust
already frozen in brand/hero-2026-06-29-extended.jpg. CSS-only,
no JS, GPU-accelerated. Fully disabled under prefers-reduced-motion.
```

Then push to `main`. Cloudflare Pages auto-deploys in ~15 seconds.

## Optional tweaks (only if the client asks)

| Ask | What to change |
|---|---|
| "Too busy" | Drop particle count from 12 to 8: delete `.hero-dust span:nth-child(9..12)` rules **and** remove 4 of the 12 `<span>` elements from the DOM. |
| "Not visible enough on desktop" | Bump particle base size from `6px` to `8px` in `.hero-dust span`. Do not increase opacity — that reads as haze, not dust. |
| "Zoom is distracting" | Increase `heroZoom` duration from `30s` to `45s`, or reduce the end scale from `1.10` to `1.07`. |
| "Text fade-in is too slow" | Cut every stagger delay in half (e.g. `.05s` → `.02s`, `.20s` → `.10s`). Keep the durations. |
| "Want dust warmer/pinker" | Change the particle `background` gradient's inner color from `rgba(255,224,168,.85)` to `rgba(255,190,170,.85)` (a rose-tinted warm). Do not push into pomegranate `#E01B6E` — it will look neon against the photo. |

## What NOT to do

- Do **not** load a JS animation library (GSAP, anime.js, Lottie). This is pure CSS on purpose — zero KB added, no render-blocking, works with JS disabled.
- Do **not** add `background-attachment: fixed` to `.hero-img` for a parallax feel. It has known iOS Safari bugs and interacts poorly with the existing `.hero-backdrop` element.
- Do **not** apply the zoom or dust to any section other than `.hero`. There is a `.photo-band` section elsewhere in the file that uses a similar image treatment — leave it alone.
- Do **not** delete or reorder existing hero CSS rules to make room for these. Append at the bottom of `<style>` as instructed; that lets you revert cleanly with a single git patch if the client changes their mind.
