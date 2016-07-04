#sed -e "s,\$PWD,$PWD,;s,\$USER,$USER," salt/config/master.in > salt/config/master
salt-api --log-level all --pid-file=salt/miscdir/pidfile-api
