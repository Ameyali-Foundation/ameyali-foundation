# Ameyali Foundation — Donation System Spec

**Last updated:** 2026-06-27

---

## 1. Email Notification (Notify Me)

Captures visitor emails while donation processing is not yet live.

| Field | Value |
|-------|-------|
| Provider | [Formspree](https://formspree.io) (free tier) |
| Endpoint | `https://formspree.io/f/xrewklew` |
| Receiving email | `fredylopez360@gmail.com` |
| Subject line | `Ameyali Foundation — donation notify signup` |
| Location in code | `index.html` line ~940 (inside `notifyForm` submit handler) |

**Status:** Live. Bilingual loading/error states included (EN/ES).

---

## 2. Donation Processing

Two providers are pre-wired in `index.html` inside `paymentsConfig` (line ~781). Both are currently **disabled** (`enabled: false`). Enabling either one swaps the modal from the "notify me" fallback to a working donate flow.

### 2a. Primary — Zeffy (recommended)

| Field | Value |
|-------|-------|
| Provider | [Zeffy](https://zeffy.com) |
| Cost | Free for nonprofits (0% platform fee) |
| Config key | `paymentsConfig.primary` |
| Form URL placeholder | `https://www.zeffy.com/embed/donation-form/TODO` |
| Status | **Not set up yet** |

**To activate:**

1. Create a Zeffy nonprofit account at [zeffy.com](https://zeffy.com).
2. Create a Donation Form.
3. Copy the published form URL.
4. In `index.html`, replace the `formUrl` value in `paymentsConfig.primary`.
5. Set `enabled: true` in `paymentsConfig.primary`.
6. Commit and push.

### 2b. Secondary — Donorbox (backup)

| Field | Value |
|-------|-------|
| Provider | [Donorbox](https://donorbox.org) |
| Cost | Free up to $1k/mo raised; 1.5% platform fee after |
| Config key | `paymentsConfig.secondary` |
| Form URL placeholder | `https://donorbox.org/TODO` |
| Status | **Not set up yet** |

**To activate:**

1. Create a Donorbox account at [donorbox.org](https://donorbox.org).
2. Create a campaign.
3. Copy the campaign URL.
4. In `index.html`, replace the `formUrl` value in `paymentsConfig.secondary`.
5. Set `enabled: true` in `paymentsConfig.secondary`.
6. Commit and push.

### Provider toggle

When both providers are enabled, the donate modal shows a "or use [Other]" toggle so visitors can choose. If only one is enabled, it's used automatically.

---

## 3. Suggested Amounts

Configured in `paymentsConfig`:

- Presets: **$25, $50, $100, $250**
- Default: **$100**
- Custom amount input is also available.
- Recurring (monthly) toggle is built in.

---

## 4. Tax-Deductibility Notice

The modal includes a note that 501(c)(3) status is still pending and donations are not yet tax-deductible. Update this text once status is approved.

---

## 5. Remaining Steps to Ship Donations

- [ ] Sign up for Zeffy and create a donation form
- [ ] Replace `TODO` in `paymentsConfig.primary.formUrl` with real URL
- [ ] Set `paymentsConfig.primary.enabled` to `true`
- [ ] (Optional) Set up Donorbox as a secondary provider
- [ ] Test the full donate flow end-to-end
- [ ] Update tax-deductibility notice once 501(c)(3) is approved
- [ ] Commit and push to deploy
