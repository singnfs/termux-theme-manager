#!/bin/bash
# ============================================================
#   modules/basic_setup.sh — Opsi 1: Basic Setup & Dependencies
# ============================================================

setup_termux_keys() {
    info "Configuring pro cursor and extra-keys..."
    
    # Mastiin folder konfigurasi .termux udah ada
    mkdir -p "$HOME/.termux"
    
    # Tulis settingan lu ke termux.properties
    cat << 'EOF' > "$HOME/.termux/termux.properties"
terminal-cursor-style = underline
terminal-cursor-blink-rate = 600
extra-keys = [['/','ls','$','~','UP','exit','*'],['ex','CTRL','ENTER','LEFT','DOWN','RIGHT','F2']]
EOF

    # Reload settingan secara realtime tanpa restart aplikasi
    termux-reload-settings
    success "Extra-keys & Cursors Pro successfully applied!"
}

action_basic_setup() {
    show_header
    echo -e "${C}  ┌─ BASIC SETUP & DEPENDENCIES ─────────────────┐${RS}"
    echo ""
    info "Update & upgrade package list..."
    (pkg update -y && pkg upgrade -y) &>/dev/null &
    spinner $! "pkg update & upgrade"

    info "Install tools (git, curl, wget, figlet, ncurses)..."
    (pkg install git curl wget ncurses-utils figlet -y) &>/dev/null &
    spinner $! "Installer dependencies"

    # Otomatis eksekusi setup keys dan kursor pilihan lu
    setup_termux_keys

    divider
    success "Basic Setup Completed!""
    pause_menu
}
