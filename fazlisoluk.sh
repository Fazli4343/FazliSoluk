#!/bin/bash

clear

cat << "EOF"
  _ _ _          _ _ _             _     
 | | | | ___  __| (_) | __ _  ___ | | ___
 | | | |/ _ \/ _` | | |/ _` |/ _ \| |/ _ \
 | | | |  __/ (_| | | | (_| | (_) | |  __/
  \___/ \___|\__,_|_|_|\__,_|\___/|_|\___|
                                          
EOF

echo "--------------------------------------------------"
echo "          Fazlı Soluk - Siber Terminal          "
echo "--------------------------------------------------"
echo "\nHoş geldiniz! Bu, siber güvenlik araştırmaları ve araçları için tasarlanmış bir Termux ortamıdır."
echo "\nKullanılabilir komutlar için 'help' yazın."

function help() {
  echo "\nKullanılabilir Komutlar:"
  echo "  scan    - Ağ taraması yapar (örnek: scan 192.168.1.1)"
  echo "  exploit - Güvenlik açığı istismarı yapar (örnek: exploit CVE-2023-1234)"
  echo "  decrypt - Şifre çözme aracı (örnek: decrypt <dosya_adı>)"
  echo "  info    - Sistem bilgisi gösterir"
  echo "  exit    - Terminalden çıkar"
}

while true; do
  read -p "FazlıSoluk> " command
  case $command in
    scan*) echo "Ağ taraması başlatılıyor...";; # Buraya gerçek tarama komutları eklenecek
    exploit*) echo "Güvenlik açığı istismarı başlatılıyor...";; # Buraya gerçek istismar komutları eklenecek
    decrypt*) echo "Şifre çözme aracı başlatılıyor...";; # Buraya gerçek şifre çözme komutları eklenecek
    info) echo "Sistem bilgileri gösteriliyor...";; # Buraya gerçek sistem bilgisi komutları eklenecek
    help) help;;
    exit) echo "Çıkılıyor..."; break;;
    *) echo "Bilinmeyen komut: $command. 'help' yazarak komutları görebilirsiniz.";;
  esac
done
