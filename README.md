# autostake

Run:</br>
apt install -y expect git && sudo git clone https://github.com/botd0tnet/autostake && cd autostake && nano delegate.sh</br>

Change $WALLET.</br>
Save.</br>

chmod 777 delegate.sh delegate.exp</br>
./delegate.exp

Service:

sudo tee /etc/systemd/system/autostaking.service > /dev/null <<EOF  
[Unit]
Description=Auto Stake</br>
After=network-online.target</br>

[Service]</br>
User=root</br>
Environment=LD_LIBRARY_PATH=/root/autostake</br>
ExecStart=/root/delegate.exp</br>
</br>
[Install]</br>
WantedBy=multi-user.target</br>
EOF</br>


sudo -S systemctl daemon-reload</br>
sudo -S systemctl enable autostaking</br>
sudo -S systemctl start autostaking</br>
