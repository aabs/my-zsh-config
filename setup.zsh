export GOPATH=$HOME/dev/go/active/go
# export GOPATH=/Users/andrewmatthews/dev/go
export TPDIR=/Users/andrewmatthews/Dropbox
export M3_HOME=/usr/local/Cellar/maven/3.3.1
export M3=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
# export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$M2:/usr/local/bin:$PATH
export PATH="$M3:/usr/local/git/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/Users/andrewmatthews/repository/personal/dev/packer/packer_0.7.5_darwin_amd64"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin:/Users/andrewmatthews/q
export PATH=$PATH:/Users/andrewmatthews/repository/personal/dev/tools/goat-v1.0.5
export MONO_GAC_PREFIX="/usr/local"
source dnvm.sh

# source $(brew --prefix nvm)/nvm.sh

# ------------------------------------------------------------------------------------------------
#  Some useful little aliases for tools I use a lot
# ------------------------------------------------------------------------------------------------
alias USM='open -a Safari.app https://goto.unisuper.com.au'
alias music='pianobar'
alias go="goat_darwin_amd64"

# ------------------------------------------------------------------------------------------------
# Cryptocurrency accounts helper commands
# ------------------------------------------------------------------------------------------------
export DATEFMT='%Y-%m-%d'
export FINANCE_DIR='~/Dropbox/Finance'
alias ac="ledger -f $FINANCE_DIR/crypto.ledger --date-format $DATEFMT -W --price-db $FINANCE_DIR/price.db"
alias bal="ledger -f $FINANCE_DIR/crypto.ledger --price-db $FINANCE_DIR/price.db -w --flat bal"

# ------------------------------------------------------------------------------------------------
# Task management with todo.sh
# ------------------------------------------------------------------------------------------------
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
export TODOTXT_DEFAULT_ACTION=ls

alias t='todo.sh -N'
alias task='t add'
alias tasks='t list'
alias projects='t lsprj'

# ------------------------------------------------------------------------------------------------
# Simple time-saver for creating dir and then moving into it
# ------------------------------------------------------------------------------------------------

make-cd() {
	mkdir -p $1
	cd $1
}

alias mcd='make-cd'

# ------------------------------------------------------------------------------------------------
# vi-mode setup (as per http://dougblack.io/words/zsh-vi-mode.html)
# ------------------------------------------------------------------------------------------------
bindkey -v

# ------------------------------------------------------------------------------------------------
#  Some nice git-centric prompt fiddling
# ------------------------------------------------------------------------------------------------
source $MYCONF/clauswitt.zsh-theme


# docker and boot2docker configurations

## first start boot2odocker if it is not running already
boot2docker shellinit

## gthen configure it to run without TLS (to work around cert issues introduced in docker 1.7 on mac)
export DOCKER_HOST=tcp://192.168.54.103:2376
export DOCKER_CERT_PATH=/Users/andrewmatthews/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
# unset DOCKER_TLS_VERIFY
# unset DOCKER_CERT_PATH

## now set up some aliasas to make it easier to remove containers and images en masse.
alias rmdockercontainers="docker rm -f $(docker ps -a -q)"
alias rmdockerimages="docker rmi -f $(docker images -q)"
alias dockercleanup="rmdockercontainers && rmdockerimages"
# alias rmdockercontainers="docker ps -a -q | xargs -n 1 -I {} docker rm {}"
# alias rmdockerimages="docker rmi -f $(docker images | grep 'ago' | tr -s ' ' | cut -d ' ' -f 3)"
alias cleanupdocker="rmdockercontainers; rmdockerimages"

