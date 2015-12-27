#!/bin/bash

#Configure servers
SERVER1=imap.source.com
SERVER2=imap.gmail.com

#Uncomment to hide folder sizes
#FAST="--nofoldersizes" 

#Uncomment to do a dry run (no actual changes)
#DRY="--dry" 

#Uncomment to just sync folders (no messages)
#JUSTFOLDERS="--justfolders" 

#Uncomment to just connect (no syncs at all)
#JUSTCONNECT="--justconnect" 

#Set the path to your imapsync binary
imapsync=imapsync

#Users file
if [ -z "$1" ]
then
echo "No users text file given." 
exit
fi

if [ ! -f "$1" ]
then
echo "Given users text file \"$1\" does not exist" 
exit
fi

{ while IFS=';' read  u1 p1 u2 p2; do

$imapsync --usecache --tmpdir /var/tmp \
--host1 ${SERVER1} --user1 "$u1" \
--password1 "$p1" --ssl1 \
--host2 ${SERVER2} \
--port2 993 --user2 "$u2" \
--password2 "$p2" --ssl2 \
${FAST} ${DRY} ${JUSTFOLDERS} ${JUSTCONNECT} \
--regextrans2 's{Sent$}{[Gmail]/Sent Mail}' \
--regextrans2 's{Sent Items$}{[Gmail]/Sent Mail}' \
--regextrans2 's{Sent Messages$}{[Gmail]/Sent Mail}' \
--regextrans2 's{Drafts$}{[Gmail]/Drafts}' \
--exclude 'INBOX.Trash|INBOX.spam|INBOX.Apple Mail To Do'

done ; } < $1