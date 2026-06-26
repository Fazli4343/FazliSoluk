#!/bin/bash

# Renk tanımlamaları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # Renk sıfırlama

clear

# Başlangıç ASCII Sanatı
cat << "EOF"
  _ _ _          _ _ _             _     
 | | | | ___  __| (_) | __ _  ___ | | ___
 | | | |/ _ \/ _` | | |/ _` |/ _ \| |/ _ \
 | | | |  __/ (_| | | | (_| | (_) | |  __/
  \___/ \___|\__,_|_|_|\__,_|\___/|_|\___|
                                          
EOF

echo -e "${CYAN}--------------------------------------------------${NC}"
echo -e "${CYAN}          Fazlı Soluk - Siber Terminal          ${NC}"
echo -e "${CYAN}--------------------------------------------------${NC}"

# Şifre Kontrolü
CORRECT_PASSWORD="211003"
MAX_ATTEMPTS=3
ATTEMPT=1

while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
    echo -ne "${YELLOW}Sisteme erişim için şifre girin: ${NC}"
    read -s password
    echo ""

    if [ "$password" == "$CORRECT_PASSWORD" ]; then
        echo -e "${GREEN}[+] Erişim Onaylandı. Hoş geldiniz, Fazlı.${NC}"
        break
    else
        echo -e "${RED}[!] Hatalı şifre! Deneme $ATTEMPT/$MAX_ATTEMPTS${NC}"
        
        if [ $ATTEMPT -eq $MAX_ATTEMPTS ]; then
            echo -e "\n${RED}[!!!] GÜVENLİK İHLALİ TESPİT EDİLDİ [!!!]${NC}"
            sleep 1
            echo -e "${YELLOW}[*] IP adresiniz belirleniyor...${NC}"
            sleep 2
            # Rastgele bir IP simülasyonu
            RANDOM_IP="$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256))"
            echo -e "${GREEN}[+] IP adresiniz belirlendi: ${RED}$RANDOM_IP${NC}"
            sleep 1
            echo -e "${YELLOW}[*] Sistem kendini savunmaya alıyor...${NC}"
            sleep 1.5
            echo -e "${RED}[!] Karşı atak başlatılıyor...${NC}"
            sleep 1
            echo -e "${RED}[!] Veri paketleri gönderiliyor: [##########] 100%${NC}"
            sleep 1
            echo -e "${RED}[X] BAĞLANTI KESİLDİ.${NC}"
            exit 1
        fi
        ATTEMPT=$((ATTEMPT+1))
    fi
done

# Ana Menü ve Komutlar
echo -e "\n${BLUE}Kullanılabilir komutlar için 'help' yazın.${NC}"

function help_menu() {
  echo -e "\n${CYAN}Kullanılabilir Komutlar:${NC}"
  echo -e "  ${GREEN}scan${NC}    - Ağ taraması yapar (örnek: scan 192.168.1.1)"
  echo -e "  ${GREEN}exploit${NC} - Güvenlik açığı istismarı yapar"
  echo -e "  ${GREEN}decrypt${NC} - Şifre çözme aracı"
  echo -e "  ${GREEN}info${NC}    - Sistem bilgisi gösterir"
  echo -e "  ${GREEN}help${NC}    - Bu menüyü gösterir"
  echo -e "  ${GREEN}exit${NC}    - Terminalden çıkar"
}

while true; do
  echo -ne "${CYAN}FazlıSoluk>${NC} "
  read command
  case $command in
    scan*) 
        echo -e "${YELLOW}[*] Ağ taraması başlatılıyor...${NC}"
        sleep 2
        echo -e "${GREEN}[+] Tarama tamamlandı. Aktif cihazlar listeleniyor...${NC}"
        ;;
    exploit*) 
        echo -e "${YELLOW}[*] Güvenlik açığı istismarı başlatılıyor...${NC}"
        sleep 3
        echo -e "${RED}[!] Hedef sistem korumalı. Erişim reddedildi.${NC}"
        ;;
    decrypt*) 
        echo -e "${YELLOW}[*] Şifre çözme aracı başlatılıyor...${NC}"
        sleep 2
        echo -e "${GREEN}[+] Brute-force saldırısı başarılı. Şifre: ********${NC}"
        ;;
    info) 
        echo -e "${BLUE}--- Sistem Bilgileri ---${NC}"
        echo -e "OS: Termux (Fazlı Soluk Edition)"
        echo -e "Kernel: Linux 4.19.x"
        echo -e "Uptime: 4343 hours"
        ;;
    help) help_menu;;
    exit) echo -e "${YELLOW}Çıkılıyor... Güvende kalın.${NC}"; break;;
    "") ;;
    *) echo -e "${RED}Bilinmeyen komut: $command. 'help' yazarak komutları görebilirsiniz.${NC}";;
  esac
done
