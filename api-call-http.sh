## Note:
## This works, but only with salt-netapi.diff applied.

tmp=`tempfile`

http --headers localhost:8001/login username=ecrp password=s3cr3t eauth=auto | tee $tmp
token=`grep ^X-Auth-Token $tmp | cut -d ":" -f 2 | tr -d ' ' | tr -d '\r'`

echo "TOKEN: [$token]"

http localhost:8001 X-Auth-Token:$token client=local tgt='*' fun=ros.introspec
