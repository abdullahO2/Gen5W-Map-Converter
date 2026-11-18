# Gen5W Middle East Map Converter (NEMESIS Edition)

A standalone tool to install Middle East (MES) offline maps on imported Hyundai, Kia, and Genesis vehicles equipped with the Gen5W (Standard-class Gen5 Navigation) infotainment system.

---

## Features

- **No Coding or ADB Required**: Runs entirely from an automated USB drive via the NEMESIS autorun mechanism.
- **Pure Windows Script**: `Build_Nemesis_USB.bat` uses only built-in Windows commands (`tar.exe`, `certutil`, PowerShell dialogs). No external dependencies.
- **A/B Dual-Slot Handling**: Automatically detects the active partition slot via `/oem_data/map_index.cfg` and aligns the system to load the newly installed maps.
- **Cross-Filesystem Compatibility**: Works on FAT32 and exFAT formatted USB drives.
- **Fail-Safe & Resilient**: Real-time logging to `map_update.log` on the USB drive, with auto-resume logic if the vehicle is turned off mid-process.
- **Bilingual Interface**: Windows prompts and alerts in Arabic and English.

---

## Prerequisites

1. **Target Vehicle**:
   - Hyundai / Kia / Genesis with a Gen5W head unit (e.g. Palisade, Tucson NX4, Sonata DN8, GV70/GV80, etc.).
   - NEMESIS sideloading environment installed on the head unit.
2. **Region Configuration**:
   - Navigation maps require the head unit region to match the map region. For Middle East maps (`MES`), the system region must be `ME`.
   - If your imported vehicle is still on its original region (e.g., Korean `KR` or North American `USA`), you must convert the unit's region first. A complete package to convert Gen5W units to the Middle East region with Arabic language support is available here:
     👉 **[Gen5W_AR by abdullahO2](https://github.com/abdullahO2/Gen5W_AR)**
3. **USB Flash Drive**:
   - At least 16 GB capacity, formatted as FAT32 or exFAT.
4. **Official Map Files**:
   - Downloaded Middle East map update folder containing `sw_backup.tar` and `navi_backup.tar*` (see below for download methods).

---

## How to Obtain Map Files

### Method 1: Official Navigation Updater (Recommended)
- **Hyundai**: [update.hyundai.com](https://update.hyundai.com)
- **Kia**: [update.kia.com](https://update.kia.com)

Download the official updater software for Windows, select your vehicle model (Middle East region), and download the update files.

> [!NOTE]
> If your vehicle was originally from domestic regions like South Korea, the official updater may restrict access from outside the region. To bypass this:
> - Use a South Korean VPN during download.
> - Or use **Method 2** below without requiring a VPN.

### Method 2: Via `nudl` Downloader (Fast Alternative for Imported Vehicles)
1. On your vehicle screen, check your current firmware / model string from: `⚙️ General Settings > SW Info`.
2. Download the `nudl` tool for Windows:
   - GitHub Releases: [chenxiaolong/nudl](https://github.com/chenxiaolong/nudl/releases)
   - Direct Windows Download: [nudl-1.3.0-x86_64-pc-windows-msvc.zip](https://github.com/chenxiaolong/nudl/releases/download/v1.3.0/nudl-1.3.0-x86_64-pc-windows-msvc.zip)
3. Use `nudl` to fetch the Middle East firmware package directly.

---

## Quick Start Guide

### 1. Preparing the USB (PC)
1. Place `Build_Nemesis_USB.bat` inside the folder containing your downloaded Middle East update files (or on the root of your USB drive alongside the map files).
2. Double-click `Build_Nemesis_USB.bat` to run.
3. The script will:
   - Verify available free space.
   - Extract and verify the navigation data.
   - Generate the automated updater script (`update.sh`).
   - Create the authorized NEMESIS execution trigger (`NEMESIS.data`).
4. Copy the contents of the generated `Gen5W_ME_USB_Ready` folder to the root of your USB drive.

### 2. Flashing the Vehicle
1. Start the vehicle engine (keep engine running throughout the process).
2. Insert the prepared USB drive into the multimedia USB port.
3. NEMESIS will automatically detect the USB trigger and start the installation in the background.
4. Monitor the process by opening the file `map_update.log` on the USB drive if needed.
5. Once completed, the navigation service restarts automatically and loads the Middle East maps.
6. Remove the USB drive.

---

## دليل الاستخدام السريع (باللغة العربية)

> [!IMPORTANT]
> **تنبيه هام حول منطقة النظام (Region):**
> تعمل الخرائط بحسب منطقة النظام المحددة في الشاشة؛ فمثلاً خرائط الشرق الأوسط تتطلب أن تكون منطقة الشاشة محددة على الشرق الأوسط (`ME`). إذا كانت سيارتك مستوردة وما زالت على منطقتها الأصلية (مثل كوريا `KR` أو أمريكا `USA`)، فيجب تحويل منطقة الشاشة أولاً لتفعيل الخرائط واللغة العربية.
> تتوفر حزمة متكاملة للتحويل للشرق الأوسط والتعريب هنا:
> 👉 **[مستودع Gen5W_AR بواسطة abdullahO2](https://github.com/abdullahO2/Gen5W_AR)**

### طرق الحصول على ملفات الخرائط:

#### الطريقة الأولى: عبر المواقع والبرامج الرسمية (الأسهل والأضمن)
• **لهيونداي**: [update.hyundai.com](https://update.hyundai.com)  
• **لكيا**: [update.kia.com](https://update.kia.com)  
حمّل برنامج التحديث الرسمي للكمبيوتر، واختر موديل سيارتك وسيقوم بالتحميل تلقائياً.

> [!NOTE]
> **ملاحظة للسيارات من مناطق معينة مثل كوريا:**  
> عند محاولة تحديد المنطقة (Korea) وأنت خارجها سيرفض البرنامج، ولن يسمح لك الموقع بالتحميل لتلك المنطقة، ولتجاوز ذلك:  
> • استخدم برنامج VPN بدولة كوريا الجنوبية أثناء التحميل.  
> • أو انتقل إلى **الطريقة الثانية** مباشرة دون الحاجة لـ VPN.

#### الطريقة الثانية: عبر أداة `nudl` (الأفضل للسيارات المستوردة والبديل الأسرع)
1. اذهب لشاشة سيارتك واعرف رقم الإصدار الحالي والموديل من: `⚙️ General Settings > SW Info`.
2. حمّل أداة `nudl` من الرابط التالي:  
   🔗 [chenxiaolong/nudl Releases](https://github.com/chenxiaolong/nudl/releases)  
   رابط مباشر لنسخة ويندوز الحالية: [nudl-1.3.0-x86_64-pc-windows-msvc.zip](https://github.com/chenxiaolong/nudl/releases/download/v1.3.0/nudl-1.3.0-x86_64-pc-windows-msvc.zip)
3. قم بتشغيل الأداة وتحميل ملفات تحديث الشرق الأوسط المناسبة لسيارتك.

---

### الخطوة الأولى: تجهيز الفلاشة على الكمبيوتر
1. ضع ملف `Build_Nemesis_USB.bat` في المجلد الذي يحتوي على ملفات خرائط الشرق الأوسط المحملة رسمياً (`sw_backup.tar` وملفات `navi_backup.tar`).
2. شغّل السكربت `Build_Nemesis_USB.bat`.
3. سيقوم السكربت تلقائياً باستخراج الخرائط وتجهيز ملف التشغيل الآلي `update.sh` ومفتاح التفعيل `NEMESIS.data`.
4. انسخ محتويات المجلد الناتج `Gen5W_ME_USB_Ready` إلى المسار الرئيسي للفلاش ميموري (Root).

### الخطوة الثانية: التثبيت في السيارة
1. شغّل محرك السيارة واجعله يعمل طوال فترة التثبيت.
2. ضع الفلاش ميموري في منفذ الـ USB المخصص للوسائط في السيارة.
3. ستبدأ عملية التثبيت تلقائياً في الخلفية بواسطة NEMESIS.
4. يمكنك متابعة تقدم النسخ عبر مراجعة ملف السجل `map_update.log` الموجود في الفلاشة.
5. بعد انتهاء العملية، سيتم إعادة تشغيل تطبيق الخرائط تلقائياً وتفعيل خرائط الشرق الأوسط بنجاح.
6. انزع الفلاش ميموري من السيارة.

---

## Technical Details

- **Target Path**: Installs map database under `/storage/navi/navi/DATA/NATION/MES`.
- **Partition Sync**: Writes `0` to `/oem_data/map_index.cfg` to ensure the navigation engine binds to partition slot 0 (`/storage/navi`).
- **Permissions**: Enforces `0777` permissions and clears the navigation package cache (`pm clear com.mnsoft.navi`) upon finalization.

---

## Credits & Acknowledgments

- **NEMESIS Platform**: Thanks to the developers of the NEMESIS automotive platform.
- **Community Research**: Special thanks to @helloyunho for initial ADB exploration and insights into the Gen5W partition structure.

---

## Disclaimer

This project is for educational and personal use only. Use at your own discretion. Ensure the vehicle battery/engine is maintained during the flashing procedure.
