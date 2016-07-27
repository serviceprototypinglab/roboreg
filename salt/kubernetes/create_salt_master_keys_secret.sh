#!/bin/sh
kubectl create secret generic ssh-keys-salt-master --from-file=master/master.pem --from-file=master/master.pub
