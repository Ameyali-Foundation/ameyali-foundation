---
# Ameyali Foundation
Website for the **Ameyali Foundation** — a California nonprofit and escaramuza charra team based in Gilroy, CA.
Live site: **https://ameyalifoundation.org**
---
## What's in this repo
index.html Main website (bilingual EN/ES, ~3 MB — images are base64-embedded)
gallery.html Full photo gallery (~6 MB — images are base64-embedded)
media/
performance.mp4 Video — performance clip
riders.mp4 Video — riders clip
brand/ Logo explorations, emblem PNGs, SVG variants, contact sheet
archive/ Earlier HTML snapshots kept for reference
docs/ Deploy guide, launch checklist, original site spec

## Preview locally
Just open `index.html` in any browser — no server needed.
## Update and deploy
1. Edit `index.html` or `gallery.html` in any text editor.
2. Commit and push:
   git add index.html gallery.html
   git commit -m "describe what you changed"
   git push
3. Cloudflare Pages auto-deploys in ~15 seconds.
## Activate donations (Zeffy)
1. Sign up at zeffy.com, create a donation form, copy the form URL.
2. Open `index.html`, find `paymentsConfig` near the top of the script block:
   const paymentsConfig = {
     enabled: false,       // ← change to true
     zeffyFormUrl: "",     // ← paste your Zeffy URL here
   };
3. Save, commit, push — donate button goes live immediately.
## Cloudflare Pages
Connected under ameyaliescaramuza@gmail.com. Build command: none. Output dir: /
Every push to main auto-deploys. Dashboard: https://dash.cloudflare.com/df8f4455a00d8cd5e438ba54d2957086/pages
## Domain renewal
ameyalifoundation.org is on Cloudflare (~$10/yr). Add a card under Billing for auto-renewal.
---
