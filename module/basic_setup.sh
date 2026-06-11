#!/bin/bash
# ============================================================
#  modules/basic_setup.sh — Opsi 1: Basic Setup & Dependencies
# ============================================================

action_basic_setup() {
    show_header
    echo -e "${C}  ┌─ BASIC SETUP & DEPENDENCIES ─────────────────┐${RS}"
    echo ""
    info "Update & upgrade package list..."
    (pkg update -y && pkg upgrade -y) &>/dev/null &
    spinner $! "pkg update & upgrade"

    info "Install tools (git, curl, wget, figlet, ncurses)..."
    (pkg install git curl wget ncurses-utils figlet -y) &>/dev/null &
    spinner $! "Menginstall dependencies"

    divider
    success "Basic Setup Selesai!"
    pause_menu
}
