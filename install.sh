#!/bin/bash

sudo dnf install -y tmux

curl https://getmic.ro | bash
sudo mv micro /usr/bin/

cp .tmux.conf ~/.tmux.conf

mkdir -p ~/.config/micro
cp microconfs/bindings.json ~/.config/micro
cp microconfs/settings.json ~/.config/micro

mkdir -p ~/.config/micro/colorschemes
cp microthemes/* ~/.config/micro/colorschemes

if ! grep -q "# >>> auto-micro-tmux config start" ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc

# >>> auto-micro-tmux config start
export TERM=alacritty
export MICRO_TRUECOLOR=1

alias ls="ls --color"
alias ll="ls -l"
alias lla="ll -a"
alias ip="ip --color"
# <<< auto-micro-tmux config end

EOF
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(basename "$SCRIPT_DIR")"

if [[ "$PARENT_DIR" == "auto-micro-tmux-main" ]]; then
  echo "Cleaning up..."
  cd ..
  rm -rf auto-micro-tmux-main main.zip
fi

echo "Install complete."
echo "Waiting for: source ~/.bashrc."
