#!/bin/bash

echo "=== CZYSZCZENIE CACHE W UBUNTU ==="

# 1. Autoremove niepotrzebnych pakietów
echo "-> Usuwanie niepotrzebnych pakietów (autoremove)..."
sudo apt autoremove -y

# 2. Czyszczenie apt cache
echo "-> Czyszczenie cache APT..."
sudo apt clean
sudo apt autoclean

# 3. Czyszczenie Snap cache
if [ -d "/var/lib/snapd/cache" ]; then
  echo "-> Czyszczenie cache Snap..."
  sudo rm -rf /var/lib/snapd/cache/*
fi

# 4. Czyszczenie Flatpak cache (opcjonalne)
if command -v flatpak >/dev/null; then
  echo "-> Czyszczenie cache Flatpak..."
  flatpak uninstall --unused -y
fi

# 5. Czyszczenie /tmp
echo "-> Czyszczenie /tmp..."
sudo rm -rf /tmp/*

# 6. Czyszczenie kosza użytkownika
echo "-> Czyszczenie kosza użytkownika..."
rm -rf ~/.local/share/Trash/*

# 7. Czyszczenie logów starszych niż 7 dni
echo "-> Czyszczenie logów systemowych starszych niż 7 dni..."
sudo journalctl --vacuum-time=7d

echo "=== CZYSZCZENIE ZAKOŃCZONE ==="
