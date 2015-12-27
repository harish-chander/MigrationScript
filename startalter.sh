#!/bin/bash
##############################################################
#    Script Made By Harish Chander -- harish.chander@zen.ae  #
#    IT Support Zen Interactive Technologies                 #
#    Migrating Mails from Getamail to Google Apps            # 
#    This Script Uses IMAPSYNC AND PERL MAIL SCRIPT          #
##############################################################

#  Server Configurations
## Source Server
SERVER1=secure.emailsrvr.com
#Comment the below line if the Mail server uses a custom PORT (IMAP)
#PORT1 = 993
# Comment out the below line if the IMAP server Uses SSL
#SSL1 = "--ssl1"
## Destination Server
SERVER2=imap.gmail.com
#Comment the below line if the Mail server uses a custom PORT (IMAP)
PORT2=993
# Comment out the below line if the IMAP server Uses SSL
SSL2="--ssl2"

# User Configurations
## Source Account Credentials
UNAME1=ella@mahiki.ae
PWORD1=Logmein1
## Destination Account Credentials
UNAME2=testit@zen.ae
PWORD2=Logmein10

# Blank this out if you want to see folder sizes
HIDE="--nofoldersizes --skipsize"

# Exit Variable Need for gmail migration as there is a qoute set by GOOGLE
MAXEXIT="--exitwhenover 500000000"

# Split the  Mails into 200/200 segemnt and migrate to Streamline the load 
# and similatanious connection
SPLIT="--split1 200 --split2 200"

## Comment OUT Below Line if you want to run the script without affecting/tranfing the data
#DRY="--dry"

## Comment out this Below Line if you want to just Sync the folders and not the mails
#FOLDERS="--justfolders"


## Actual Commend Execution
imapsync ${HIDE} ${DRY} ${FOLDERS}\
		 --host1 ${SERVER1} ${SSL1} ${PORT1} \
         --user1 ${UNAME1} \
         --password1  ${PWORD1} \
         --host2 ${SERVER2} ${SSL2} ${PORT2} \
         --user2 ${UNAME2} \
         --password2  ${PWORD2} \
         ${SPLIT} \
         ${MAXEXIT} \
         --exclude "\[Gmail\]$" \
         --addheader \
         --regextrans2 "s,^Sent$,[Gmail]/Sent Mail," \
         --regextrans2 "s,^Sent Messages$,[Gmail]/Sent Mail," \
         --regextrans2 "s,^Drafts$,[Gmail]/Drafts," \
         --regextrans2 "s,^spam$,[Gmail]/Spam," \
         --regextrans2 "s,^Trash$,[Gmail]/Trash,"