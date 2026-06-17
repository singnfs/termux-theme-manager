#!/bin/bash
# ============================================================
#  modules/plugins.sh — Opsi 3: Highlight & Auto-suggestions
# ============================================================

action_zsh_plugins() {
    show_header
    echo -e "${C}  ┌─ ENABLE HIGHLIGHTS & AUTO-SUGGESTIONS ──────┐${RS}"
    echo ""
    local ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
    mkdir -p "$ZSH_CUSTOM/plugins"

    info "Clone zsh-autosuggestions..."
    (git clone https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null || true) &
    spinner $! "zsh-autosuggestions"

    info "Clone zsh-syntax-highlighting..."
    (git clone https://github.com/zsh-users/zsh-syntax-highlighting \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null || true) &
    spinner $! "zsh-syntax-highlighting"

    info "Add plugins to .zshrc..."
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' "$HOME/.zshrc"

    divider
    success "Plugins Successfully Activated!"
    pause_menu
}
