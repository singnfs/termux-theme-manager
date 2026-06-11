#!/bin/bash
# ============================================================
#  modules/zsh.sh — Opsi 2: Install & Konfigurasi ZSH
# ============================================================

action_install_zsh() {
    show_header
    echo -e "${C}  ┌─ INSTALL & KONFIGURASI ZSH ──────────────────┐${RS}"
    echo ""
    info "Menginstall ZSH..."
    (pkg install zsh -y) &>/dev/null &
    spinner $! "Menginstall ZSH"

    info "Menginstall Oh My Zsh..."
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        (sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended) &>/dev/null &
        spinner $! "Menginstall Oh My Zsh"
    else
        echo -e "  ${DIM}Oh My Zsh sudah terinstall, skip.${RS}"
    fi

    chsh -s zsh

    divider
    success "ZSH Berhasil Diinstal!"
    pause_menu
}
