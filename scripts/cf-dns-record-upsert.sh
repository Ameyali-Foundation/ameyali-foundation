#!/usr/bin/env bash
set -euo pipefail

: "${CLOUDFLARE_ZONE_ID:?Set CLOUDFLARE_ZONE_ID}"
: "${CLOUDFLARE_API_TOKEN:?Set CLOUDFLARE_API_TOKEN}"
: "${RECORD_NAME:?Set RECORD_NAME}"
: "${RECORD_TYPE:?Set RECORD_TYPE}"
: "${RECORD_CONTENT:?Set RECORD_CONTENT}"

TTL="${RECORD_TTL:-1}"
PROXIED="${RECORD_PROXIED:-true}"

existing="$(
  curl -fsS \
    -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
    "https://api.cloudflare.com/client/v4/zones/${CLOUDFLARE_ZONE_ID}/dns_records?type=${RECORD_TYPE}&name=${RECORD_NAME}" \
)"

record_id="$(jq -r '.result[0].id // empty' <<<"${existing}")"
payload="$(
  jq -n \
    --arg type "${RECORD_TYPE}" \
    --arg name "${RECORD_NAME}" \
    --arg content "${RECORD_CONTENT}" \
    --argjson ttl "${TTL}" \
    --argjson proxied "${PROXIED}" \
    '{type: $type, name: $name, content: $content, ttl: $ttl, proxied: $proxied}'
)"

if [[ -n "${record_id}" ]]; then
  curl -fsS \
    -X PATCH \
    -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
    -H "Content-Type: application/json" \
    --data "${payload}" \
    "https://api.cloudflare.com/client/v4/zones/${CLOUDFLARE_ZONE_ID}/dns_records/${record_id}" \
    | jq '{success, errors, record: .result.name, type: .result.type, content: .result.content}'
else
  curl -fsS \
    -X POST \
    -H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" \
    -H "Content-Type: application/json" \
    --data "${payload}" \
    "https://api.cloudflare.com/client/v4/zones/${CLOUDFLARE_ZONE_ID}/dns_records" \
    | jq '{success, errors, record: .result.name, type: .result.type, content: .result.content}'
fi
