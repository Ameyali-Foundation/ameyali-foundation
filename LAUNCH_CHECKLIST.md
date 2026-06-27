# Ameyali Foundation — Launch Checklist

Everything needed to take the site fully live and turn on donations. Split into **what you (Fredy / CodeBody) do** and **what the foundation (Evon) does**, since some steps legally require the foundation itself.

---

## A. Ship the site (you — can do tonight)

The site is ready to deploy as-is. Donations show "Coming soon" until Section C is done, but everything else is live.

1. **Deploy the bundle.** Upload the contents of `Ameyali_site/` (index.html, gallery.html, media/) to any static host:
   - Netlify: https://app.netlify.com/drop  — drag the folder, done
   - Cloudflare Pages: https://pages.cloudflare.com
   - Vercel: https://vercel.com
   - All free, all give HTTPS automatically.
2. **Custom domain** (optional but recommended): register e.g. `ameyalifoundation.org` (~$12/yr at https://www.namecheap.com or https://domains.google) and point it at the host.

---

## B. Confirm before/at launch (foundation — quick)

1. **Story copy approval.** The "Our story" and pillar text was written by us, paraphrasing their about-text + incorporation docs. Evon should read it and tweak to her voice. *(Facts are accurate; wording is ours.)*
2. **Photo permissions.** ✅ Confirmed — foundation has rights to the VMS Photography and @JenniferPhotography91 images. (Credits are in the footer + gallery.)
3. **Email + social** are intentionally left off for now. When ready, send a real inbox + handles and we'll add them.

---

## C. Turn on donations (foundation does signup, you do the one-line edit)

Donations cannot legally go live until these are done. None are code problems.

### C1. Foundation registers with a donation processor (Evon — ~20 min)
Pick ONE to start (can add the second later):

- **Zeffy (recommended — 0% fees):** https://www.zeffy.com
  - Sign up, verify the nonprofit, link the foundation's bank account.
  - Create a donation form; copy its embed/form URL.
- **Donorbox (secondary option):** https://donorbox.org
  - Same idea; small processing fees apply.

> The processor handles card + bank (ACH) entry, recurring billing, receipts, and PCI security. The foundation's bank account is linked **inside the processor** — it never goes on the website.

### C2. Register to legally solicit donations in California (Evon / accountant)
California requires charities to register **before** asking the public for money:
- **CA Attorney General — Registry of Charitable Trusts, Form CT-1:** https://oag.ca.gov/charities/initial-reg
- This is a legal prerequisite for soliciting donations, online included. Don't skip it.

### C3. Apply for federal tax-exempt status (Evon / accountant)
Until this is approved, donations are **not tax-deductible** and the site correctly says so.
- **IRS Form 1023-EZ** (most small nonprofits qualify; ~$275): https://www.irs.gov/forms-pubs/about-form-1023-ez
- Eligibility worksheet is in the 1023-EZ instructions.
- When the determination letter arrives, tell us — we flip the site to show tax-deductible language, and **PayPal Giving Fund** (0% fees) becomes available: https://www.paypal.com/us/fundraiser/charity

### C4. You flip the switch (Fredy — one line)
Once Evon sends the processor form URL, open `index.html`, find `paymentsConfig`, and:
```js
primary: {
  enabled: true,                                   // was false
  formUrl: 'https://www.zeffy.com/embed/donation-form/REAL-SLUG',  // paste real URL
  ...
}
```
That's it. The "Coming soon" fallback disappears and the live donate flow (amount tiers, monthly toggle, recurring disclosure) takes over.

---

## D. What's already handled in the build (no action needed)

- Recurring/monthly disclosure language (charged monthly until cancelled, how to cancel, card processed securely by platform, foundation never sees card number)
- Honest 501(c)(3) status ("application pending"), no false tax-deductible claims
- EIN displayed (42-3251924)
- Bilingual EN/ES across both pages
- Gallery page with all photos + lightbox
- Two performance videos, lazy-loaded
- Accessibility: keyboard nav, focus states, reduced-motion, alt text
- Sponsor / Volunteer / Book buttons open working info modals with the foundation's phone number

---

## Quick reference — every URL in one place

| Purpose | URL |
|---|---|
| Deploy (drag & drop) | https://app.netlify.com/drop |
| Domain registration | https://www.namecheap.com |
| Zeffy (0% donations) | https://www.zeffy.com |
| Donorbox | https://donorbox.org |
| CA charity registration (CT-1) | https://oag.ca.gov/charities/initial-reg |
| IRS 1023-EZ (tax-exempt) | https://www.irs.gov/forms-pubs/about-form-1023-ez |
| PayPal Giving Fund (after 501c3) | https://www.paypal.com/us/fundraiser/charity |
