
#!/bin/bash
END='\033[0m' 
Yellow="\033[0;93m[x]" 
set -e

echo $1
echo "restarting docpht service"
REQUEST=$1
SECRET_TOKEN=$(jq -r '.Header."X-My-Secret"[0]' <(echo $REQUEST))
echo $SECRET_TOKEN
if [[ "$SECRET_TOKEN" != "527e107c43" ]]; then
  echo "Incorrect secret token"
  else
    echo "you made it in"
    sudo docker restart docpht-api-docpht-workflow-1
    # sudo docker restart docpht-api-docpht-hapttic-server-1

fi
