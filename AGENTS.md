# AGENTS.md — Hytale-Installer

Single-file bash wrapper. No build, tests, lint config, or CI. Entrypoint: `hytale-installer` (~490 lines, `set -uo pipefail`).

## Verify
- `bash -n hytale-installer` — must pass. Only known `shellcheck` hit is SC2164 on `cd "$DATA_DIR"` in `do_launch`.
- Safe focused runs (no game launch, no network surprise):
  - `HYTALE_INSTALLER_OFFLINE=1 bash hytale-installer --check`
  - `HYTALE_INSTALLER_NO_LAUNCH=1 bash hytale-installer --no-launch`
  - Isolate FS in tests: `XDG_DATA_HOME=/tmp/xdg-data XDG_CACHE_HOME=/tmp/xdg-cache XDG_RUNTIME_DIR=/tmp HYTALE_INSTALLER_OFFLINE=1 bash hytale-installer --check`
  - Unit-test helpers without running `main`: `source hytale-installer` (guarded by `BASH_SOURCE` check at EOF), then call `detect_distro`, `check_and_warn_deps`, etc.
- Mock upstream, avoid real zip: `HYTALE_INSTALLER_URL=file:///tmp/fake.zip HYTALE_INSTALLER_MAX_RETRIES=1 ... --no-launch`.

## Hard constraints
- Never `sudo` / auto-install deps. `check_and_warn_deps` only warns with the native manager cmd (`suggest_install_cmd`). Preserve this.
- Never vendor `hytale-launcher*.zip` or the binary. Upstream IP (Hypixel) downloads at runtime only — see header notice in `hytale-installer:4-15`.
- `do_purge` / `packaging/void/REMOVE` delete GBs (`~/.local/share/Hytale`, `~/.cache/Hytale`, `~/.config/Hytale` + wrapper dirs). Never run `--purge` unasked.
- Runtime state is XDG-based: bin ` $XDG_DATA_HOME/hytale-installer/hytale-launcher`, `version.txt`, cache `etag.txt` + zip, lock `${XDG_RUNTIME_DIR}/hytale-installer-$USER.lock` (`flock`).
- Upstream prepends a `HYTALE-UPDATE` JSON header (~1885 B) before the zip payload; `fetch_upstream` strips it (first `PK\x03\x04`) before `unzip -t`. Don't "fix" validation back to raw `unzip -t` exit codes.

## Release (Void)
- Keep in sync: `SCRIPT_VERSION` in `hytale-installer:34`, `version=` in `packaging/void/template`, `CHANGELOG.md`. Then tag `vX.Y.Z`, then `./packaging/void/update-checksum.sh <version>` (requires pushed tag; patches `checksum=` in template).
- Canonical Void packaging lives externally (`cnr` VUR); `packaging/void/` here is reference only.
