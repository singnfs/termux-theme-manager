#!/bin/bash
# ============================================================
#   SINGOS THEME MANAGER — v2.0
#   SingOS
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
source "$SCRIPT_DIR/modules/uninstall.sh"

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
        6) action_uninstall ;;
        7)
            clear
            echo ""
            echo -e "${G}  ✦  Thank you for using SingOS Theme Manager!${RS}"
            echo -e "${Y}  ➜  Please restart Termux to see the results.${RS}"
            echo ""
            exit 0
            ;;
        *)
            error "Invalid option! Select between 1-7."
            sleep 1
            ;;
    esac
done
