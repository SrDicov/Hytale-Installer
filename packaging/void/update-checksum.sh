#!/usr/bin/env bash
set -euo pipefail
# Actualiza el checksum del tarball de GitHub en el template del VUR.
# Uso: ./packaging/void/update-checksum.sh  [version]
# Requiere que el tag exista en GitHub (git push --tags previo).

VER="${1:-0.1.0}"
URL="https://github.com/SrDicov/Hytale-Installer/archive/refs/tags/v${VER}.tar.gz"
CNR_TEMPLATE="$HOME/.local/share/vary/vurs/cnr/hytale-installer/template"
REPO_TEMPLATE="$HOME/Projects/Hytale-Installer/packaging/void/template"

echo "[*] Descargando $URL ..."
tmp="$(mktemp)"
curl -fsSL --max-time 60 "$URL" -o "$tmp"
sum="$(sha256sum "$tmp" | awk '{print $1}')"
echo "[*] sha256: $sum"

for f in "$REPO_TEMPLATE" "$CNR_TEMPLATE"; do
  [ -f "$f" ] || continue
  sed -i "s/^checksum=.*/checksum=$sum/" "$f"
  echo "[*] parcheado $f"
done
echo "[*] Hecho. Revisa: grep ^checksum $REPO_TEMPLATE"
