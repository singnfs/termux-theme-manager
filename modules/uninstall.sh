#!/bin/bash
# ============================================================
#   modules/uninstall.sh — Opsi 6: Uninstall & Reset Termux
# ============================================================
# Menggunakan variabel warna & fungsi dari colors.sh (sudah di-source oleh singos.sh)

action_uninstall() {
    show_header
    echo -e "${R}  ┌────────────────────────────────────────────────┐${RS}"
    echo -e "${R}  │    🗑️  Terminal Reset & Uninstaller             │${RS}"
    echo -e "${R}  │    Restore Termux to Factory State              │${RS}"
    echo -e "${R}  └────────────────────────────────────────────────┘${RS}"
    echo ""

    echo -e "${Y}  [!] This will remove all themes, ZSH, and Oh My Zsh.${RS}"
    echo -ne "${Y}  Are you sure? (y/N): ${RS}"
    read -r confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        info "Uninstall cancelled."
        pause_menu; return
    fi

    echo ""

    # 1. Hapus konfigurasi visual Termux (theme, font, cursor, extra-keys)
    (rm -f "$HOME/.termux/colors.properties" \
            "$HOME/.termux/font.ttf" \
            "$HOME/.termux/termux.properties") &>/dev/null &
    spinner $! "Removing theme, font, and extra-keys configuration"

    # 2. Hapus banner SingOS dari .zshrc
    if [ -f "$HOME/.zshrc" ]; then
        (sed -i '/\.singos_banner/d' "$HOME/.zshrc"
         sed -i '/PROMPT=/d' "$HOME/.zshrc") &>/dev/null &
        spinner $! "Removing SingOS banner from .zshrc"
    fi

    # 3. Hapus file banner
    (rm -f "$HOME/.singos_banner") &>/dev/null &
    spinner $! "Removing SingOS banner file"

    # 4. Hapus Oh My Zsh & plugins, kembalikan shell ke Bash
    if [ -d "$HOME/.oh-my-zsh" ] || [ -f "$HOME/.zshrc" ]; then
        (
            rm -rf "$HOME/.oh-my-zsh"
            rm -f "$HOME/.zshrc"
            BASH_PATH="$(command -v bash)"
            chsh -s "$BASH_PATH" 2>/dev/null || true
        ) &>/dev/null &
        spinner $! "Removing Oh My Zsh & restoring shell to Bash"
    fi

    # 5. Reload settings Termux
    (termux-reload-settings) &>/dev/null &
    spinner $! "Applying Termux factory settings"

    divider
    success "Uninstall completed! Termux is now clean."
    echo -e "${Y}  ➜  Please type 'exit' or open a new session to see the changes.${RS}"
    echo ""
    pause_menu
}
