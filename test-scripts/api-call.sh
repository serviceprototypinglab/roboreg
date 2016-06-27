# call with 'salt-api -c config'/'launch-salt-api.sh' running

# using PAM - would require root
#curl -sS -i -H "Content-Type: application/json" -d "[{\"tgt\": \"*\", \"fun\": \"test.ping\", \"client\": \"local\", \"eauth\": \"pam\", \"username\": \"roboreg\", \"password\": \"roboreg\"}]" localhost:8001

# using PKI - would require CRT files in addition to PEM/PUB
#curl -sS -i -H "Content-Type: application/json" -d "[{\"tgt\": \"*\", \"fun\": \"test.ping\", \"client\": \"local\", \"eauth\": \"pki\", \"username\": \"roboreg\", \"password\": \"roboreg\"}]" localhost:8001

# using shared secret... poor but still not working?
#curl -sS -i -H "Content-Type: application/json" -d "[{\"tgt\": \"*\", \"fun\": \"test.ping\", \"client\": \"local\", \"eauth\": \"sharedsecret\", \"username\": \"roboreg\", \"password\": \"s3cr3t\"}]" localhost:8001
#curl -sS -i -H "Content-Type: application/json" -d "[{\"tgt\": \"*\", \"fun\": \"test.ping\", \"client\": \"local\", \"eauth\": \"sharedsecret\", \"username\": \"roboreg\", \"sharedsecret\": \"s3cr3t\"}]" localhost:8001

# using auto which should always work
curl -sS -i -H "Content-Type: application/json" -d "[{\"tgt\": \"*\", \"fun\": \"test.ping\", \"client\": \"local\", \"eauth\": \"auto\", \"username\": \"roboreg\", \"sharedsecret\": \"s3cr3t\"}]" localhost:8001

#curl -sS http://localhost:8001/login -H "Accept: application/x-yaml" -d username=roboreg -d password=s3cr3t -d eauth=auto
