#!/bin/bash

echo "Installing Starship..."
yes | curl -sS https://starship.rs/install.sh | sh

echo "Moving starship.toml to ~/.config..."
mkdir -p ~/.config
mv -f ~/dotfiles/starship.toml ~/.config/

if ! grep -Fxq 'eval "$(starship init bash)"' ~/.bashrc; then
    echo 'Adding Starship init to .bashrc...'
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
else
    echo "Starship init already present in .bashrc."
fi

echo "Installation complete!"
