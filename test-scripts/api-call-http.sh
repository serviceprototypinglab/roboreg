## Note:
## This works, but only with salt-netapi.diff applied.

api=`grep ^saltapi roboreg.ini | cut -d "=" -f 2 | xargs`
user=`grep ^username roboreg.ini | cut -d "=" -f 2 | xargs`
pass=`grep ^password roboreg.ini | cut -d "=" -f 2 | xargs`
eauth=`grep ^eauth roboreg.ini | cut -d "=" -f 2 | xargs`

tmp=`tempfile`

http --headers $api/login username=$user password=$pass eauth=$eauth | tee $tmp
token=`grep ^X-Auth-Token $tmp | cut -d ":" -f 2 | tr -d ' ' | tr -d '\r'`

echo "TOKEN: [$token]"

http $api X-Auth-Token:$token client=local tgt='*' fun=ros.introspec
