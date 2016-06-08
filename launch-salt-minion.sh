sed -e "s,\$PWD,$PWD,;s,\$USER,$USER," config/minion.in > config/minion
salt-minion -c config -u $USER --log-level all
