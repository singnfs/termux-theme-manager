#!/bin/bash
# ============================================================
#  modules/colors.sh — Warna ANSI & Fungsi Utilitas
# ============================================================

# Warna
R="\e[1;31m"
G="\e[1;32m"
Y="\e[1;33m"
B="\e[1;34m"
M="\e[1;35m"
C="\e[1;36m"
W="\e[1;37m"
DIM="\e[2m"
RS="\e[0m"

# Spinner animasi loading
spinner() {
    local pid=$1
    local msg="${2:-Loading...}"
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0
    while kill -0 "$pid" 2>/dev/null; do
        i=$(( (i+1) % 10 ))
        printf "\r${C}  ${spin:$i:1}${RS}  ${W}%s${RS}" "$msg"
        sleep 0.1
    done
    printf "\r${G}  ✔${RS}  ${W}%s${RS}\n" "$msg"
}

# Pesan output
success() { echo -e "\n${G}  ✔  $1${RS}"; }
error()   { echo -e "\n${R}  ✘  $1${RS}"; }
info()    { echo -e "${Y}  ➜  $1${RS}"; }
divider() { echo -e "${DIM}${C}  ─────────────────────────────────────────${RS}"; }

# Pause sebelum kembali ke menu
pause_menu() {
    echo ""
    echo -ne "${DIM}  Tekan Enter untuk kembali ke menu...${RS}"
    read -r
}
