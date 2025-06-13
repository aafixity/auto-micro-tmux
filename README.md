🛠️ Installation

Download the repository archive:

    wget https://github.com/aafixity/auto-micro-tmux/archive/refs/heads/main.zip

Unzip the archive:

    unzip main.zip

Change into the directory:

    cd auto-micro-tmux-main

Make the install script executable:

    chmod +x install.sh

Run the install script:

    ./install.sh

Apply the new shell configuration:

    source ~/.bashrc
  
One line command:
```bash
wget https://github.com/aafixity/auto-micro-tmux/archive/refs/heads/main.zip && unzip main.zip && cd auto-micro-tmux-main && chmod +x install.sh && ./install.sh && source ~/.bashrc
```

Additional to .bashrc (pretty ps1 and auto open tmux):
```bash
PS1='[\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[1;33m\]\w\[\e[0m\]]$: '
```
```bash
set_bash_prompt() {

    local user="\[\e[1;36m\]\u\[\e[0m\]"
    local at="@"
    local host="\[\e[34m\]\h\[\e[0m\]"
    local prepath="\[\e[90m\]in\[\e[0m\]"
    local path="\[\e[37m\]$(realpath "$PWD")\[\e[0m\]"
    local newline=$'\n'

    local arr1="\[\e[30m\]╭─(\[\e[0m\]"
    local arr2="\[\e[30m\])──(\[\e[0m\]"
    local arr3="\[\e[30m\])\[\e[0m\]"
    local arr4="\[\e[30m\]╰───🞂\[\e[0m\]"
	
    PS1="${arr1}${user}${at}${host}${arr2}${prepath} ${path}${arr3}${newline}${arr4} "
}

PROMPT_COMMAND=set_bash_prompt
```

```bash
if command -v tmux>/dev/null; then
  if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
  fi
fi
```
