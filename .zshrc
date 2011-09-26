# Created by newuser for 4.3.2
alias jvi='vim'
#alias updtags='ctags -R --langmap=php:.php.inc.html --php-types=c+f+d ./'
alias updtags='ctags -R --langmap=php:.php.inc.html --php-types=c+f+d --regex-php="/^[ \t]*const[ \t]+([a-z0-9_]+)/\1/d/i" ./'

alias ls='ls -aF --color=auto --show-control-chars'
export JAVA_HOME=/usr/lib/fjsdk
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=$CLASSPATH:$JAVA_HOME/jre/lib:/usr/share/java/junit.jar
# vi�饤�������Х����
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

# �������¸��
HISTFILE=$HOME/.zsh-history
# �����Ÿ����������ο�
HISTSIZE=100000
## ��¸��������ο�
SAVEHIST=100000

# ����ζ�ͭ
setopt share_history

# �ҥ��ȥ��ƤӽФ��Ƥ���¹Ԥ���֤˰�ö�Խ���ǽ
setopt hist_verify

# ����ե�����˻����Ͽ
setopt extended_history

# ɸ����䴰����
autoload -U compinit
compinit

# �ǥ��쥯�ȥ�̾�����Ϥ�������ǥ����ȥǥ��쥯�ȥ���ѹ�
setopt auto_cd

# �ǥ��쥯�ȥꥹ���å���ư����¸
# setopt auto_pushd

# ���֥���Ϣ�Ǥ��䴰�������ɽ��
setopt auto_menu

# ��ư������ǽ(�����ɽ��)
setopt correct

# �䴰�����ͤ��ɽ��
setopt list_packed

# �䴰��������ǥե�����μ��̤��̥ޡ���ɽ��(ls -F �ε���)
setopt list_types

# �ѥ��κǸ���դ�����å����ưŪ�˺�����ʤ�
setopt noautoremoveslash

# = �ʹߤǤ��䴰�Ǥ���褦�ˤ���( --prefix=/usr ���ξ��)
setopt magic_equal_subst

# �ǥ��쥯�ȥ�̾�����ǰ�ư�Ǥ��롣
setopt auto_cd

# �䴰����ꥹ�Ȥ����ܸ��������ɽ��
setopt print_eight_bit

# �䴰�λ�����ʸ����ʸ������̤��ʤ�(â������ʸ�����Ǥä����Ͼ�ʸ�����Ѵ����ʤ�)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ls���ޥ�ɤ��䴰����ˤ⿧�դ�ɽ��
eval `dircolors`
zstyle ':completion:*:default' list-colors ${LS_COLORS}
# kill �θ���ˤ⿧�դ�ɽ��
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

###############################################
# �ץ��ץȴط�                              #
###############################################
# �ץ��ץȤ� escape sequence (�Ķ��ѿ�) ���̤�
setopt prompt_subst

## �ץ��ץȤ�����
autoload colors
colors
PROMPT="%{${fg[blue]}%} %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

setopt transient_rprompt                    # ���ץ��ץȤ����Ϥ�������ä�

# �����ߥʥ�Υ����ȥ�
case "${TERM}" in
kterm*|xterm)
precmd() {
	echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
}
;;
esac

# ü���Υ����ȥ�
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
# t��Ʊ�͡�sudo��û�̤��ͤ�
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
