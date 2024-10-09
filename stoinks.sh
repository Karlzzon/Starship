# Uppdatera systemet
sudo apt-get update
sudo apt -y upgrade

# Lägg till alias och zoxide till bashrc
echo  '
# Aliases
alias l="lsd -l --blocks=permission,name"
alias la="lsd -la --blocks=permission,name"
alias ll="lsd -la"
alias lt="lsd -l --blocks=permission,date,name"
alias lta="lsd -la --blocks=permission,date,name"
alias lw="lsd -l --blocks=permission,size,name"
alias lwa="lsd -la --blocks=permission,size,name"

export LS_COLORS="di=34:ow=33"
eval "$(zoxide init bash)"
' >> ~/.bashrc

# Installera lsd
sudo apt install -y lsd zoxide

# Installera byggberoenden
sudo apt-get install -y ninja-build gettext cmake unzip curl build-essential

# Klona och bygg Neovim
git clone https://github.com/neovim/neovim
cd neovim && sudo make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install

# Klona Neovim-konfiguration
git clone https://github.com/Karlzzon/nvim.git ~/.config/nvim

# Ladda om bashrc
source ~/.bashrc
