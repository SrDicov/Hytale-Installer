# Hytale Installer

> **Wrapper libre (GPL-3.0-or-later) que descarga, actualiza y lanza el launcher oficial de Hytale** — sin `sudo`, sin redistribuir binarios propietarios.

<p align="center">
  <img src="icons/256x256/apps/hytale-installer.png" width="128" alt="Hytale H logo">
</p>

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Void Linux](https://img.shields.io/badge/Void-xbps-478061.svg)](https://voidlinux.org)
[![Hytale](https://img.shields.io/badge/Hytale-launcher-0f3460.svg)](https://hytale.com)

**[Español](#español) · [English](#english)**

---

### Español

#### ¿Qué hace?

`hytale-installer` es un script **100% libre (GPL-3)** que:

1. Verifica que tengas las librerías del launcher (GTK3, webkit2gtk-4.1, libsoup3…) y **te avisa** con el comando nativo de tu distro si falta algo — **jamás usa `sudo`**.
2. Descarga el launcher oficial desde la **URL pública de Hypixel Studios**:
   `https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.zip`
3. Lo actualiza automáticamente en cada ejecución con internet (ETag / versión embebida) y guarda el binario en tu carpeta personal `~/.local/share/hytale-installer/` — **cero necesidad de root**.
4. Si no hay internet, abre el binario local sin quejarse. Si es el primer arranque y falla la descarga, **reintenta hasta lograrlo**.

Así evitas meter binarios propietarios en repos públicos.

#### Instalación

**Void Linux (VUR `cnr`) — recomendado:**
```bash
vary -S hytale-installer
# o manualmente:
# xbps-install -S hytale-installer
```

**Manual (cualquier distro con bash/curl/unzip):**
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

#### Uso

```bash
hytale-installer              # descarga/actualiza si hay internet y lanza
hytale-installer --check      # solo verifica deps/updates, no lanza
hytale-installer --no-launch  # prepara todo y sale
hytale-installer --help
```

Variables útiles: `HYTALE_INSTALLER_URL`, `HYTALE_INSTALLER_MAX_RETRIES`, `HYTALE_INSTALLER_NO_LAUNCH=1`, `HYTALE_INSTALLER_OFFLINE=1`.

#### Versionado

`0.1.0` — `0` = estable 100% probado, `0.X.0` = usable con features nuevos, `0.0.X` = bugfixes mínimos.

---

### English

**Hytale Installer** is a free (GPL-3.0-or-later) wrapper that downloads, keeps updated and launches the official Hytale launcher from the public Hypixel Studios URL, without ever using `sudo` and without bundling proprietary binaries in public repositories. Same usage as above.

---

### Aviso legal / Legal

- **Hytale**, su logo, el launcher binario y `hytale.com` / `launcher.hytale.com` son propiedad intelectual privada de **Hypixel Studios**. Este proyecto **NO** redistribuye ni reclama titularidad. El binario se descarga en tiempo de ejecución por cada usuario desde la URL pública oficial.
- El icono `icons/*` es la **"H" oficial de Hytale** incluida solo con fines de identificación (uso nominativo). Todos los derechos pertenecen a Hypixel Studios.
- El **script, el `.desktop` y la documentación** son obra original de **Dicov (SrDicov)** y se distribuyen bajo **GPL-3.0-or-later**.

### Créditos

- **Autor y mantenedor:** Dicov — [SrDicov](https://github.com/SrDicov) — `srdicov@gmail.com`
- **Upstream:** [Hypixel Studios — Hytale](https://hytale.com)
- **Packaging Void / VUR `cnr`:** [Neko Void Linux](https://github.com/Neko-Void-Linux/cnr) (gracias a JavierCplus y colaboradores)
- **Distro base:** [Void Linux](https://voidlinux.org) + `xbps-src`

### Licencia

GPL-3.0-or-later — ver [LICENSE](LICENSE) y [NOTICE](NOTICE). Texto completo: <https://www.gnu.org/licenses/gpl-3.0.txt>
