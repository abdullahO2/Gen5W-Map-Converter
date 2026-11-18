# Changelog

All notable changes to the Gen5W Map Converter project are documented here.

## [v5.3] - 2026-11-18
### Fixed
- **"Map cannot be displayed" after installing a map of another region** (nav log: `NaviApp[..._DBLoadFail], NaviMap[]`, "Map or config folder is not exist"). The navigation app derives its nation from `ro.product.locale.region` (US `NAM`, ME `MES`) and only reads that region's map folders. The updater now checks the package region (from `<REGION>.xx.xx...md5`) against that and aborts, changing nothing, on a mismatch. Create an empty `FORCE_REGION` file on the USB to override. Note: on some units (e.g. `cn7n_us`) `/system/onebin/<ro.mobis.onebindir>/mobis.prop` overrides the region in `/system/build.prop` at boot, so Gen5W_AR's `arabic.full` alone leaves the region at `US`.
- The updater no longer wipes the **active** map slot. It installs into the inactive A/B slot (`/storage/navi` <-> `/storage/navi2`) and only flips `/oem_data/map_index.cfg` after the copy is verified, so the previous working map stays available as a fallback (rollback: write the old slot number into `map_index.cfg`).
- Undefined `REGION_NAME` in log/toast messages is now set from the package region.

## [v5.2] - 2026-11-18
### Added
- **Universal Region Support**: Automatically detects and installs navigation map packages of any target region (Middle East, USA, Europe, Russia, Australia, Korea, etc.).
- Dynamic region code detection from `DATA/NATION/*` with customized log outputs and on-screen toast notifications.
- Generalized USB output package folder (`Gen5W_Map_USB_Ready`).
- Complete documentation on region matching and download methods (Official Navigation Updater & `nudl`).

## [v5.1] - 2026-11-18
### Added
- Bilingual popup dialogs (Arabic and English) for compatibility across languages.
- Automatic A/B dual-slot partition detection and switching (`map_index.cfg` set to slot 0) ensuring immediate map recognition without manual ADB intervention.
- Immediate slot switching for previously installed maps to repair slot-mismatched units instantly.

### Fixed
- Fixed `tar` timestamp restoration failure (`Can't restore time: Invalid argument`) on FAT32/exFAT drives by enforcing `-m` (ignore archive modification times).
- Enhanced archive extraction verification to prevent false errors from non-critical warnings.

## [v5.0] - 2026-11-14
### Added
- Standalone execution via NEMESIS USB autorun trigger (`NEMESIS.data`).
- Eliminated external Python or compiler dependencies for USB generation; pure Windows batch script.
- Live progress and detailed logging directly to USB root (`map_update.log`).
- Auto-resume and safety checks for vehicle power loss during installation.

## [v1.0 - v4.0] - Initial Development
- Initial manual conversion research via ADB debugging.
- Package packaging experiments and direct script execution prototypes.
