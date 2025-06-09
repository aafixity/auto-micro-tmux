#!/bin/bash

sudo dnf install -y tmux

curl https://getmic.ro | bash
sudo mv micro /usr/bin/

cp .tmux.conf ~/.tmux.conf

mkdir -p ~/.config/micro
cp microconfs/bindings.json ~/.config/micro
cp microconfs/settings.json ~/.config/micro

if ! grep -q "# >>> auto-micro-tmux config start" ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc

# >>> auto-micro-tmux config start
export TERM=alacritty

alias ls="ls --color"
alias ll="ls -l"
alias lla="ll -a"
alias ip="ip --color"
# <<< auto-micro-tmux config end

EOF
fi

echo "Install complete."
echo "Waiting for: source ~/.bashrc."
