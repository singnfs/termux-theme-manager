#!/bin/bash
# ============================================================
#   SINGOS THEME MANAGER — Installer
#   Jalankan dengan:
#   bash <(curl -fsSL https://raw.githubusercontent.com/singnfs/termux-theme-manager/main/install.sh)
# ============================================================

R="\e[1;31m"
G="\e[1;32m"
Y="\e[1;33m"
C="\e[1;36m"
W="\e[1;37m"
RS="\e[0m"

REPO="https://github.com/singnfs/termux-theme-manager"
RAW="https://raw.githubusercontent.com/singnfs/termux-theme-manager/main"
INSTALL_DIR="$HOME/.singos"

clear
echo ""
echo -e "${C}  ╔══════════════════════════════════════════════╗${RS}"
echo -e "${C}  ║${Y}       SINGOS THEME MANAGER — INSTALLER       ${C}║${RS}"
echo -e "${C}  ╚══════════════════════════════════════════════╝${RS}"
echo ""

# Cek dan install dependencies
echo -e "${Y}  ➜  Mengecek dependencies...${RS}"
if ! command -v git &>/dev/null; then
    echo -e "${Y}  ➜  Git belum terinstall, menginstall git...${RS}"
    pkg update -y &>/dev/null
    pkg install git -y &>/dev/null
    sleep 2
fi

# Clone atau update repo
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${Y}  ➜  Singos sudah terinstall, melakukan update...${RS}"
    cd "$INSTALL_DIR"
    git pull --quiet 2>/dev/null || {
        echo -e "${R}  ✘  Gagal update, mencoba clone ulang...${RS}"
        cd "$HOME"
        rm -rf "$INSTALL_DIR"
        git clone --quiet "$REPO" "$INSTALL_DIR"
    }
else
    echo -e "${Y}  ➜  Mengunduh SingOS Theme Manager...${RS}"
    git clone --quiet "$REPO" "$INSTALL_DIR"
fi

# Set permission
chmod +x "$INSTALL_DIR/singos.sh"
chmod +x "$INSTALL_DIR/modules/"*.sh

# Buat symlink ke PATH
if [ -d "$HOME/../usr/bin" ]; then
    ln -sf "$INSTALL_DIR/singos.sh" "$HOME/../usr/bin/singos"
    echo -e "${G}  ✔  Berhasil! Jalankan dengan perintah: ${W}singos${RS}"
else
    echo -e "${G}  ✔  Berhasil! Jalankan dengan: ${W}bash $INSTALL_DIR/singos.sh${RS}"
fi

echo ""
echo -e "${C}  ➜  Memulai SingOS Theme Manager...${RS}"
echo ""
sleep 2

bash "$INSTALL_DIR/singos.sh"
