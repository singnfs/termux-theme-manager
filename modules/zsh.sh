#!/bin/bash
# ============================================================
#  modules/zsh.sh — Option 2: Install & Configure ZSH
# ============================================================

action_install_zsh() {
    show_header
    echo -e "${C}  ┌─ INSTALL & CONFIGURE ZSH ────────────────────┐${RS}"
    echo ""
    info "Installing ZSH..."
    (pkg install zsh -y) &>/dev/null &
    spinner $! "Installing ZSH"

    info "Installing Oh My Zsh..."
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        (sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended) &>/dev/null &
        spinner $! "Installing Oh My Zsh"
    else
        echo -e "  ${DIM}Oh My Zsh is already installed, skipping.${RS}"
    fi

    chsh -s zsh

    divider
    success "ZSH Installed Successfully!"
    pause_menu
}
