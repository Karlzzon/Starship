#!/bin/bash

# Felsökningsläge: loggar alla kommandon och stoppar vid fel
set -ex

# Installera Starship med --yes flaggan (ingen interaktiv prompt)
echo "Installing Starship..."
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Flytta starship.toml till ~/.config
echo "Moving starship.toml to ~/.config..."
mkdir -p ~/.config
mv -f ~/dotfiles/starship.toml ~/.config/

# Lägg till Starship init till .bashrc om det inte redan finns
if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc; then
    echo 'Adding Starship init to .bashrc...'
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
else
    echo "Starship init already present in .bashrc."
fi

# Ladda om bashrc
echo "Sourcing .bashrc..."
source ~/.bashrc

# Bekräfta att installationen är klar
echo "Installation complete!"
