#!/bin/bash
# ============================================================
#  modules/plugins.sh — Opsi 3: Highlight & Auto-suggestions
# ============================================================

action_zsh_plugins() {
    show_header
    echo -e "${C}  ┌─ ENABLE HIGHLIGHTS & AUTO-SUGGESTIONS ──────┐${RS}"
    echo ""

    # Guard: pastikan ZSH & Oh My Zsh sudah terinstall
    if ! command -v zsh &>/dev/null; then
        error "ZSH belum terinstall! Jalankan opsi [2] dulu."
        pause_menu; return
    fi
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        error "Oh My Zsh tidak ditemukan! Jalankan opsi [2] dulu."
        pause_menu; return
    fi
    if [ ! -f "$HOME/.zshrc" ]; then
        error "File .zshrc tidak ada! Jalankan opsi [2] dulu."
        pause_menu; return
    fi

    local ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
    mkdir -p "$ZSH_CUSTOM/plugins"

    info "Clone zsh-autosuggestions..."
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        (git clone https://github.com/zsh-users/zsh-autosuggestions \
            "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null) &
        spinner $! "zsh-autosuggestions"
    else
        echo -e "  ${DIM}zsh-autosuggestions already installed, skipping.${RS}"
    fi

    info "Clone zsh-syntax-highlighting..."
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        (git clone https://github.com/zsh-users/zsh-syntax-highlighting \
            "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null) &
        spinner $! "zsh-syntax-highlighting"
    else
        echo -e "  ${DIM}zsh-syntax-highlighting already installed, skipping.${RS}"
    fi

    info "Add plugins to .zshrc..."
    ZSHRC="$HOME/.zshrc"
    if grep -q "^plugins=" "$ZSHRC"; then
        # Tambah ke baris plugins yang sudah ada (apapun isinya)
        sed -i '/^plugins=/ s/)$/ zsh-autosuggestions zsh-syntax-highlighting)/' "$ZSHRC"
        # Cegah duplikat jika script dijalankan 2x
        sed -i ':a;N;$!ba;s/zsh-autosuggestions[[:space:]]*zsh-autosuggestions/zsh-autosuggestions/g' "$ZSHRC"
        sed -i ':a;N;$!ba;s/zsh-syntax-highlighting[[:space:]]*zsh-syntax-highlighting/zsh-syntax-highlighting/g' "$ZSHRC"
        success "Plugins ditambahkan ke baris plugins yang ada"
    else
        # Tidak ada baris plugins, tambah manual
        echo "plugins=(git zsh-autosuggestions zsh-syntax-highlighting)" >> "$ZSHRC"
        success "Baris plugins baru ditambahkan ke .zshrc"
    fi

    divider
    success "Plugins Successfully Activated!"
    pause_menu
}
