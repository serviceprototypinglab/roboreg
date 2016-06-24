sed -e "s,\$PWD,$PWD,;s,\$USER,$USER," salt/config/minion.in > salt/config/minion
salt-minion -c salt/config -u $USER --log-level all
