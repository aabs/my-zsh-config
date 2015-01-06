#!/bin/bash
# a script to ensure that all the machine is set up properly

pushd .
cd ~
## check prerequisites

GIT="`which git`"
if [[ -z $GIT ]]; then
	echo Need git to continue. Please install git first.
	exit;
fi

HB="`which brew`"
if [[ -z $HB ]]; then
	echo Homebrew not found. Installing.
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ -z "`which python`" ]]; then
	echo Python not found. Installing.
	brew install python
fi

if [[ -z "`which pip`" ]]; then
	echo python install failed. please install python by hand and try again.
	exit;
fi
pip install -U cider 
# check that cider installation worked ok
if [[ -z "`which cider`" ]]; then
	echo cider install failed. please install cider by hand and try again. Go to https://github.com/msanders/cider for more info
	exit;
fi


echo follow on.
# install bootstrap
git clone https://aabs@github.com/aabs/my-zsh-config.git my-zsh-config

cider restore
# for good or ill, that will have dumped a mountain of stuff on the local machine.
# now lets move on to getting backed up files back.


REMOTE_DIR_BACKUP=//someserver/dir/dir/andrew-macbook # yeah this is not the real URL
LOCAL_DIR=~/repository
if [ ! -e $REMOTE_DIR_BACKUP ]; then
	echo Unable reach backup location. Please connect drive or network and try again.
	exit;
fi

rsync -av $REMOTE_DIR_BACKUP $LOCAL_DIR

# install git if it is not present

# pull down cider wrapper around homebrew
# pull down my local cider configuration
# install everything in my cider bootstrap spec
# bring all of my source down from wherever it is backed up
# install my crontab table entries for git auto-committing
#sudo crontab $(PWD)/my-zsh-config/bootstrap/crontab.txt

