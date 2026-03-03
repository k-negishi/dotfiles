# ============================================================
# Brewfile - dotfiles が依存する Homebrew パッケージ一覧
#
# 使い方（install.sh から自動実行される）:
#   brew bundle --file=~/dotfiles/Brewfile
#
# インストール済みのパッケージはスキップされる（冪等）
# ============================================================

# ── ターミナル ────────────────────────────────────────────
# Ghostty: GPU アクセラレート対応のモダンターミナル
# 設定ファイル: dotfiles/ghostty/config → ~/.config/ghostty/config
cask "ghostty"

# ── zsh テーマ ────────────────────────────────────────────
# Powerlevel10k: 高速・高機能な zsh プロンプトテーマ
# 設定ファイル: dotfiles/zsh/.p10k.zsh → ~/.p10k.zsh
brew "powerlevel10k"

# ── 補完強化 ──────────────────────────────────────────────
# carapace: compinit の補完 backend を強化し、より多くの
#           コマンドの引数・サブコマンドを高精度に補完する
brew "carapace"

# zsh-autosuggestions: 入力履歴・補完候補を ghost text で表示する
#   → キーまたは Ctrl+E で確定する
brew "zsh-autosuggestions"

# ── ファジーファインダー ──────────────────────────────────
# fzf: インタラクティブなファジー検索
#   Ctrl+R: history 検索  Ctrl+T: ファイル検索  Alt+C: cd 先検索
brew "fzf"
