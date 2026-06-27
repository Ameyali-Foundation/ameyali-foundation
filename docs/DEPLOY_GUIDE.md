# Deploy Guide — GitHub + Cloudflare Pages + Domain

This gets the Ameyali site live on a real URL with auto-deploy on every change, a custom domain, and free WHOIS privacy. ~20 minutes total.

> **Account ownership note:** Create the GitHub and Cloudflare accounts under an email the *foundation* controls (e.g. a new `ameyalifoundation@gmail.com`), then add yourself as a collaborator. The foundation should own its own infrastructure, same as its bank account. You do the work; they hold the keys.

---

## Step 1 — Put the files in a GitHub repo

**a) Create the repo** (browser): https://github.com/new
- Name: `ameyali-foundation`
- Visibility: **Private** (can make public later)
- Do **not** add a README/.gitignore (we already have files)

**b) Push the site** (terminal, from inside the unzipped `Ameyali_site` folder):
```bash
cd Ameyali_site
git init
git add .
git commit -m "Initial Ameyali Foundation site"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/ameyali-foundation.git
git push -u origin main
```
If git asks for auth, use a GitHub personal access token (https://github.com/settings/tokens) or the GitHub CLI (`gh auth login`).

---

## Step 2 — Connect Cloudflare Pages (auto-deploy)

1. https://dash.cloudflare.com → **Workers & Pages** → **Create** → **Pages** → **Connect to Git**
2. Authorize GitHub, pick `ameyali-foundation`
3. Build settings:
   - **Framework preset:** None
   - **Build command:** *(leave blank)*
   - **Build output directory:** `/`
4. **Save and Deploy**

You'll get a live URL like `https://ameyali-foundation.pages.dev` in ~30 seconds.
From now on, every `git push` auto-deploys. To change the site: edit, `git add . && git commit -m "..." && git push`.

---

## Step 3 — Domain: ameyalifoundation.org

1. **Check availability + buy:** https://dash.cloudflare.com → **Registrar** → search `ameyalifoundation.org` (~$10/yr, at cost). Cloudflare Registrar requires the domain's DNS to be on Cloudflare; if buying elsewhere (Namecheap ~$12/yr), you'll point nameservers to Cloudflare after.
2. **WHOIS privacy:** Cloudflare enables **Registrant privacy/redaction automatically and free** — nothing to toggle. (Namecheap also includes free WhoisGuard.)
3. **Buy it in the foundation's name** (org name + the foundation email), not a personal name.

---

## Step 4 — Attach the domain to the site

1. In your Pages project → **Custom domains** → **Set up a custom domain**
2. Enter `ameyalifoundation.org` (and add `www` too)
3. Cloudflare auto-creates the DNS records and provisions HTTPS (free). Done in a few minutes.

---

## Step 5 — (Optional) Free email forwarding

Cloudflare → your domain → **Email** → **Email Routing**: forward `hello@ameyalifoundation.org` and `donate@ameyalifoundation.org` to Evon's Gmail — free, no Workspace subscription needed. Lets the site use a branded address before paying for full email hosting.

---

## After it's live

- Send the `.pages.dev` (or real domain) URL around to Evon/Claudia for review.
- Donations stay in "Coming soon" mode until the processor signup + CA charity registration are done (see `LAUNCH_CHECKLIST.md`).
- To enable donations later: edit `paymentsConfig` in `index.html`, commit, push — auto-deploys.

## Every URL in one place

| Purpose | URL |
|---|---|
| New GitHub repo | https://github.com/new |
| GitHub tokens (for push auth) | https://github.com/settings/tokens |
| Cloudflare dashboard | https://dash.cloudflare.com |
| Domain (Cloudflare Registrar) | https://dash.cloudflare.com → Registrar |
| Domain (Namecheap alt) | https://www.namecheap.com |
