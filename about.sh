#!/data/data/com.termux/files/usr/bin/bash
# about.sh - Simple Termux "about" tool with ASCII logo
# Author: Thon Modz
# Version: 1.0.0
# License: MIT

# -------------------------
# Konfigurasi
APP_NAME="THON MODZ"
AUTHOR="Thon Modz"
VERSION="1.0.0"
CONTACT="thonmodz@example.com"
DESCRIPTION="Tool kecil untuk menampilkan info. Termux digunakan hanya untuk belajar, bukan untuk hacking atau aktivitas ilegal."
COPYRIGHT="(c) $(date +%Y) Thon Modz"

# -------------------------
# Warna (ANSI)
GREEN="\e[32m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
BOLD="\e[1m"
RESET="\e[0m"

# -------------------------
# Fungsi help
show_help() {
  cat <<-EOF
Usage: about.sh [options]

Options:
  -h, --help      Show this help message and exit
  -v, --version   Show version
  -s, --short     Show a short one-line info
  --no-clear      Do not clear terminal before printing
EOF
}

# -------------------------
# Arg parsing
SHORT=false
NO_CLEAR=false
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help) show_help; exit 0;;
    -v|--version) echo -e "${GREEN}${APP_NAME} ${VERSION}${RESET}"; exit 0;;
    -s|--short) SHORT=true; shift;;
    --no-clear) NO_CLEAR=true; shift;;
    *) shift;;
  esac
done

# Clear screen
if [ "$NO_CLEAR" = false ]; then
  clear
fi

# -------------------------
# Header (ASCII logo)
_can_cmd() { command -v "$1" >/dev/null 2>&1; }

if _can_cmd figlet && _can_cmd lolcat; then
  figlet -f slant "$APP_NAME" | lolcat
elif _can_cmd figlet; then
  figlet -f slant "$APP_NAME"
else
  echo -e "${CYAN}==============================${RESET}"
  echo -e "${BOLD}${GREEN}       ${APP_NAME}${RESET}"
  echo -e "${CYAN}==============================${RESET}"
fi

# -------------------------
# Info utama
if [ "$SHORT" = true ]; then
  echo -e "${YELLOW}${APP_NAME}${RESET} — ${VERSION}"
  exit 0
fi

echo ""
printf "%b\n" "${YELLOW}Author  :${RESET} ${AUTHOR}"
printf "%b\n" "${YELLOW}Version :${RESET} ${VERSION}"
printf "%b\n" "${YELLOW}Contact :${RESET} ${CONTACT}"
echo ""
printf "%b\n" "${BOLD}Deskripsi:${RESET} ${DESCRIPTION}"
echo ""
printf "%b\n" "${CYAN}${COPYRIGHT}${RESET}"
echo ""

# -------------------------
# Disclaimer
echo -e "${RED}${BOLD}DISCLAIMER:${RESET}"
echo -e "${RED}Termux digunakan hanya untuk tujuan pembelajaran, eksperimen, dan pengembangan."
echo -e "Jangan gunakan tool atau skrip ini untuk aktivitas hacking, peretasan, atau tindakan ilegal apapun.${RESET}"
echo ""

exit 0	