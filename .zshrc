#
# ____  ____  
#|  _ \|  _ \    Prajwal P 
#| |_) | |_) |   prajwalprakash3722@gmail.com 
#|  __/|  __/    @prajwalprakash3722
#|_|   |_|              
#
# My ZSH Config, Most of em is pretty Standard stuff :)
#

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color" # getting proper colors

# using bat as the MANPAGER
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

ZSH_THEME="powerlevel10k/powerlevel10k"

# enable command auto-correction.
ENABLE_CORRECTION="true"

# I like these plugins 
plugins=(git
        npm
        dotenv
        zsh-syntax-highlighting
        zsh-autosuggestions
        sudo
        kubectl
        )

source $ZSH/oh-my-zsh.sh

# Countdown
cdown () {
    N=$1
  while [[ $((--N)) >  0 ]]
    do
        echo "$N" |  figlet -c | lolcat &&  sleep 1
    done
}

# Archive Extraction
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Colorize grep output (good for log files)
alias grep='grep --color=auto'

# Changing "ls" to "exa"
alias ls='exa -l --color=always --group-directories-first'  # long format
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -al --color=always --group-directories-first' # my preferred listing
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# termbin (similar to pastebin)
alias tb="nc termbin.com 9999"

# common alias
alias vim="nvim"
alias cat="bat"
alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'
alias lzd='lazydocker'

# This is how I maintain dotfiles :)
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# starship Initialization
eval "$(starship init zsh)"
