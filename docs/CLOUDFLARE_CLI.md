# Cloudflare CLI

## One-time setup

```bash
npm install
npx wrangler login
npx wrangler whoami
```

## Deploy the site

```bash
npm run cf:deploy
```

This uploads the current repo root to the Cloudflare Pages project named `ameyali-foundation`.

## Preview-style deploy

```bash
npm run cf:deploy:preview
```

## Notes

- The site is static and deploys from the repo root.
- GitHub `main` also auto-deploys through Cloudflare Pages.
- As of Wrangler `4.105.0`, Pages project and deployment commands are available in the CLI, but custom domain attachment still needs the Cloudflare dashboard.
