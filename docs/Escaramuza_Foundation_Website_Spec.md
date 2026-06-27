# Website Spec — Escaramuza & Therapeutic Riding Foundation

**Status:** Draft v1 (planning). **Owner:** CodeBody Dynamics.
**Read time:** ~10 min. **Purpose:** Agree on scope, look, and build approach before any code.

> **Placeholder name used throughout the build:** **"Fundación Escaramuza"** (working name — easy to find-and-replace later).
> All foundation-identity values are stubbed in **one config file** so swapping in the real name, EIN, and 501(c)(3) status is a single edit. See §7a.

---

## 1. What this organization is (so we get the framing right)

A foundation built around a **Mexican escaramuza charra team** (women's equestrian event within *charrería* / Mexican rodeo — teams of eight, side-saddle, choreographed routines to music, traditional dresses and sombreros rooted in the *Adelitas* of the Mexican Revolution).

The team also runs a **therapeutic riding program**: kids with autism, physical injuries, and other conditions ride the foundation's horses. In the field this is called **therapeutic riding** or **Equine Assisted Services (EAS)**, usually aligned to **PATH Intl.** safety standards (certified instructors, trained "sidewalkers," a physician's statement before riding).

They fund the work through **performances and donations**.

So the site has to carry three jobs at once: **cultural pride**, **a caring/credible therapy mission**, and **fundraising**. The tone should be warm and dignified — kids are *empowered participants*, never objects of pity.

---

## 2. Audiences & the one action we want from each

| Audience | They're here to… | Primary call to action |
|---|---|---|
| Families of kids who could ride | Understand the program, trust it, reach out | "Inquire about riding" (form → offline intake) |
| Donors | Feel the mission, give money | "Donate" (one-time + recurring) |
| Event organizers / venues | Book the team to perform | "Book a performance" (inquiry form) |
| Sponsors / businesses | Fund a horse, a child, or a season | "Become a sponsor" |
| Volunteers | Help (sidewalkers, barn, events) | "Volunteer" |

Everything on the site should point a visitor toward one of these five actions.

---

## 3. Sitemap

Lean by design. Can ship as a **multi-page site** or a **single long scrolling page with anchor nav** — recommend multi-page for SEO and clarity, with Donate persistent in the header on every page.

1. **Home** — hero (their background image), one-line mission, the three pillars (heritage / therapy / support), proof (photos + a stat or two), and clear CTAs.
2. **Our Story / About** — the escaramuza tradition + why this team turned its horses toward therapy. Team and horse bios.
3. **Therapeutic Riding** — who it helps, how a session works, safety/standards, how to start (inquiry, *not* a medical form — see §8).
4. **Performances / Book Us** — what a performance looks like, gallery/video, upcoming dates, booking inquiry.
5. **Get Involved** — Donate, Sponsor (incl. "sponsor a horse"), Volunteer. Can be one page with three sections or split.
6. **Contact** — location, email, phone, social, map.

Supporting elements present site-wide: **Donate button** (header + footer), **language toggle** (see §6), social links, photo gallery (its own page or woven through).

---

## 4. Page-by-page content outline

**Home**
- Hero: their background photo, foundation name, a short emotive line (EN/ES), and two buttons: *Donate* + *Meet the program*.
- Three pillars (cards): Heritage (escaramuza), Healing (therapeutic riding), Support (how to help).
- A human moment: one strong photo + one or two sentences from a parent or rider (with consent).
- Light proof: e.g. "X riders served," "Y performances a year," "Z horses" — only real numbers.
- Footer CTA band: Donate / Volunteer / Book us.

**Our Story**
- The tradition explained simply and proudly (escaramuza, side-saddle, the dresses, the *Adelitas* roots).
- The pivot to therapy — why these horses, this team, this mission.
- Team members and horses (name, photo, short bio). Horses with personality = donations.

**Therapeutic Riding**
- Who it's for (autism, physical injury/rehab, developmental and sensory needs — kept welcoming, not clinical).
- How a session works (instructor, sidewalkers, the horse's rhythmic gait, a safe arena).
- Safety & credibility (helmets, trained volunteers, alignment with PATH Intl. standards — only claim certifications they actually hold).
- "Start here": short inquiry form (name, contact, a sentence about the child). Then the foundation follows up offline for the real intake.

**Performances / Book Us**
- What the audience sees; photos and ideally a short video.
- Upcoming dates (editable — see §7).
- Booking inquiry form (event, date, location, budget range).

**Get Involved**
- Donate: one-time + monthly, suggested amounts, what each does ("$50 = one therapy session").
- Sponsor: tiers — sponsor a horse, sponsor a child's season, performance sponsor (logo placement).
- Volunteer: roles (sidewalker, barn help, event day), simple signup.

**Contact**
- Email, phone, address/region, embedded map, social, general inquiry form.

---

## 5. Visual design direction

**Palette** (your brown + lighter color, made concrete — tune to taste):

| Role | Suggestion | Notes |
|---|---|---|
| Primary (deep saddle brown) | `#4A3220` | Headings, header, strong elements |
| Secondary brown | `#7A5638` | Subheads, borders, hovers |
| Background (the "lighter color") | `#F5EFE6` warm cream | Main canvas |
| Surface | `#EADFCD` warm sand | Cards, sections |
| Accent (warm marigold/terracotta) | `#C8902F` or `#B5532A` | Donate buttons + CTAs only; nods to the colorful charra dresses / Mexican palette |
| Text | `#2C2017` near-black brown | Body |

> **Contrast caution:** brown-on-cream is easy to get wrong. Body text must hit **WCAG AA (4.5:1)** — use the dark text brown on cream, not mid-brown. Verify every combo. This matters extra here (see §8).

**Typography:** a humanist **serif for headings** (warmth, heritage, dignity — e.g. Fraunces, Bitter) paired with a clean, very readable **sans for body** (e.g. Inter, Source Sans). Suggestions, not locked.

**Imagery:** lead with their real photos — performance action shots, horses, riders mid-session. Texture (leather, woven, warm grain) over gloss. Avoid stocky/corporate feel. **Get signed photo/video releases**, especially for minors and participants with disabilities, before anything is published (see §8).

**Motion:** subtle and warm (gentle reveals on scroll), and **honor `prefers-reduced-motion`** — some visitors have vestibular or sensory sensitivities.

---

## 6. Bilingual (English / Spanish) — recommended

Given the Mexican-heritage identity and Spanish-speaking families, the site should almost certainly be **bilingual** with a language toggle. Simplest approach: `en`/`es` JSON dictionaries + a toggle, content authored in both. Flagging as a decision in §11, but the strong recommendation is yes.

---

## 7. Technical approach (recommended, matches your stack)

- **Frontend:** Vite + React + TypeScript + Tailwind (+ shadcn/ui) — your existing toolkit. A brochure site with forms and donations fits this cleanly.
- **Hosting:** static deploy to **Netlify / Vercel / Cloudflare Pages** — fast, cheap or free, easy custom domain + HTTPS.
- **Editable content (events, photos):** the foundation will want to change performance dates and gallery photos *without* a developer. Options:
  - **Git-based CMS** (Decap/Netlify CMS) — free, edits commit to the repo.
  - **Hosted CMS free tier** (e.g. Sanity) — friendlier UI for non-technical staff.
  - **Simplest:** JSON files the dev updates. Fine if CodeBody is doing ongoing maintenance.
  Pick based on **who maintains it** (decision in §11).
- **Donations:** **Donorbox** (built for nonprofits — recurring, receipts, easy embed) or **Stripe Checkout**. Note: **PayPal Giving Fund** waives fees for verified 501(c)(3)s. Choice depends on their status and any existing account.
- **Forms (inquiries, volunteer, booking):** **Netlify Forms** or **Formspree** — no backend, emails the foundation on submit.
- **i18n:** lightweight JSON dictionaries + toggle.
- **Analytics:** privacy-friendly (Plausible) or GA4.
- **Domain & email:** confirm whether they own a domain; set up a branded inbox for inquiries.

---

## 7a. Scaffolding for placeholders (name, EIN, media)

Everything that will be filled in later lives in **one or two predictable places**, so the foundation can hand over assets at any point and we drop them in without hunting through the code.

**`config/foundation.ts`** — single source of truth for org identity:
```ts
export const foundation = {
  name: "Fundación Escaramuza",        // TODO: replace with legal name
  shortName: "Fundación Escaramuza",
  tagline: { en: "TODO", es: "TODO" },
  ein: "TODO-EIN",                      // shown in footer once provided
  is501c3: false,                       // flip to true; unlocks tax-deductible copy + receipts
  contact: {
    email: "hello@example.org",         // TODO
    phone: "TODO",
    address: "TODO",
    social: { instagram: "", facebook: "", youtube: "" },
  },
  stats: { ridersServed: null, performancesPerYear: null, horses: null }, // hidden until real
};
```
Rule: anywhere the name, EIN, contact info, or stats appear in the UI, it reads from this config — **never** hardcoded in a page. A `TODO` value renders as a visible placeholder in dev and is **hidden in production** (e.g. stats with `null` simply don't show).

**`content/`** — text content for pages, split by language:
```
content/
  en/{home,about,therapy,performances,getInvolved,contact}.md
  es/{home,about,therapy,performances,getInvolved,contact}.md
```
Drafts can ship with "Lorem in Spanish" / placeholder copy; real copy replaces it file-by-file.

**`public/media/`** — drop zone for the photos and videos you'll send:
```
public/media/
  hero/         # background image(s) for the homepage hero
  performances/ # action shots from escaramuza performances
  therapy/      # therapeutic-riding sessions (release required)
  team/         # rider portraits
  horses/       # one photo per horse, named after the horse
  video/        # mp4/webm; include a poster image alongside
```
Until real assets arrive, every page references a **placeholder image** of the right aspect ratio with a subtle "Photo coming soon" overlay. The image components accept `src` + `alt` + `caption`, and when you send the files, swap is literally a filename change — no layout work, no re-styling.

**Image handling:** all photos run through a build-time pipeline (responsive sizes, modern formats like AVIF/WebP, lazy-loading, blur-up placeholders). You hand me originals; the site serves optimized variants automatically.

**Video handling:** prefer **self-hosted MP4** for short hero loops (muted, autoplay, with a poster image), and **YouTube/Vimeo embeds** for full performance videos (no hosting cost, captions support). Need captions for accessibility — if videos don't have them, plan a pass.

This scaffolding means: send assets and naming when convenient; the site is buildable, deployable, and reviewable today with placeholders.

---

## 8. Accessibility, privacy & legal (don't skip — it's also a credibility win)

This org serves disabled people, so the **site itself should be exemplary**:
- **WCAG 2.1 AA**: color contrast (watch the browns), full keyboard navigation, visible focus, alt text on every image, captions on video, large tap targets, reduced-motion support.

Privacy / data:
- The "inquire about riding" form should collect **contact info and a brief note only** — **no medical details, no diagnoses** on the public site. The real intake (physician's statement, waivers, PATH-style screening) happens **offline**.

Legal:
- **Photo/video releases** signed before publishing any image of a minor or participant.
- If they're a **501(c)(3)**: tax-deductible language + acknowledgment/receipt on donations; show EIN in footer.
- Standard liability/waiver flow stays offline.

---

## 9. Assets & info needed from the foundation (checklist)

*All items below have a placeholder/stub in the scaffold — send them whenever ready, drop-in is non-blocking.*

- [ ] Exact legal name (replaces `foundation.name`)
- [ ] 501(c)(3) EIN, if applicable (flips `is501c3` true, populates footer)
- [ ] Logo (or a request to design one)
- [x] **Background image + photos + videos** — *you have these, send when ready; drop into `public/media/` per §7a*
- [ ] Photo/video releases on file for anyone identifiable (especially minors and participants)
- [ ] Mission statement / a few sentences of their story
- [ ] Team member + horse names/bios/photos
- [ ] Upcoming performance schedule
- [ ] Contact: email, phone, location/region, social handles
- [ ] Preferred donation processor / existing account
- [ ] Spanish translations, or approval for us to produce them
- [ ] Domain name (owned? or need to register?)

---

## 10. Phases

- **Phase 0 — Discovery:** confirm name, gather assets, lock the §11 decisions.
- **Phase 1 — Content & design:** finalize palette/type, wireframe, write copy (EN + ES).
- **Phase 2 — Build:** core pages + responsive layout.
- **Phase 3 — Integrations:** donations, inquiry/booking/volunteer forms, language toggle.
- **Phase 4 — QA & launch:** accessibility audit, SEO/metadata, content review, go live.
- **Phase 5 — Handoff:** show the foundation how to update events/photos; agree on maintenance.

---

## 11. Open decisions (need answers to finalize)

1. **Exact foundation name** and 501(c)(3) status?
2. **Bilingual EN/ES?** (Strong recommend: yes.)
3. **Who updates content** after launch — the foundation themselves (→ a CMS) or CodeBody (→ simpler JSON)?
4. **Donation processor** — Donorbox, Stripe, PayPal, or an account they already use?
5. **One scrolling page or multi-page?** (Recommend multi-page.)
6. **Do they own a domain / branded email yet?**

---

*Next step: confirm §11, drop the assets from §9 into a shared folder, and we move to Phase 1 wireframes.*
