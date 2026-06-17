#!/bin/bash
# ============================================================
#   AndroRice / SingOS — Terminal Uninstaller & Reset Tool
#   Created by: @singnfs (v1.0 Pro)
# ============================================================

# --- COLOR THEMES ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RS='\033[0m'

show_header_uninstall() {
    clear
    echo -e "${RED}  ┌────────────────────────────────────────┐${RS}"
    echo -e "${RED}  │    🗑️  Terminal Reset & Uninstaller     │${RS}"
    echo -e "${RED}  │    •_• Restore Termux to Factory State  │${RS}"
    echo -e "${RED}  └────────────────────────────────────────┘${RS}"
    echo -e "${BLUE}  [ Creator: @singnfs ]  [ Status: Uninstaller Pro ]${RS}"
    echo -e "  ----------------------------------------"
    echo ""
}

spinner_uninstall() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    tput civis # Hide cursor
    while [ "$(ps -p $pid -o state= 2>/dev/null)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  %s" "$spinstr" "$2"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\r"
    done
    tput cnorm # Show cursor again
    echo -e " [${GREEN}✓${RS}] $2 ${GREEN}Done!${RS}"
}

action_uninstall() {
    show_header_uninstall
    
    echo -e "${YELLOW}[!] Starting complete cleanup...${RS}\n"
    sleep 1

    # 1. Remove Termux visual configuration (Theme, Font, Cursor, Keys)
    (rm -f "$HOME/.termux/colors.properties" "$HOME/.termux/font.ttf" "$HOME/.termux/termux.properties") &>/dev/null &
    spinner_uninstall $! "Removing theme, font, and extra-keys configuration"

    # 2. Wipe Oh-My-Zsh & plugins if they exist, then revert shell back to default Bash
    if [ -d "$HOME/.oh-my-zsh" ] || [ -f "$HOME/.zshrc" ]; then
        (
            rm -rf "$HOME/.oh-my-zsh"
            rm -f "$HOME/.zshrc"
            chsh -s bash
        ) &>/dev/null &
        spinner_uninstall $! "Removing Oh-My-Zsh & restoring shell to Bash"
    fi

    # 3. Reload settings in realtime for an instant factory reset look
    (termux-reload-settings) &>/dev/null &
    spinner_uninstall $! "Applying Termux factory settings"

    # --- FINISHING ---
    echo -e "\n========================================"
    echo -e "${GREEN}[✓] UNINSTALL SUCCESSFULLY COMPLETED!${RS}"
    echo -e "========================================"
    echo -e "${WHITE}Your Termux is now clean and fresh, just like a brand new install.${RS}"
    echo -e "${YELLOW}Please type 'exit' or open a new session to see the changes.${RS}\n"
    pause_menu
}
