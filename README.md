# autostake

Run:</br>
apt install -y expect git && sudo git clone https://github.com/botd0tnet/autostake && cd autostake && nano delegate.sh</br>

Change $WALLET.</br>
Save.</br>

chmod 777 delegate.sh delegate.exp</br>
cd

screen -S Umee

cd autostake</br>
  for(( i=1; i <=9999; i++ ))<br/>
  do<br/>
    ./delegate.exp<br/>
  done<br/>

