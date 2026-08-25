# Hytale Installer

> **Free wrapper (GPL-3.0-or-later) that downloads, updates and launches the official Hytale launcher natively on your distribution**.

<p align="center">
  <img src="icons/256x256/apps/hytale-installer.png" width="128" alt="Hytale H logo">
</p>

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Void Linux](https://img.shields.io/badge/Void-xbps-478061.svg)](https://voidlinux.org)
[![Hytale](https://img.shields.io/badge/Hytale-launcher-0f3460.svg)](https://hytale.com)

**[Español](README.es.md) · English**

---

### What does it do?

`hytale-installer` is a **100% free (GPL-3)** script that:

1. Checks that you have the launcher libraries (GTK3, webkit2gtk-4.1, libsoup3…) and **warns you** with your distro's native command if something is missing.
2. Downloads the official launcher from **Hypixel Studios' public URL**:
   `https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.zip`
3. Automatically updates it on every run with internet (ETag / embedded version) and saves the binary to your personal folder `~/.local/share/hytale-installer/`.
4. If there's no internet, it opens the local binary without complaining. If it's the first run and the download fails, it **retries until it succeeds**.

### Installation

**Void Linux (VUR [cnr](https://github.com/Neko-Void-Linux/cnr)) — recommended:**

With [vouru](https://github.com/javiercplus/vouru):
```bash
vouru add https://github.com/Neko-Void-Linux/cnr
vouru install hytale-installer
```

With [vary](https://github.com/SrDicov/Vary):
```bash
vary --repo add https://github.com/Neko-Void-Linux/cnr
vary -S hytale-installer
```

**Manual (any distro with bash/curl/unzip):**
```bash
git clone https://github.com/SrDicov/Hytale-Installer
cd Hytale-Installer
sudo install -Dm755 hytale-installer /usr/bin/hytale-installer
sudo install -Dm644 hytale-installer.desktop /usr/share/applications/hytale-installer.desktop
for s in 24 32 48 64 128 256 512; do
  sudo install -Dm644 icons/${s}x${s}/apps/hytale-installer.png /usr/share/icons/hicolor/${s}x${s}/apps/hytale-installer.png
done
# Debian/Ubuntu: sudo apt install libgtk-3-0 libwebkit2gtk-4.1-0 libsoup-3.0-0 ...
# Fedora:       sudo dnf install gtk3 webkit2gtk4.1 libsoup3 ...
# Arch:         sudo pacman -S --needed gtk3 webkit2gtk-4.1 libsoup3 ...
```

### Usage

```bash
hytale-installer              # downloads/updates if online and launches
hytale-installer --check      # only checks deps/updates, does not launch
hytale-installer --no-launch  # prepares everything and exits
hytale-installer --help
```

Useful variables: `HYTALE_INSTALLER_URL`, `HYTALE_INSTALLER_MAX_RETRIES`, `HYTALE_INSTALLER_NO_LAUNCH=1`, `HYTALE_INSTALLER_OFFLINE=1`.

### Versioning

`0.1.0` — `x.0.0` = Changes with stable, tested features, `0.X.0` = Changes with major bugfixes, `0.0.X` = Changes with minimal bugfixes.

### Credits

- **Author and maintainer:** Dicov — [SrDicov](https://github.com/SrDicov) — `srdicov@gmail.com`
- **Upstream:** [Hypixel Studios — Hytale](https://hytale.com)
- **Void packaging / VUR `cnr`:** [cnr](https://github.com/Neko-Void-Linux/cnr) (thanks to the [Neko Void](https://github.com/Neko-Void-Linux) contributors)
- **Base distro:** [Void Linux](https://voidlinux.org) + `xbps-src`

### License

GPL-3.0-or-later — see [LICENSE](LICENSE) and [NOTICE](NOTICE). Full text: <https://www.gnu.org/licenses/gpl-3.0.txt>
