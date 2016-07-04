docker run -id -p 4505:4505 -p 4506:4506 -v $PWD/master_etc_salt:/etc/salt -v $PWD/master_srv_salt:/srv/salt --name salt_master gtoff/salt_master
