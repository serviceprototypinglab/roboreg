sed -e "s,\$PWD,$PWD,;s,\$USER,$USER," config/master.in > config/master
salt-master -c config -u $USER
