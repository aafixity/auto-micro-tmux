#!/bin/bash

sudo dnf install -y tmux

curl https://getmic.ro | bash
sudo mv micro /bin/

cp .tmux.conf ~/.tmux.conf

mkdir -p ~/.config/micro
cp micro/bindings.json ~/.config/micro/bindings.json
cp micro/settings.json ~/.config/micro/settings.json

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
