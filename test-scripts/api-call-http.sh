## Note:
## This works, but only with salt-netapi.diff applied.

api=`grep ^saltapi roboreg.ini | cut -d "=" -f 2 | xargs`

tmp=`tempfile`

http --headers $api/login username=ecrp password=s3cr3t eauth=auto | tee $tmp
token=`grep ^X-Auth-Token $tmp | cut -d ":" -f 2 | tr -d ' ' | tr -d '\r'`

echo "TOKEN: [$token]"

http $api X-Auth-Token:$token client=local tgt='*' fun=ros.introspec
