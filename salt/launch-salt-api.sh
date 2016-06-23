sed -e "s,\$PWD,$PWD,;s,\$USER,$USER," config/master.in > config/master
salt-api -c config --log-level all --pid-file=miscdir/pidfile-api
