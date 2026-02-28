# .bashrcの読み込み
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# 環境変数
export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
