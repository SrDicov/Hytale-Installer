# Changelog

Todas las notas en <https://github.com/SrDicov/Hytale-Installer/releases>.

## [0.1.0] - 2026-08-25
- Inicial: wrapper GPL-3, auto-update con ETag + versión embebida, fallback offline.
- Soporte multi-distro (Void/Debian/Fedora/Arch/openSUSE) con aviso de deps por gestor nativo.
- Empaquetado Void `hytale-installer` (VUR cnr) con icono oficial "H" y entrada de escritorio `Name=Hytale`.

## [0.1.1] - 2026-08-25
- feat: `hytale-installer --purge` per-usuario y `post_remove` del paquete que borra TODO en desinstalación (wrapper + `~/.local/share/Hytale` etc., GBs).

## [0.1.2] - 2026-08-25
- fix: purge también limpia ~/.cache/hytale-launcher legacy.

## [0.1.3] - 2026-10-12
- fix: upstream antepone cabecera `HYTALE-UPDATE` (1885 B) al zip; se recorta antes de validar (antes todo fresh-download fallaba `unzip -t`).
- fix: `If-None-Match` solo si hay zip en caché + ETag se guarda tras validar; elimina el loop 304 infinito en primer arranque.
- fix: la rama de descarga fallida ahora avisa el HTTP code en vez de reintentar en silencio.
