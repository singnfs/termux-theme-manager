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
|----|-------|------------|
| 1  | Basic Setup | Update pkg + install git, curl, wget, figlet, ncurses |
| 2  | Install ZSH | Install ZSH + Oh My Zsh |
| 3  | ZSH Plugins | Syntax highlighting + autosuggestions |
| 4  | Banner & Prompt | ASCII banner SingOS + custom prompt icon Android |
| 5  | Neofetch | Install neofetch untuk tampilan spek device |

---

## 📁 Struktur Repo

```
termux-theme-manager/
├── singos.sh               ← Entry point utama
├── modules/
│   ├── colors.sh           ← Warna ANSI & fungsi utilitas
│   ├── menu.sh             ← Header ASCII & tampilan menu
│   ├── basic_setup.sh      ← Opsi 1: Basic setup
│   ├── zsh.sh              ← Opsi 2: Install ZSH
│   ├── plugins.sh          ← Opsi 3: ZSH plugins
│   ├── banner.sh           ← Opsi 4: Banner & prompt
│   └── neofetch.sh         ← Opsi 5: Neofetch
└── README.md
```

---

## 🔄 Update

```bash
cd termux-theme-manager && git pull
```

---

## 📱 Requirements

- Termux (Android)
- Koneksi internet saat pertama install

---

## 📄 License

MIT © SingOS
