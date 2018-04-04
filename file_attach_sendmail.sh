#!/bin/bash

ATTACH_FILE=

MAILING_LIST=(
# example.com
# example.com
)
MAIL_SUBJECT=""
MAIL_BODY=""

MAIL_BOUNDARY="BOUNDARY"

sendmail -t << EOF
To: ${MAILING_LIST[*]}
Subject: ${MAIL_SUBJECT}
MIME-Version: 1.0
Content-type: multipart/mixed; boundary=${MAIL_BOUNDARY}
Content-Transfer-Encoding: 7bit

--${MAIL_BOUNDARY}
Content-type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit

`echo ${MAIL_BODY}`

--${MAIL_BOUNDARY}
Content-type: text/plain;
 name=${ATTACH_FILE}
Content-Transfer-Encoding: base64
Content-Disposition : attachment;
 filename=${ATTACH_FILE}

`cat ${ATTACH_FILE} | base64`

--${MAIL_BOUNDARY}--
EOF
