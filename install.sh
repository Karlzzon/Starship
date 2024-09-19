#!/bin/bash

# Avsluta om ett kommando misslyckas
set -e

# Installera Starship och svara "y" automatiskt
echo "Installing Starship..."
yes | curl -sS https://starship.rs/install.sh | sh

# Kontrollera om starship.toml finns i aktuell katalog innan flytt
if [ -f ./starship.toml ]; then
    echo "Moving starship.toml to ~/.config..."
    mkdir -p ~/.config
    mv -f ~/dotfiles/starship.toml ~/.config/
else
    echo "starship.toml not found in the current directory, skipping move."
fi

# Lägg till Starship init till .bashrc om det inte redan finns
if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc; then
    echo 'Adding Starship init to .bashrc...'
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
else
    echo "Starship init already present in .bashrc."
fi

# Ladda om .bashrc för att tillämpa ändringar
source ~/.bashrc
echo "Installation complete!"
