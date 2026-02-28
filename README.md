# dotfiles

macOS の個人開発環境設定。

## セットアップ

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
bash ~/dotfiles/install.sh
exec zsh
```

## マシン固有設定

`~/.zshrc.local` にマシン固有の設定を記述する（リポジトリ管理外）。
vim や Ghostty など、環境によって調整が必要な箇所は各ファイルを直接編集する。
