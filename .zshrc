# Created by newuser for 4.3.2
alias jvi='vim'
#alias updtags='ctags -R --langmap=php:.php.inc.html --php-types=c+f+d ./'
alias updtags='ctags -R --langmap=php:.php.inc.html --php-types=c+f+d --regex-php="/^[ \t]*const[ \t]+([a-z0-9_]+)/\1/d/i" ./'

alias ls='ls -aF --color=auto --show-control-chars'
export JAVA_HOME=/usr/lib/fjsdk
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=$CLASSPATH:$JAVA_HOME/jre/lib:/usr/share/java/junit.jar
# viライクキーバインド
bindkey -v
# Ctrl+R is incremental search like a bash.
bindkey "^R" history-incremental-search-backward

export GIT_PAGER="less -rf"
#git shortcut
alias gst='git status'
alias gau='git add -u'
alias gaa='git add -A'
alias gco='git commit'
alias gcov='git commit -v'
alias gcoa='git commit --amend'
alias gdf='git diff -w -b'

#dir shortcut
alias gow='cd /var/www/;pwd;'

# 履歴の保存先
HISTFILE=$HOME/.zsh-history
# メモリに展開する履歴の数
HISTSIZE=100000
## 保存する履歴の数
SAVEHIST=100000

# 履歴の共有
setopt share_history

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 履歴ファイルに時刻を記録
setopt extended_history

# 標準の補完設定
autoload -U compinit
compinit

# ディレクトリ名を入力するだけでカレントディレクトリを変更
setopt auto_cd

# ディレクトリスタックを自動で保存
# setopt auto_pushd

# タブキー連打で補完候補を順に表示
setopt auto_menu

# 自動修正機能(候補を表示)
setopt correct

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types

# パスの最後に付くスラッシュを自動的に削除しない
setopt noautoremoveslash

# = 以降でも補完できるようにする( --prefix=/usr 等の場合)
setopt magic_equal_subst

# ディレクトリ名だけで移動できる。
setopt auto_cd

# 補完候補リストの日本語を正しく表示
setopt print_eight_bit

# 補完の時に大文字小文字を区別しない(但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# lsコマンドの補完候補にも色付き表示
eval `dircolors`
zstyle ':completion:*:default' list-colors ${LS_COLORS}
# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

###############################################
# プロンプト関係                              #
###############################################
# プロンプトに escape sequence (環境変数) を通す
setopt prompt_subst

## プロンプトの設定
autoload colors
colors
PROMPT="%{${fg[blue]}%} %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

setopt transient_rprompt                    # 右プロンプトに入力がきたら消す

# ターミナルのタイトル
case "${TERM}" in
kterm*|xterm)
precmd() {
	echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
}
;;
esac

# 端末のタイトル
case ${TERM} in
xterm*|rxvt*|Eterm|aterm|kterm|mlterm|gnome*)
precmd () { print -Pn '\e]2; %~ - %n@%m\a' }
;;
screen*)
precmd () { echo -ne "\ek\e\\"; print -Pn "\e]0; %~ - %n@%m\a" }
#unalias s
function t ()
{
	echo -ne "\ek$1${2+ $2}${3+ $3}\e\\"
		"$@"
}
# tと同様・sudoの短縮も兼ねる
function s ()
{
	echo -ne "\eks:$1${2+ $2}${3+ $3}\e\\"
		sudo "$@"
}
alias man='t man'
;;
esac

#for nvm
source ~/.nvm/nvm.sh
nvm use v0.4.10
