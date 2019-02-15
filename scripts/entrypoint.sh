#!/bin/bash

#set -e


echo '
server.document-root = "'${ROOT}'"
server.port = '${PORT_HTTP}'
dir-listing.activate = "enable"
server.dir-listing = "enable"
' > /etc/lighttpd.conf

echo "
listen=YES
local_enable=NO
anonymous_enable=YES
no_anon_password=YES
anon_upload_enable=YES
anon_mkdir_write_enable=YES
anon_other_write_enable=YES
anon_world_readable_only=YES
anon_upload_enable=YES
file_open_mode=0777
write_enable=YES
anon_root=${ROOT}
listen_port=${PORT_FTP}
ssl_enable=NO
" > /etc/vsftpd.conf

mkdir /var/run/vsftpd
mkdir /var/run/vsftpd/empty
touch ${ROOT}/empty.txt

lighttpd -f /etc/lighttpd.conf &
vsftpd /etc/vsftpd.conf

sleep infinity
