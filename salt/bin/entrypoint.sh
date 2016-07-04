export USER=root
./launch-salt-master.sh &
sleep 2
./launch-salt-api.sh
