#!/bin/bash
# ============================================================
#  modules/menu.sh — Tampilan Header & Menu Utama
# ============================================================

show_header() {
    clear
    echo ""
    echo -e "${C}  ╔══════════════════════════════════════════════╗${RS}"
    echo -e "${C}  ║${G}  ██████╗ ██╗███╗  ██╗ ██████╗  ██████╗ ███████╗${C}║${RS}"
    echo -e "${C}  ║${G} ██╔════╝ ██║████╗ ██║██╔════╝ ██╔═══██╗██╔════╝${C}║${RS}"
    echo -e "${C}  ║${G} ╚█████╗  ██║██╔██╗██║██║  ███╗██║   ██║███████╗${C}║${RS}"
    echo -e "${C}  ║${G}  ╚═══██╗ ██║██║╚████║██║   ██║██║   ██║╚════██║${C}║${RS}"
    echo -e "${C}  ║${G}  ██████╔╝██║██║ ╚███║╚██████╔╝╚██████╔╝███████║${C}║${RS}"
    echo -e "${C}  ║${G}  ╚═════╝ ╚═╝╚═╝  ╚══╝ ╚═════╝  ╚═════╝ ╚══════╝${C}║${RS}"
    echo -e "${C}  ║${Y}          ✦  THEME MANAGER  v2.0  ✦           ${C}║${RS}"
    echo -e "${C}  ║${DIM}        Welcome To SingOS          ${C}${RS}${C}║${RS}"
    echo -e "${C}  ╚══════════════════════════════════════════════╝${RS}"
    echo ""
}

show_menu() {
    show_header
    echo -e "${C}  ┌──────────────────────────────────────────────┐${RS}"
    echo -e "${C}  │${W}  MENU UTAMA                                  ${C}│${RS}"
    echo -e "${C}  ├──────────────────────────────────────────────┤${RS}"
    echo -e "${C}  │${RS}  ${G}[1]${RS}  ${W}Nasikari / Basic Setup & Dependencies  ${C}│${RS}"
    echo -e "${C}  │${RS}  ${G}[2]${RS}  ${W}Install & Konfigurasi ZSH               ${C}│${RS}"
    echo -e "${C}  │${RS}  ${G}[3]${RS}  ${W}Aktifkan Highlight & Auto-suggestions   ${C}│${RS}"
    echo -e "${C}  │${RS}  ${G}[4]${RS}  ${W}Pasang Banner Keren & Icon Android      ${C}│${RS}"
    echo -e "${C}  │${RS}  ${G}[5]${RS}  ${W}Install Neofetch (Tampilan Spek)        ${C}│${RS}"
    echo -e "${C}  ├──────────────────────────────────────────────┤${RS}"
    echo -e "${C}  │${RS}  ${R}[6]${RS}  ${W}Keluar                                  ${C}│${RS}"
    echo -e "${C}  └──────────────────────────────────────────────┘${RS}"
    echo ""
    echo -ne "  ${G}❯ Pilih opsi (1-6): ${RS}"
    read -r opt
}
