# Installation command
```bash
wget https://github.com/aafixity/auto-micro-tmux/archive/refs/heads/main.zip && unzip main.zip && cd auto-micro-tmux-main && chmod +x install.sh && ./install.sh && source ~/.bashrc
```

# Installation step by step

#### 1. Download the repository archive:
```bash
wget https://github.com/aafixity/auto-micro-tmux/archive/refs/heads/main.zip
```
#### 2. Unzip the archive:
```bash
unzip main.zip
```
#### 3. Change into the directory:
```bash
cd auto-micro-tmux-main
```
#### 4. Make the install script executable:
```bash
chmod +x install.sh
```
#### 5. Run the install script:
```bash
./install.sh
```
#### 6. Apply the new shell configuration:
```bash
source ~/.bashrc
```
# Additional features
#### Micro theme installation:
1. Open editor `micro`.
2. Press <kbd>Ctrl</kbd>+<kbd>e</kbd>.
3. Type `set colorscheme catppuccin-macchiato` (u can change <macchiato> to one of this themes: latte, frappe, macchiato, or mocha).
4. Press <kbd>Enter</kbd>.


#### Pretty PS1:
```bash
PS1='[\[\e[1;32m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[1;33m\]\w\[\e[0m\]]$: '
```
#### Advanced PS1:
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

#### Tmux auto launch:
```bash
if command -v tmux>/dev/null; then
  if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
  fi
fi
```
