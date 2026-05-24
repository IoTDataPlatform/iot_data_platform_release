#!/bin/sh
set -eu

TMP_DIR="/tmp/connectors"
mkdir -p "$TMP_DIR"

for file in /init/*.json.template; do
  [ -e "$file" ] || exit 0

  rendered_file="$TMP_DIR/$(basename "$file" .template)"
  name="$(basename "$rendered_file" .json)"

  echo "Rendering connector template: $(basename "$file")"
  envsubst < "$file" > "$rendered_file"

  echo "Applying connector: $name"

  curl -fsS -X PUT \
    "$CONNECT_URL/connectors/$name/config" \
    -H "Content-Type: application/json" \
    --data @"$rendered_file"

  echo
done

echo "Init done"