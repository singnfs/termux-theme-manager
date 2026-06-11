#!/bin/bash
# ============================================================
#  modules/banner.sh — Opsi 4: Banner Keren & Icon Android
# ============================================================

action_banner_prompt() {
    show_header
    echo -e "${C}  ┌─ BUAT BANNER & PROMPT SINGOS ────────────────┐${RS}"
    echo ""
    echo -ne "  ${Y}Masukkan Nama Shell Prompt${RS}"
    echo -ne "  ${DIM}(Enter untuk default 'SingOS')${RS}: "
    read -r shell_name
    [ -z "$shell_name" ] && shell_name="SingOS"

    info "Membuat file banner ~/.singos_banner..."

    cat << "EOF" > "$HOME/.singos_banner"
clear

C="\e[1;36m"
G="\e[1;32m"
Y="\e[1;33m"
RS="\e[0m"

echo -e "${C} ██████╗██╗███╗   ██╗ ██████╗  ██████╗ ███████╗${RS}"
echo -e "${C}██╔════╝██║████╗  ██║██╔════╝ ██╔═══██╗██╔════╝${RS}"
echo -e "${C}╚█████╗ ██║██╔██╗ ██║██║  ███╗██║   ██║███████╗${RS}"
echo -e "${C} ╚═══██╗██║██║╚██╗██║██║   ██║██║   ██║╚════██║${RS}"
echo -e "${C}██████╔╝██║██║ ╚████║╚██████╔╝╚██████╔╝███████║${RS}"
echo -e "${C}╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚══════╝${RS}"
echo -e "${Y}=================================================${RS}"
echo -e "${G}       Welcome to SingOS Theme       ${RS}"
echo -e "${Y}=================================================${RS}"
echo -e ""
if command -v neofetch &> /dev/null; then
    neofetch
fi
EOF

    info "Menambahkan banner ke .zshrc..."
    if ! grep -q ".singos_banner" "$HOME/.zshrc"; then
        echo "source \$HOME/.singos_banner" >> "$HOME/.zshrc"
    fi

    info "Mengatur custom PROMPT..."
    sed -i '/PROMPT=/d' "$HOME/.zshrc"
    echo "PROMPT='%F{green}☯%F{cyan}[$shell_name]%f %F{green}%~%f %F{yellow} ➔%f '" >> "$HOME/.zshrc"

    divider
    success "Banner & Icon Android ☯ berhasil dipasang untuk '$shell_name'!"
    pause_menu
}
