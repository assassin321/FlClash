<h4 align="right">
  <a href="../README.md">简体中文</a> | <strong>English</strong> | <a href="README_ru.md">Русский</a> | <a href="README_fa.md">فارسی</a> | <a href="README_ja.md">日本語</a> | <a href="README_ko.md">한국어</a>
</h4>

<h1 align="center">⚡ FlClash</h1>
<p align="center">
  <strong>Another Better Mihomo Client</strong>
</p>

**FlClash is a cross-platform network debugging and rule-based traffic splitting client powered by the Mihomo (Clash Meta) core.**

Guided by the principle of "Better Experience", FlClash inherits the original sleek UI while deeply refining key details and feature logic. Core features and design goals: silky-smooth animations in the foreground, zero-impact power saving in the background — dedicated to delivering a better experience as a lightweight Mihomo client that runs stably and reliably over the long term with minimal resource consumption.

FlClash stands for: Better Experience, Out of the box.

[![Latest Release](https://img.shields.io/github/v/release/assassin321/FlClash?style=for-the-badge&logo=github&color=238636&label=Release)](https://github.com/assassin321/FlClash/releases/latest) [![Core](https://img.shields.io/github/v/release/MetaCubeX/mihomo?style=for-the-badge&logo=go&logoColor=white&color=8A2BE2&label=Mihomo)](https://github.com/MetaCubeX/mihomo/releases/latest)
---
## 🚀 Core Features

* **Out-of-the-Box**: Robust permission handling and smooth TUN/VPN experience with optimized defaults for instant usability.
* **Meticulously Crafted**: Polished UI and interaction details. High FPS foreground animations, ultra-low mobile power consumption, and minimal desktop footprint.
* **Security First**: Core tracks the main Mihomo branch with rapid feature adoption, maintaining strict cross-platform permission checks.
* **Rock-Solid Fault Tolerance**: Edge-case optimizations for extreme multi-platform scenarios and dual config verification for enterprise-grade stability.
* **Performance Focused**: Native desktop ARM64 support, hardware tiering, and Flutter/native optimizations to maximize performance.
* **Enhanced Utilities**: Industry-first multi-platform seamless smart start/stop, Android sleep support, one-click QUIC toggle, and enhanced tray menu.
* **Visual Settings**: Rich visual configuration parameters with real-time application — no tedious manual config editing required.
* **Home Widgets**: Exquisite built-in widgets for real-time speed monitoring and system state tracking at a glance.
* **Personalized Customization**: Rich color themes, custom icons/titles, and 10 dynamic speedtest animations.
* **Custom Adaptation**: First-in-class JS script override UI adaptation with visual toggles.
* **Professional Code Editor**: Built-in refactored high-performance code-forge editor across platforms, matching IDE-level editing experience.
* **Device Compatibility**: Actively maintained Compatible builds for legacy OS versions and older hardware, extending device lifespans.
* **Zero Privacy Risk**: Fully open-source, ad-free, transparent CI/CD, and fully audited to ensure zero background telemetry.
* **Community Driven**: Community feedback is carefully evaluated, prioritizing high-quality issues to ensure your voice is heard.

---
## 🛠️ Installation & Downloads

Please visit the **[[Releases]](https://github.com/assassin321/FlClash/releases)** page to download the latest installer for your platform.


* **Cross-Platform Desktop**: 
**Windows 8.1+:** (x64/arm64)
**Linux Kernel 5.4+:** (x64/arm64)
**macOS 10.15+:** (Intel/Apple Silicon)
* **Android 8.0+:** Android (ARMv8/ ARMv7/ x86_64/ Universal) 
* **Android TV:** Fully adapted, optional ARMv7 32-bit
* **HarmonyOS NEXT:** Supported via [[ZhuoYiTong]](https://harmonyos.cool/android-app)

**Other Installation Methods:**<br>
**ArchLinux:** <code>yay -S flclash-bin or paru -S flclash-bin</code> (Maintained by [lyj404](https://github.com/lyj404/flclash-aur))<br>
**AMD64=v1:** <code>yay -S flclash-compatible-bin or paru -S flclash-compatible-bin</code> (Maintained by [VillagerTom](https://github.com/VillagerTom))

---
## ❓ Frequently Asked Questions

1.  **Installation, Startup & Security Issues**:
   - Android devices: **Ensure sufficient background permissions are granted and minimum requirements are met**: Android 8.0+
   - Legacy desktop devices: Check if your CPU architecture **requires downloading a specific CPU-level Compatible version**.
   - **Security: FlClash is fully open-source and transparent with zero telemetry. Current builds have passed SignPath security audit.**

2.  **Desktop FAQs**:
   - Windows Admin Permissions: Handled automatically during installation — **no manual re-authorization required**.
   - Unable to enable TUN mode: macOS and Linux users **must enter the correct password to grant network permissions**.
   - Other errors: Provide debug logs and **ensure no conflicting proxy software or services are running**.
   - If issues persist, please submit a GitHub Issue.

3.  **macOS Installation Notes**:
   - Download the appropriate `.dmg` file for your architecture (Intel / Apple Silicon) and double-click to open.
   - Drag the FlClash icon into the `Applications` folder.
   - **Bypassing system security checks during installation or updates** ([as Apple Developer Certificate is not currently purchased](https://support.apple.com/en-us/102445)):
     - **Recommended**: Open `Applications`, **right-click the FlClash icon**, select **"Open"**, and click **"Open"** again in the confirmation prompt.
     - **Alternative**: If blocked, go to System Settings -> Privacy & Security, scroll to find FlClash, and click **"Open Anyway"**.
   - Upon enabling TUN mode for the first time, enter the password of the currently logged-in user when prompted to allow FlClash to configure the network.

4.  **Unable to Import Subscription Links**:
   - **Always try resetting the subscription link first** to ensure it is valid before importing.
   - If issues persist, please contact your service provider first. If it is caused by the app, feel free to submit a GitHub Issue.

---

## 💻 Build & UI Customization

Building on Windows:

* Requires a Windows PC (OS ≥ Windows 10)
* Dependencies: Git, Visual Studio, Flutter 3.44.x, Golang, Inno Setup, Rust
```bash
* flutter pub get
* dart .\setup.dart windows --arch amd64 --out core (Build Core only)
* dart .\setup.dart windows --arch amd64 --out app --compatible (Optional Compatible build)
* Output binaries are located in the `dist/` directory
```

Custom Script UI Adaptation:

* Starting from v1.18.8, FlClash supports external override scripts for UI adaptation. Taking AIsouler's **[Script/Config Repository](https://github.com/AIsouler/MyClash)** as an example, simply add the following declaration on the first line of your script to enable FlClash built-in visual toggles:
* <code>const Compatible_With_FlClash = { ruleOptionsEnable: true };</code>

---

## 🙏 Acknowledgments

**[Bettbox GUI](https://github.com/appshubcc/Bettbox)** 〢**[FlClash GUI](https://github.com/chen08209/FlClash)** 〢 **[Mihomo Core](https://github.com/MetaCubeX/mihomo)**

Special thanks to all Contributors and open-source projects used or referenced:

[Zashboard](https://github.com/Zephyruso/zashboard), [CMFA](https://github.com/MetaCubeX/ClashMetaForAndroid), [Sparkle](https://github.com/xishang0128/sparkle), [SFA](https://github.com/SagerNet/sing-box-for-android), [HUSI](https://github.com/xchacha20-poly1305/husi), [V2rayN](https://github.com/2dust/v2rayN)

---

## 📄 License

GPL-3.0 License
