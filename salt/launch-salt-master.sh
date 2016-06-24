sed -e "s,\$PWD,$PWD,;s,\$USER,$USER," salt/config/master.in > salt/config/master
sed -e "s,%PATH%,$PWD," salt/modules/ros.py.in > salt/modules/ros.py
salt-master -c salt/config -u $USER --log-level all
