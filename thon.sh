#!/bin/sh
# thon.sh — Menu Simulasi Peretasan (PRANK, VISUAL ONLY)
# Theme: green hacker, beep, matrix, fake crack, choices: FB/WA/YT/IG/More
# Usage:
#   cd /sdcard/Apktool_M
#   chmod +x thon.sh
#   sh thon.sh

G="\033[1;32m"  # green neon
W="\033[0m"
P="\033[35m"
C="\033[36m"
R="\033[31m"

trap "printf \"\n${C}[STOP] Exiting...${W}\n\"; exit 0" INT

clear
banner() {
  printf "${G}"
  cat <<'EOF'
  ____  _                _   _             
 |  _ \| |__   ___  __ _| |_| |__   ___    
 | |_) | '_ \ / _ \/ _` | __| '_ \ / _ \   
 |  __/| | | |  __/ (_| | |_| | | |  __/   
 |_|   |_| |_|\___|\__,_|\__|_| |_|\___|   
                                           
    ▀▄▀▄ 𝑊𝐸𝐿𝐶𝑂𝑂𝑀 𝑇𝑂 𝐻𝐴𝐶𝐾𝐼𝑁𝐺 𝐹𝐴𝑀𝐼𝐿𝑌 ▄▀▄▀      
EOF
  printf "${W}\n"
}
pause() { read -r -p "${C}Press Enter to continue...${W}"; }

beep_pat() {
  # spam beep a few times (term dependent)
  printf '\a'; sleep 0.08; printf '\a'; sleep 0.06; printf '\a'
}

matrix_short() {
  # small matrix rain block
  cols=60
  for r in $(seq 1 12); do
    line=""
    for c in $(seq 1 $cols); do
      v=$((RANDOM%2))
      if [ $v -eq 0 ]; then
        line="${line}${G}0${W}"
      else
        line="${line}${G}1${W}"
      fi
    done
    printf "%s\n" "$line"
    sleep 0.03
  done
}

type_write() {
  txt="$1"
  for i in $(seq 1 ${#txt}); do
    printf "%s" "${txt:i-1:1}"
    sleep 0.03
  done
  printf "\n"
}

fake_pw() {
  head /dev/urandom | tr -dc A-Za-z0-9 | head -c "$1"
}

spinner_long() {
  msg="$1"
  chars="/-\\|"
  printf "%s " "$msg"
  for i in $(seq 1 60); do
    c=$(printf "%s" "$chars" | cut -c$(( (i % 4) + 1 )))
    printf "\r%s %s" "$msg" "$c"
    sleep 0.04
  done
  printf "\r%s ${G}[OK]${W}\n" "$msg"
}

progress_bar() {
  label="$1"
  for p in $(seq 1 100); do
    filled=$((p/2))
    empty=$((50-filled))
    bar="$(printf '%0.s#' $(seq 1 $filled))$(printf '%0.s-' $(seq 1 $empty))"
    printf "\r%s: [%s] %s%%" "$label" "$bar" "$p"
    sleep 0.02
  done
  printf "\n"
}

simulate_flow() {
  service="$1"
  target="$2"

  clear
  printf "${G}===== SIMULASI: %s =====${W}\n\n" "$service"
  printf "${C}Target:%s %s\n\n${W}" "$W" "$target"
  beep_pat

  # connect
  spinner_long "Opening encrypted channel to $service..."
  printf "\n"

  # matrix
  matrix_short

  printf "${P}>> Initiating multi-threaded hash analysis...${W}\n"
  progress_bar "Hash cracking"

  printf "${P}>> Searching fake DB mirrors...${W}\n"
  for i in 1 40; do
    printf "${G}[mirror-%02d] probe... %s\r" "$i" "$((RANDOM%100))%"
    sleep 0.03
  done
  printf "\n"

  printf "${C}>> Synthesizing access token (simulated)...${W}\n"
  spinner_long "Token factory"

  printf "\n${G}>> Generating plausible password candidates...${W}\n"
  for i in 1 6; do
    pw="$(fake_pw 10)"
    printf "${G}[CANDIDATE %d] %s${W}\n" "$i" "$pw"
    sleep 0.25
    printf '\a'
  done

  printf "\n"
  type_write "${G}[RESULT] Simulated breach: SUCCESS (visual only).${W}"
  sleep 0.3

  printf "\n${P}Aksi lanjutan (simulasi):${W}\n"
  printf "  1) Simulate logout other devices\n"
  printf "  2) Simulate change password\n"
  printf "  3) Simulate post message\n"
  printf "  4) Return to main menu\n"
  printf "\n"
  read -r -p "${C}Pilih aksi (1-4): ${W}" act

  case "$act" in
    1)
      spinner_long "Sending fake 'logout all sessions' commands..."
      printf "${G}[OK] All sessions 'simulated' logged out.\n${W}"
      ;;
    2)
      newpw="chg_$(fake_pw 8)"
      spinner_long "Applying fake password change..."
      printf "${G}[OK] Password changed to: %s (simulated)\n${W}" "$newpw"
      ;;
    3)
      read -r -p "${C}Tulis pesan palsu untuk diposting (simulasi): ${W}" postmsg
      spinner_long "Posting message to timeline (simulated)..."
      printf "${G}[OK] Message posted: \"%s\" (simulated)\n${W}" "$postmsg"
      ;;
    *)
      printf "${C}Returning to menu...${W}\n"
      ;;
  esac

  echo ""
  pause
}

menu_fb() {
  clear
  printf "${G}--- FACEBOOK SIMULATOR ---${W}\n\n"
  read -r -p "Masukkan username/email target: " tgt
  simulate_flow "FACEBOOK" "$tgt"
}

menu_wa() {
  clear
  printf "${G}--- WHATSAPP SIMULATOR ---${W}\n\n"
  read -r -p "Masukkan nomor target (contoh 0812xxxx): " tgt
  simulate_flow "WHATSAPP" "$tgt"
}

menu_yt() {
  clear
  printf "${G}--- YOUTUBE SIMULATOR ---${W}\n\n"
  read -r -p "Masukkan channel/username target: " tgt
  simulate_flow "YOUTUBE" "$tgt"
}

menu_ig() {
  clear
  printf "${G}--- INSTAGRAM SIMULATOR ---${W}\n\n"
  read -r -p "Masukkan username target: " tgt
  simulate_flow "INSTAGRAM" "$tgt"
}

menu_more() {
  while true; do
    clear
    printf "${G}--- MORE SERVICES (SIM) ---${W}\n\n"
    printf "  1) Google (sim)\n"
    printf "  2) Twitter/X (sim)\n"
    printf "  3) TikTok (sim)\n"
    printf "  4) NASA Satellite (fun sim)\n"
    printf "  5) Back\n\n"
    read -r -p "${C}Pilih (1-5): ${W}" m
    case "$m" in
      1) read -r -p "Google account (email): " t; simulate_flow "GOOGLE" "$t";;
      2) read -r -p "Twitter handle: " t; simulate_flow "TWITTER/X" "$t";;
      3) read -r -p "TikTok username: " t; simulate_flow "TIKTOK" "$t";;
      4)
         clear
         printf "${G}--- NASA SATELLITE SIMULATOR ---${W}\n\n"
         beep_pat
         spinner_long "Establishing simulated uplink to LEO satellite..."
         progress_bar "Handshake"
         printf "${G}[OK] Telemetry stream open (simulated)\n${W}"
         echo ""
         read -r -p "${C}Simulate orbital adjustment? (y/n): ${W}" ob
         if [ "$ob" = "y" ]; then
           spinner_long "Applying simulated thruster pulse..."
           printf "${G}[OK] Orbital vector 'tweaked' (simulated)\n${W}"
         fi
         pause
         ;;
      5) break;;
      *) printf "${R}Invalid${W}\n"; sleep 0.4;;
    esac
  done
}

main_menu() {
  while true; do
    clear
    banner
    printf "${C}Pilihan simulasi:${W}\n"
    printf "  1) Facebook\n"
    printf "  2) WhatsApp\n"
    printf "  3) YouTube\n"
    printf "  4) Instagram\n"
    printf "  5) More (Google/Twitter/TikTok/NASA)\n"
    printf "  6) About & Disclaimer\n"
    printf "  7) Exit\n\n"
    read -r -p "${G}Pilih (1-7): ${W}" choice
    case "$choice" in
      1) menu_fb;;
      2) menu_wa;;
      3) menu_yt;;
      4) menu_ig;;
      5) menu_more;;
      6)
         clear
         printf "${G}ABOUT & DISCLAIMER${W}\n\n"
         printf "  Script ini HANYA SIMULASI VISUAL. Tidak ada akses\n"
         printf "  nyata ke layanan manapun, tidak mengambil data,\n"
         printf "  dan bukan tool exploit. Jangan dipakai untuk\n"
         printf "  mengancam, menipu, atau merugikan orang lain.\n\n"
         pause
         ;;
      7) printf "${C}Bye. Ctrl+C juga works.${W}\n"; exit 0;;
      *) printf "${R}Pilihan tidak valid${W}\n"; sleep 0.6;;
    esac
  done
}

# Start
main_menu