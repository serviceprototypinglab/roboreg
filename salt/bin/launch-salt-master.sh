#sed -e "s,\$PWD,$PWD,;s,\$USER,$USER," /etc/salt/master.in > /etc/salt/master
#sed -e "s,%PATH%,$PWD," /srv/salt/_modules/ros.py.in > /srv/salt/_modules/ros.py
cp /etc/salt/master.in /etc/salt/master
mkdir -p /etc/salt/pki/master/
cp /tmp/etc/salt/pki/master/* /etc/salt/pki/master/
salt-master --log-level all
