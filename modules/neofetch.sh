#!/bin/bash
# ============================================================
#  modules/neofetch.sh — Opsi 5: Install Neofetch
# ============================================================

action_neofetch() {
    show_header
    echo -e "${C}  ┌─ INSTALL NEOFETCH ────────────────────────────┐${RS}"
    echo ""
    info "Menginstall Neofetch..."
    (pkg install neofetch -y) &>/dev/null &
    spinner $! "Menginstall Neofetch"

    divider
    success "Neofetch berhasil diinstal!"
    pause_menu
}
