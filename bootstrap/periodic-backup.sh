#!/bin/bash
RSYNC=rsync
RSYNC_OPTS= -aqt
REMOTE_DIR_BACKUP=//someserver/dir/dir/andrew-macbook # yeah this is not the real URL
LOCAL_DIR=~/repository

if [ -e $REMOTE_DIR_BACKUP ] && [ -d $REMOTE_DIR_BACKUP ]; then
	$RSYNC $RSYNC_OPTS $LOCAL_DIR $REMOTE_DIR_BACKUP
else
	echo Unable to reach backup location. Skipping backup of $LOCAL_DIR to $REMOTE_DIR_BACKUP
fi