# gitの設定
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWUPSTREAM=auto

# プロンプト
#eval "$(starship init bash)"
export PS1='[\w]\[\e[0;32m\] $(__git_ps1 "(%s)") \[\e[0m\] \n\$ '

# 出力の後に改行を入れる
# https://qiita.com/hmmrjn/items/60d2a64c9e5bf7c0fe60#%E3%82%A2%E3%82%A6%E3%83%88%E3%83%97%E3%83%83%E3%83%88%E3%81%AE%E5%BE%8C%E3%81%AB%E6%94%B9%E8%A1%8C%E3%82%92%E5%85%A5%E3%82%8C%E3%82%8B
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

# ディレクトリのカラー設定
export LSCOLORS=Fxfxcxdxbxegedabagacad

# zshの警告を非表示
export BASH_SILENCE_DEPRECATION_WARNING=1

# alias
alias ls='ls -FG'
alias ll='ls -alFG'

## ssh

