read -p "AD Benutzer Benutzer mit Admin zugriff eingeben:" User
read -p "Passwort eingeben: " $Passwort
yum install realmd -y && yum install chrony -y
systemctl start chronyd.service
echo "[Domain Controller]" >> /etc/hosts
sed -i -e 2c"[TIME SERVER]" /etc/chrony.conf
systemctl restart chronyd.service
echo $Passwort | realm join -U $User [DOMAIN]
