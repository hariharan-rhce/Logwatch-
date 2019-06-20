# !/bin/bash

yum install logwatch  -y

read -p 'Domain name: ' host
echo "$host"
sed -i 's/MailFrom = Logwatch/MailFrom = Logwatch@'"$host"'/g' /usr/share/logwatch/default.conf/logwatch.conf

sed -i 's/MailTo = root/MailTo = itsupport@ephronsystems.com, hariharan@ephronsystems.com, maneesh@ephronsystems.com/g' /usr/share/logwatch/default.conf/logwatch.conf
#sed -i 's/MailFrom = Logwatch/MailFrom = Logwatch@$host/g' /usr/share/logwatch/default.conf/logwatch.conf
sed -i 's/Range = yesterday/Range = Today/g' /usr/share/logwatch/default.conf/logwatch.conf
sed -i 's/Detail = Low/Detail = Med/g' /usr/share/logwatch/default.conf/logwatch.conf
logwatch

