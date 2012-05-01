# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

COMPLETION_WAITING_DOTS="true"
plugins=(ant arch compleat git github kate lol mercurial nyan pip python svn wakeonlan)
setopt completealiases

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_theme

if [ -f ~/.zsh_nocorrect ]; then
	while read -r COMMAND; do
		alias $COMMAND="nocorrect $COMMAND"
	done < ~/.zsh_nocorrect
fi

alias ssh='autossh -M $(($RANDOM%10000+30000))'
alias scp='scp -r'
alias rsync='rsync -ru --progress'
alias man="TERMINFO=~/.terminfo/ LESS=C TERM=mostlike PAGER=less man"
alias rc.d='sudo rc.d'
alias powertop2='sudo powertop2'

export EDITOR=nano # Don't judge me!
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
