#!/bin/bash
# ============================================================
#   modules/menu.sh — Tampilan Header & Menu Utama
# ============================================================

show_header() {
    clear
    echo ""
    echo -e "${C}  ╔════════════════════════════════════════════════╗${RS}"
    echo -e "${C}  ║${G}  ██████╗ ██╗███╗  ██╗ ██████╗  ██████╗ ███████╗${C}║${RS}"
    echo -e "${C}  ║${G} ██╔════╝ ██║████╗ ██║██╔════╝ ██╔═══██╗██╔════╝${C}║${RS}"
    echo -e "${C}  ║${G} ╚█████╗  ██║██╔██╗██║██║  ███╗██║   ██║███████╗${C}║${RS}"
    echo -e "${C}  ║${G}  ╚═══██╗ ██║██║╚████║██║   ██║██║   ██║╚════██║${C}║${RS}"
    echo -e "${C}  ║${G}  ██████╔╝██║██║ ╚███║╚██████╔╝╚██████╔╝███████║${C}║${RS}"
    echo -e "${C}  ║${G}  ╚═════╝ ╚═╝╚═╝  ╚══╝ ╚═════╝  ╚═════╝ ╚══════╝${C}║${RS}"
    echo -e "${C}  ║${Y}            ✦  THEME MANAGER  v2.0  ✦           ${C}║${RS}"
    echo -e "${C}  ║${DIM}              Welcome To SingOS                 ${C}║${RS}"
    echo -e "${C}  ╚════════════════════════════════════════════════╝${RS}"
    echo ""
}

show_menu() {
    show_header
    echo -e "${C}  ┌──────────────────────────────────────────────┐${RS}"
    echo -e "${C}  │ ${W}MAIN COURSE                                  ${C}│${RS}"
    echo -e "${C}  ├──────────────────────────────────────────────┤${RS}"
    echo -e "${C}  │ ${G}[1]${RS} ${W}Nasikari / Basic Setup & Dependencies    ${C}│${RS}"
    echo -e "${C}  │ ${G}[2]${RS} ${W}Install & Configure ZSH                  ${C}│${RS}"
    echo -e "${C}  │ ${G}[3]${RS} ${W}Enable Highlights & Auto-suggestions     ${C}│${RS}"
    echo -e "${C}  │ ${G}[4]${RS} ${W}Install Cool Banners & Android Icons     ${C}│${RS}"
    echo -e "${C}  │ ${G}[5]${RS} ${W}Install Neofetch (Spec View)             ${C}│${RS}"
    echo -e "${C}  │ ${G}[6]${RS} ${W}Uninstall & Reset Termux                 ${C}│${RS}"
    echo -e "${C}  ├──────────────────────────────────────────────┤${RS}"
    echo -e "${C}  │ ${R}[7]${RS} ${W}Exit                                     ${C}│${RS}"
    echo -e "${C}  └──────────────────────────────────────────────┘${RS}"
    echo ""
    echo -ne "  ${G}❯ Select options (1-7): ${RS}"
    read -r opt
}
