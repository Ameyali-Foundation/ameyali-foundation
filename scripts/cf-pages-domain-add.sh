#!/usr/bin/env bash
set -euo pipefail

: "${CLOUDFLARE_ACCOUNT_ID:?Set CLOUDFLARE_ACCOUNT_ID}"
: "${CLOUDFLARE_API_TOKEN:?Set CLOUDFLARE_API_TOKEN}"

PROJECT_NAME="${CLOUDFLARE_PAGES_PROJECT:-ameyali-foundation}"

if [[ "$#" -lt 1 ]]; then
  echo "Usage: $0 domain [domain ...]" >&2
  exit 1
fi

existing_domains="$(
  curl -fsS \
    -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
    "https://api.cloudflare.com/client/v4/accounts/${CLOUDFLARE_ACCOUNT_ID}/pages/projects/${PROJECT_NAME}/domains" \
    | jq -r '.result[]?.name'
)"

for domain in "$@"; do
  if grep -Fxq "$domain" <<<"${existing_domains}"; then
    echo "Pages domain already attached: ${domain}"
    continue
  fi

  payload="$(jq -n --arg name "$domain" '{name: $name}')"

  curl -fsS \
    -X POST \
    -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
    -H "Content-Type: application/json" \
    --data "${payload}" \
    "https://api.cloudflare.com/client/v4/accounts/${CLOUDFLARE_ACCOUNT_ID}/pages/projects/${PROJECT_NAME}/domains" \
    | jq '{success, errors, domain: .result.name, status: .result.status}'
done
