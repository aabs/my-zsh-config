export GOPATH=/Users/andrewmatthews/dev/go
export TPDIR=/Users/andrewmatthews/Dropbox
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/andrewmatthews/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.2
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$M2:/usr/local/bin:$PATH
export PATH="/usr/local/git/bin:/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin:/usr/local/apache-maven/apache-maven-3.2.2/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin

source $(brew --prefix nvm)/nvm.sh

# ------------------------------------------------------------------------------------------------
#  Some useful little aliases for tools I use a lot
# ------------------------------------------------------------------------------------------------
alias USM='open -a Safari.app https://goto.unisuper.com.au'
alias music='pianobar'

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
	mkdir $1
	cd $1
}

alias mcd='make-cd'

# ------------------------------------------------------------------------------------------------
# Docker commands for cleaning up containers and images (needs work)
# ------------------------------------------------------------------------------------------------

docker-ip() {
  boot2docker ip 2> /dev/null
}

alias rmdockercontainers="docker ps -a -q | xargs -n 1 -I {} docker rm {}"
# alias rmdockerimages="docker rmi -f $(docker images | grep 'ago' | tr -s ' ' | cut -d ' ' -f 3)"
alias cleanupdocker="rmdockercontainers; rmdockerimages"

# ------------------------------------------------------------------------------------------------
# vi-mode setup (as per http://dougblack.io/words/zsh-vi-mode.html)
# ------------------------------------------------------------------------------------------------
bindkey -v

# ------------------------------------------------------------------------------------------------
#  Some nice git-centric prompt fiddling
# ------------------------------------------------------------------------------------------------
source $MYCONF/clauswitt.zsh-theme
