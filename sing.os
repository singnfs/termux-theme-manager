#!/bin/bash
# ============================================================
#   SINGOS THEME MANAGER — v2.0
#   Kustomisasi Termux ala SingOS
#   https://github.com/singnfs/termux-theme-manager
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load semua modules
source "$SCRIPT_DIR/modules/colors.sh"
source "$SCRIPT_DIR/modules/menu.sh"
source "$SCRIPT_DIR/modules/basic_setup.sh"
source "$SCRIPT_DIR/modules/zsh.sh"
source "$SCRIPT_DIR/modules/plugins.sh"
source "$SCRIPT_DIR/modules/banner.sh"
source "$SCRIPT_DIR/modules/neofetch.sh"

# ============================================================
# MAIN LOOP
# ============================================================
while true; do
    show_menu
    case $opt in
        1) action_basic_setup ;;
        2) action_install_zsh ;;
        3) action_zsh_plugins ;;
        4) action_banner_prompt ;;
        5) action_neofetch ;;
        6)
            clear
            echo ""
            echo -e "${G}  ✦  Terima kasih sudah pakai SingOS Theme Manager!${RS}"
            echo -e "${Y}  ➜  Silakan restart Termux untuk melihat hasilnya.${RS}"
            echo ""
            exit 0
            ;;
        *)
            error "Opsi tidak valid! Pilih antara 1-6."
            sleep 1
            ;;
    esac
done
