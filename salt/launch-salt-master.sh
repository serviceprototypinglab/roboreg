sed -e "s,\$PWD,$PWD,;s,\$USER,$USER," config/master.in > config/master
sed -e "s,%PATH%,$PWD," modules/ros.py.in > modules/ros.py
salt-master -c config -u $USER --log-level all
