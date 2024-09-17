#!/bin/bash

# Install Starship
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh

# Flytta starship.toml till ~/.config
echo "Moving starship.toml to ~/.config..."
mkdir -p ~/.config
mv -f starship.toml ~/.config/

# Kontrollera om starship redan finns i .bashrc och lägg till om inte
if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc; then
    echo 'Adding Starship init to .bashrc...'
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
else
    echo "Starship init already present in .bashrc."
fi

source ~/.bashrc
echo "Installation complete!
