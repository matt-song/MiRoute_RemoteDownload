# MiRoute_RemoteDownload

Step#1 Install arai2 on Miroute.

Step#2 Install http service on any vps

yum -y install cpan

cpan -> install CGI

  183  bash initialize_DB.sh
  184  bash generate_test_data.sh

 cat /usr/lib/systemd/system/httpd.service | grep PrivateTmp
PrivateTmp=false

disable selinux
