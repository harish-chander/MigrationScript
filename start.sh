
#Configure User
SERVER1=secure.emailsrvr.com
UNAME1=ella@mahiki.ae
PWORD1=Logmein1
UNAME2=testit@zen.ae
PWORD2=Logmein10
 
#Blank this out if you want to see folder sizes
HIDE="--nofoldersizes --skipsize"
 
imapsync --syncinternaldates -justfolders --useheader 'Message-Id' \
--host1 ${SERVER1} --user1 ${UNAME1} \
--password1 ${PWORD1} --ssl1 \
--host2 imap.googlemail.com \
--port2 993 --user2 ${UNAME2} \
--password2 ${PWORD2} --ssl2 \
--authmech1 LOGIN --authmech2 LOGIN --split1 200 --split2 200 ${HIDE} \
--exclude 'INBOX.Drafts|INBOX.Trash|INBOX.spam|INBOX.Sent|INBOX.Sent Messages'

