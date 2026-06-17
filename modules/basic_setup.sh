#!/bin/bash
# ============================================================
#   modules/basic_setup.sh — Option 1: Basic Setup & Dependencies
# ============================================================

setup_termux_keys() {
    info "Configuring pro cursor and extra-keys..."
    
    # Ensure the .termux configuration directory exists
    mkdir -p "$HOME/.termux"
    
    # Write settings to termux.properties
    cat << 'EOF' > "$HOME/.termux/termux.properties"
terminal-cursor-style = underline
terminal-cursor-blink-rate = 600
extra-keys = [['/','ls','$','~','UP','exit','*'],['ex','CTRL','ENTER','LEFT','DOWN','RIGHT','F2']]
EOF

    # Reload settings in realtime without restarting the app
    termux-reload-settings
    success "Extra-keys & Cursors Pro successfully applied!"
}

action_basic_setup() {
    show_header
    echo -e "${C}  ┌─ BASIC SETUP & DEPENDENCIES ─────────────────┐${RS}"
    echo ""
    info "Updating & upgrading package list..."
    (pkg update -y && pkg upgrade -y) &>/dev/null &
    spinner $! "pkg update & upgrade"

    info "Installing tools (git, curl, wget, figlet, ncurses)..."
    (pkg install git curl wget ncurses-utils figlet -y) &>/dev/null &
    spinner $! "Installing dependencies"

    # Automatically execute custom keys and cursor setup
    setup_termux_keys

    divider
    success "Basic Setup Completed!"
    pause_menu
}
