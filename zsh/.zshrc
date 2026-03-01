# ============================================================
# ~/.zshrc - 共通設定（public）
# 機種固有・秘匿の設定は ~/.zshrc.local に書く
# このファイルへの直接追記禁止
# ============================================================

# ── Powerlevel10k instant prompt ──────────────────────────
# シェル起動を高速化するキャッシュ機構。
# この行より後でコンソール出力が発生すると警告が出るため、必ずファイル先頭に置く。
# キャッシュファイルは p10k configure 実行後に自動生成される。
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ── 履歴 ──────────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=20000
setopt HIST_IGNORE_ALL_DUPS   # 重複エントリを削除
setopt HIST_REDUCE_BLANKS     # 余分な空白を削除
setopt SHARE_HISTORY          # セッション間で履歴を共有

# ── zsh オプション ────────────────────────────────────────
setopt AUTO_CD                # ディレクトリ名だけで cd
setopt CORRECT                # コマンドのタイポを修正
setopt NO_BEEP                # ビープ音を鳴らさない

# ── キーバインド ──────────────────────────────────────────
bindkey -e                    # Emacs モードのキーバインド（^A=行頭, ^E=行末, etc）

# ── 補完 ─────────────────────────────────────────────────
# zsh 標準の補完システムを有効化する（コマンド・引数・パスの Tab 補完）
# carapace をロードする前に初期化しておく必要がある
# -u: /opt/homebrew/share のグループ書き込みビットによる "insecure directories" 警告を抑制する
#     Homebrew 管理下のディレクトリなので自前で chmod せず、フラグで対応するのが安全
autoload -Uz compinit && compinit -u
# 小文字入力で大文字にもマッチする（例: cd doc → Documents）
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補をファイルの種類で色分け表示する（ls と同じ色設定を再利用）
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ── エイリアス ────────────────────────────────────────────
alias ls='ls -FG'
alias ll='ls -alFG'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
# alias dev='cd ~/development'

# ── Powerlevel10k テーマ ────────────────────────────────
# brew install powerlevel10k でインストール。
# Apple Silicon 前提で /opt/homebrew を使用。
if [[ -f /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
fi

# p10k の設定ファイル（p10k configure で対話生成 → dotfiles/zsh/.p10k.zsh に保存）
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ── carapace ─────────────────────────────────────────────
# compinit の補完 backend を carapace に置き換える。
# zsh/fish/bash それぞれの補完定義を統合して使うため、compinit 単独より
# 多くのコマンドの引数・サブコマンドを高精度に補完できる。
# インストール: brew install carapace
# 全ターミナルで process substitution ではなく、生成済みスクリプトを読む。
export CARAPACE_BRIDGES='zsh,fish,bash'
if [[ -r /Users/Kei/dotfiles/zsh/.carapace.generated.zsh ]]; then
  source /Users/Kei/dotfiles/zsh/.carapace.generated.zsh
fi

# ── zsh-autosuggestions ───────────────────────────────────
# Fish 風のインライン補完。入力中にゴーストテキストでサジェストを表示する。
# → キーまたは Ctrl+E で確定する。
# インストール: brew install zsh-autosuggestions
# Apple Silicon 前提で /opt/homebrew を使用。
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# strategy の優先順:
#   1. history   - まず入力履歴から検索（例: tree → tree -L 3）
#   2. completion - 履歴にない場合は carapace 経由で補完（例: pki → pkill）
if [[ -r /Users/Kei/dotfiles/zsh/.carapace.generated.zsh ]]; then
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
else
  ZSH_AUTOSUGGEST_STRATEGY=(history)
fi
# サジェストテキストの色（fg=244 は256色の中間グレー。暗い背景でも読みやすい）
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

# ── Ghostty shell-integration ────────────────────────────
# タブ・ペイン分割時の CWD 引き継ぎ、プロンプトマーク、コマンドタイトルなどを有効にする。
# Ghostty 起動時に $GHOSTTY_RESOURCES_DIR が設定されている場合のみ読み込む。
if [[ -n $GHOSTTY_RESOURCES_DIR && -r "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi

# ── 機種固有設定の読み込み ────────────────────────────────
# brew, nvm, PC固有設定などはこちらに書く
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
