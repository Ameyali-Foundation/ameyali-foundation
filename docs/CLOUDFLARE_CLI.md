# Cloudflare CLI

## One-time setup

```bash
npm install
npx wrangler login
npx wrangler whoami
```

If you want a non-browser automation path for routine operations, use a scoped Cloudflare API token and put these values in a local `.env` file:

```bash
cp .env.example .env
```

Required values:

- `CLOUDFLARE_ACCOUNT_ID`
- `CLOUDFLARE_API_TOKEN`
- `CLOUDFLARE_ZONE_ID`
- `CLOUDFLARE_PAGES_PROJECT=ameyali-foundation`

Suggested token scopes:

- `Account` -> Pages -> `Edit`
- `Zone` -> DNS -> `Edit`

## Deploy the site

```bash
npm run cf:deploy
```

This uploads the current repo root to the Cloudflare Pages project named `ameyali-foundation`.

## Preview-style deploy

```bash
npm run cf:deploy:preview
```

## Manage Pages domains

List attached domains:

```bash
npm run cf:domains:list
```

Attach one or more domains to the Pages project:

```bash
npm run cf:domain:add -- ameyalifoundation.org www.ameyalifoundation.org
```

## Manage DNS by CLI

Upsert a DNS record:

```bash
RECORD_NAME=www.ameyalifoundation.org \
RECORD_TYPE=CNAME \
RECORD_CONTENT=ameyali-foundation.pages.dev \
npm run cf:dns:upsert
```

## Verify production URLs

```bash
npm run cf:verify
```

## Notes

- The site is static and deploys from the repo root.
- GitHub `main` also auto-deploys through Cloudflare Pages.
- As of Wrangler `4.105.0`, Pages project and deployment commands are available in the CLI, but Pages custom domains are not exposed as Wrangler subcommands. Use the Cloudflare API scripts in this repo for that gap.
- Cloudflare's official docs currently say API tokens are created from the dashboard. After you have a token, the rest of this workflow can be CLI-driven.
