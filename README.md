# 🎨 SingOS Theme Manager

![Version](https://img.shields.io/badge/version-2.0-blue)
![Termux](https://img.shields.io/badge/Termux-Android-orange)
![License](https://img.shields.io/badge/license-MIT-green)

> Kustomisasi Termux ala SingOS — cepat, bersih, dan modular.

---

## 🛠️ Instalasi

```bash
git clone https://github.com/singnfs/termux-theme-manager
cd termux-theme-manager
chmod +x singos.sh
bash singos.sh
```

---

## 📋 Fitur

| No | Fitur | Keterangan |
|:--:|:------|:-----------|
| 1  | **Basic Setup** | Update pkg + install git, curl, wget, figlet, ncurses |
| 2  | **Install ZSH** | Install ZSH + Oh My Zsh |
| 3  | **ZSH Plugins** | Syntax highlighting + autosuggestions |
| 4  | **Banner & Prompt** | ASCII banner SingOS + custom prompt icon Android |
| 5  | **Neofetch** | Install neofetch untuk tampilan spek device |
| 6  | **Uninstall** | Uninstall tema & reset Termux ke kondisi awal |

---

## 📁 Struktur Repo

```text
termux-theme-manager/
├── modules/
│   ├── banner.sh          ← Opsi 4: Banner & prompt
│   ├── basic_setup.sh     ← Opsi 1: Basic setup
│   ├── colors.sh          ← Warna ANSI & fungsi utilitas
│   ├── menu.sh            ← Header ASCII & tampilan menu
│   ├── neofetch.sh        ← Opsi 5: Neofetch
│   ├── plugins.sh         ← Opsi 3: ZSH plugins
│   ├── uninstall.sh       ← Opsi 6: Uninstall & Reset
│   └── zsh.sh             ← Opsi 2: Install ZSH
├── install.sh             ← Script instalasi otomatis (helper)
├── README.md              ← Dokumentasi ini
└── singos.sh              ← Entry point utama script
```

---

## 🔄 Update

Untuk memperbarui ke versi terbaru, jalankan perintah berikut di dalam folder repository:

```bash
cd termux-theme-manager && git pull
```

---

## 📱 Requirements

- **Termux** (Android)
- Koneksi internet aktif saat proses instalasi pertama kali

---

## 📄 License

Proyek ini dilisensikan di bawah **MIT License** - © SingOS.  
Bebas untuk dimodifikasi, didistribusikan, dan digunakan untuk keperluan pribadi maupun komunitas.
