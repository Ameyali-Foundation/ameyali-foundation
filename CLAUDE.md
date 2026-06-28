# Ameyali Foundation Repo Notes

## Project shape

- This is a static Cloudflare Pages site with no framework build step.
- The canonical editable site files are `index.html` and `gallery.html` at the repo root.
- Video assets live in `media/`.
- Brand explorations and logo variants live in `brand/`.
- Historical snapshots live in `archive/`.
- Supporting reference docs live in `docs/`.

## Deployment

- GitHub `main` auto-deploys through Cloudflare Pages.
- CLI deploys are available through Wrangler:
  - `npm install`
  - `npx wrangler login`
  - `npm run cf:deploy`
- The Pages project name is `ameyali-foundation`.
- The Pages preview URL is `https://ameyali-foundation.pages.dev`.

## Guardrails

- Do not reintroduce zip archives into version control.
- Do not commit the duplicate `mnt/` mirror.
- Keep the site root-based unless there is an explicit migration plan, because Pages is serving from the repo root today.
- Be conservative with `index.html`; it is large and contains embedded assets and bilingual content.

## Domain notes

- Production domain: `https://ameyalifoundation.org`
- Secondary production domain: `https://www.ameyalifoundation.org`
- If domain changes are needed, verify them in Cloudflare before changing URLs in content or docs.
