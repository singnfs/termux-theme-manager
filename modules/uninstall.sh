#!/bin/bash
# ============================================================
#   AndroRice / SingOS — Terminal Uninstaller & Reset Tool
#   Created by: @singnfs (v1.0 Pro)
# ============================================================

# --- TEMA WARNA ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RS='\033[0m'

show_header_uninstall() {
    clear
    echo -e "${RED}  ┌────────────────────────────────────────┐${RS}"
    echo -e "${RED}  │   🗑️  Terminal Reset & Uninstaller     │${RS}"
    echo -e "${RED}  │   •_• Restore Termux to Factory State  │${RS}"
    echo -e "${RED}  └────────────────────────────────────────┘${RS}"
    echo -e "${BLUE}  [ Creator: @singnfs ]  [ Status: Uninstaller Pro ]${RS}"
    echo -e "  ----------------------------------------"
    echo ""
}

spinner_uninstall() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    tput civis # Sembunyikan kursor
    while [ "$(ps -p $pid -o state= 2>/dev/null)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  %s" "$spinstr" "$2"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\r"
    done
    tput cnorm # Munculkan kursor lagi
    echo -e " [${GREEN}✓${RS}] $2 ${GREEN}Selesai!${RS}"
}

action_uninstall() {
    show_header_uninstall
    
    echo -e "${YELLOW}[!] Memulai pembersihan total...${RS}\n"
    sleep 1

    # 1. Hapus konfigurasi visual Termux (Tema, Font, Kursor, Keys)
    (rm -f "$HOME/.termux/colors.properties" "$HOME/.termux/font.ttf" "$HOME/.termux/termux.properties") &>/dev/null &
    spinner_uninstall $! "Menghapus konfigurasi tema, font, dan extra-keys"

    # 2. Babat Oh-My-Zsh & plugins jika ada, lalu balikin shell ke Bash bawaan
    if [ -d "$HOME/.oh-my-zsh" ] || [ -f "$HOME/.zshrc" ]; then
        (
            rm -rf "$HOME/.oh-my-zsh"
            rm -f "$HOME/.zshrc"
            chsh -s bash
        ) &>/dev/null &
        spinner_uninstall $! "Menghapus Oh-My-Zsh & mengembalikan shell ke Bash"
    fi

    # 3. Reload settings secara realtime biar langsung polos instan
    (termux-reload-settings) &>/dev/null &
    spinner_uninstall $! "Menerapkan setelan pabrik Termux"

    # --- FINISHING ---
    echo -e "\n========================================"
    echo -e "${GREEN}[✓] UNINSTALL BERHASIL TOTAL BLAY!${RS}"
    echo -e "========================================"
    echo -e "${WHITE}Termux lu sekarang udah polos lagi kayak baru pertama install.${RS}"
    echo -e "${YELLOW}Silakan ketik 'exit' atau buka session baru buat liat efeknya.${RS}\n"
    pause_menu
}
