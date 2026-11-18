# Gen5W Cross-Region Map Converter & Updater (NEMESIS Edition)

A universal, automated tool to install offline navigation maps of **ANY region** (Middle East, North America/USA, Europe, Russia, Australia, Korea, etc.) on imported Hyundai, Kia, and Genesis vehicles equipped with the Gen5W (Standard-class Gen5 Navigation) infotainment system.

---

## Features

- **Universal Region Support**: Automatically detects and packages navigation map data from **any** official Hyundai, Kia, or Genesis Gen5W update.
- **No Coding or In-Car ADB Required**: Runs entirely from an automated USB flash drive via the NEMESIS autorun mechanism.
- **Pure Windows Script**: `Build_Nemesis_USB.bat` uses only built-in Windows commands (`tar.exe`, `certutil`, PowerShell dialogs). Zero external dependencies.
- **A/B Dual-Slot Handling**: Automatically detects the active partition slot via `/oem_data/map_index.cfg` and aligns the system to load the newly installed maps from slot 0.
- **Cross-Filesystem Compatibility**: Works seamlessly on FAT32 and exFAT formatted USB drives.
- **Fail-Safe & Resilient**: Real-time logging to `map_update.log` on the USB drive, with auto-resume logic if the vehicle is turned off mid-process.
- **Bilingual Interface**: Windows prompts and alerts in both Arabic and English.

---

## Understanding Region Matching

In Mobis Gen5W infotainment systems, navigation data is organized under `/storage/navi/DATA/NATION/<REGION_CODE>`:
- `MES`: Middle East
- `USA`: North America (USA / Canada)
- `EUR`: Europe
- `RUS`: Russia
- `AUS`: Australia & New Zealand
- `KOR`: South Korea

> [!IMPORTANT]
> **System Region Requirement:**
> The head unit's system region must match the target map region code (e.g. system region `ME` for Middle East maps `MES`, `USA` for North American maps, etc.). If your vehicle is imported and still set to its original domestic region (e.g., Korean `KR`), you must convert the system region first.
> 
> *For converting Gen5W systems to the Middle East region (`ME`) with full Arabic language support, use:*  
> 👉 **[Gen5W_AR by abdullahO2](https://github.com/abdullahO2/Gen5W_AR)**

---

## How to Obtain Map Files (Any Region)

You will need official map update files containing `sw_backup.tar` and `navi_backup.tar1` for your target vehicle and region.

### Method 1: Official Navigation Updater (Recommended)
- **Hyundai**: [update.hyundai.com](https://update.hyundai.com)
- **Kia**: [update.kia.com](https://update.kia.com)

1. Download and install the official updater for your PC.
2. Select your target region and vehicle model, then download the update files.

> [!NOTE]
> If downloading for domestic regions like South Korea while located outside Korea, the official updater may block access. You can bypass this using a South Korean VPN, or use **Method 2** below.

### Method 2: Via `nudl` Downloader (Fast Alternative for Any Region)
`nudl` is a high-speed CLI downloader for Hyundai/Kia firmware and map updates that bypasses regional geo-blocks:
1. On your vehicle screen, note your current model and software version from: `⚙️ General Settings > SW Info`.
2. Download `nudl` for Windows:
   - GitHub Releases: [chenxiaolong/nudl](https://github.com/chenxiaolong/nudl/releases)
   - Direct Windows Download: [nudl-1.3.0-x86_64-pc-windows-msvc.zip](https://github.com/chenxiaolong/nudl/releases/download/v1.3.0/nudl-1.3.0-x86_64-pc-windows-msvc.zip)
3. Run `nudl` to download the desired regional update package directly to your PC.

---

## Quick Start Guide

### 1. Preparing the USB (PC)
1. Place `Build_Nemesis_USB.bat` inside the folder containing your downloaded update files (or on the root of your USB drive alongside `sw_backup.tar` and `navi_backup.tar1`).
2. Double-click `Build_Nemesis_USB.bat` to run.
3. The script will:
   - Verify available free disk space.
   - Extract and verify the navigation data.
   - Generate the automated updater script (`update.sh`).
   - Create the authorized NEMESIS execution trigger (`NEMESIS.data`).
4. Copy the contents of the generated `Gen5W_Map_USB_Ready` folder to the root of your USB drive.

### 2. Flashing the Vehicle
1. Start the vehicle engine (keep the engine running throughout the process).
2. Insert the prepared USB drive into the multimedia USB port.
3. When prompted on screen: *"Execute Gen5W Map Updater?"*, select **Yes**.
4. Installation will proceed automatically in the background (takes approx. 3 to 5 minutes).
5. You can monitor progress by opening `map_update.log` on the USB drive.
6. Once completed, the navigation service restarts automatically and loads the new regional maps.
7. Unplug the USB drive.

---

## دليل الاستخدام السريع (باللغة العربية)

أداة شاملة ومستقلة لتثبيت وتحويل خرائط الملاحة **لأي منطقة في العالم** (الشرق الأوسط، أمريكا، أوروبا، روسيا، أستراليا، كوريا، إلخ) على سيارات هيونداي وكيا وجينيسيس المزودة بنظام Gen5W.

> [!IMPORTANT]
> **تنبيه هام حول منطقة النظام (Region):**
> تعمل الخرائط في نظام Gen5W بحسب منطقة النظام المحددة في الشاشة؛ فمثلاً خرائط الشرق الأوسط (`MES`) تتطلب أن تكون منطقة الشاشة محددة على الشرق الأوسط (`ME`)، وخرائط أمريكا تتطلب منطقة (`USA`). إذا كانت سيارتك مستوردة وما زالت على منطقتها الأصلية (مثل كوريا `KR`)، فيجب تحويل منطقة الشاشة أولاً لتتوافق مع الخريطة المراد تثبيتها.
> 
> *للتحويل إلى منطقة الشرق الأوسط وتفعيل اللغة العربية:*  
> 👉 **[مستودع Gen5W_AR بواسطة abdullahO2](https://github.com/abdullahO2/Gen5W_AR)**

### طرق الحصول على ملفات الخرائط لأي منطقة:

#### الطريقة الأولى: عبر المواقع والبرامج الرسمية (الأسهل والأضمن)
• **لهيونداي**: [update.hyundai.com](https://update.hyundai.com)  
• **لكيا**: [update.kia.com](https://update.kia.com)  
حمّل برنامج التحديث الرسمي للكمبيوتر، واختر المنطقة المستهدفة وموديل سيارتك وسيقوم بالتحميل تلقائياً.

> [!NOTE]
> عند محاولة تحميل خرائط لمناطق معينة (مثل كوريا) من خارجها، قد يرفض البرنامج؛ ولتجاوز ذلك استخدم VPN أو انتقل إلى الطريقة الثانية مباشرة.

#### الطريقة الثانية: عبر أداة `nudl` (البديل الأسرع والأفضل للسيارات المستوردة)
1. من شاشة سيارتك، اعرف رقم الموديل والإصدار الحالي من: `⚙️ General Settings > SW Info`.
2. حمّل أداة `nudl` من الرابط التالي:  
   🔗 [chenxiaolong/nudl Releases](https://github.com/chenxiaolong/nudl/releases)  
   رابط مباشر لنسخة ويندوز: [nudl-1.3.0-x86_64-pc-windows-msvc.zip](https://github.com/chenxiaolong/nudl/releases/download/v1.3.0/nudl-1.3.0-x86_64-pc-windows-msvc.zip)
3. شغّل الأداة وحمّل حزمة التحديث الخاصة بالمنطقة المطلوبة لسيارتك.

---

### خطوات التجهيز والتثبيت:

#### 1. على الكمبيوتر:
1. ضع ملف `Build_Nemesis_USB.bat` في المجلد الذي يحتوي على ملفات التحديث المحملة (`sw_backup.tar` و `navi_backup.tar1`).
2. شغّل السكربت `Build_Nemesis_USB.bat`.
3. سيقوم السكربت تلقائياً باستخراج الخرائط وتجهيز ملف التشغيل الآلي `update.sh` ومفتاح التفعيل `NEMESIS.data`.
4. انسخ محتويات المجلد الناتج `Gen5W_Map_USB_Ready` إلى المسار الرئيسي للفلاش ميموري (Root).

#### 2. في السيارة:
1. شغّل محرك السيارة واجعله يعمل طوال فترة التثبيت.
2. ضع الفلاش ميموري في منفذ الـ USB المخصص للوسائط في السيارة.
3. ستظهر رسالة: *"Execute Gen5W Map Updater?"*، اضغط **Yes**.
4. ستبدأ عملية التثبيت تلقائياً في الخلفية بواسطة NEMESIS (تستغرق من 3 إلى 5 دقائق).
5. يمكنك متابعة تقدم النسخ عبر مراجعة ملف السجل `map_update.log` الموجود في الفلاشة.
6. بعد انتهاء العملية، سيتم إعادة تشغيل تطبيق الخرائط تلقائياً وتفعيل الخرائط الجديدة بنجاح.
7. انزع الفلاش ميموري من السيارة.

---

## Technical Details

- **Target Path**: Installs map database under `/storage/navi/DATA/NATION/<REGION_CODE>`.
- **Partition Sync**: Installs into the *inactive* A/B slot (`/storage/navi` = 0, `/storage/navi2` = 1) and only then sets `/oem_data/map_index.cfg` to that slot. The previously active map is left untouched as a fallback; to roll back, write the old slot number into `map_index.cfg` and reboot.
- **Region Guard**: The package region (prefix of `<REGION>.xx...md5`) must match the region the unit reads, taken from `ro.product.locale.region` (`US`/`CA` = `NAM`, `ME` = `MES`; other values fall back to the maps already installed). A US `NAM` unit cannot use a `MES` map: the app reports `DBLoadFail` / "map cannot be displayed". On mismatch nothing is changed; put an empty `FORCE_REGION` file on the USB to override.
- **Middle East note**: Some units re-apply `ro.product.locale.region` at boot from `/system/onebin/<ro.mobis.onebindir>/mobis.prop` (e.g. `cn7n_us`), overriding `/system/build.prop`. For MES maps the region must be `ME` in both files (`getprop ro.product.locale.region` must print `ME` after reboot).
- **Permissions**: Enforces `0777` permissions and clears the navigation package cache (`pm clear com.mnsoft.navi`) upon finalization.

---

## Credits & Acknowledgments

- **NEMESIS Platform**: Thanks to the developers of the NEMESIS automotive platform.
- **Community Research**: Special thanks to @helloyunho for initial ADB exploration and insights into the Gen5W partition structure.

---

## Disclaimer

This project is for educational and personal use only. Use at your own discretion. Ensure the vehicle battery/engine is maintained during the flashing procedure.
