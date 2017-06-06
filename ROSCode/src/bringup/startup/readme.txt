cd 
sudo cp mobilebase-start /usr/sbin/
sudo chmod +x /usr/sbin/mobilebase-start


sudo cp mobilebase-stop /usr/sbin/
sudo chmod +x /usr/sbin/mobilebase-stop


sudo cp mobilebase-restart /usr/sbin/
sudo chmod +x /usr/sbin/mobilebase-restart

sudo cp  mobilebase.service /lib/systemd/system/


----------
sudo systemctl start mobilebase.service
sudo systemctl stop mobilebase.service

systemctl is-enabled mobilebase.service

sudo systemctl enable mobilebase.service
sudo systemctl disable mobilebase.service
