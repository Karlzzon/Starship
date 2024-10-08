 echo '
alias l="lsd -l --blocks=permission,name"
alias la="lsd -la --blocks=permission,name"
alias ll="lsd -la"
alias lt="lsd -l --blocks=permission,date,name"
alias lta="lsd -la --blocks=permission,date,name"
alias lw="lsd -l --blocks=permission,size,name"
alias lwa="lsd -la --blocks=permission,size,name"

export LS_COLORS="di=34:ow=33" 
eval "$(starship init bash)"
eval "$(zoxide init bash)"
' >> ~/.bashrc

git clone https://github.com/Karlzzon/nvim.git ~/.config

apt install zoxide lsd neovim