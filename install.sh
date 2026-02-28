#!/bin/bash
# dotfiles シンボリックリンク作成スクリプト
# 使い方: bash ~/dotfiles/install.sh
#
# 既存ファイルは .bak にリネームしてバックアップする

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1"
  local dest="$2"

  # 既存の実ファイル（symlinkでない）はバックアップ
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "Backup: $dest → $dest.bak"
    mv "$dest" "$dest.bak"
  fi

  ln -sfn "$src" "$dest"
  echo "Linked: $src → $dest"
}

# zsh
link "$DOTFILES_DIR/zsh/.zshrc"  "$HOME/.zshrc"
link "$DOTFILES_DIR/zsh/.zshenv" "$HOME/.zshenv"

# powerlevel10k の設定ファイル（p10k configure で生成後に dotfiles/zsh/.p10k.zsh に保存してから再実行）
if [[ -f "$DOTFILES_DIR/zsh/.p10k.zsh" ]]; then
  link "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
fi

# vim
link "$DOTFILES_DIR/vim/.vimrc"  "$HOME/.vimrc"

# ghostty
mkdir -p "$HOME/.config/ghostty"
link "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

echo ""
echo "Done! シェルを再起動: exec zsh"
