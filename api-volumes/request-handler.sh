
#!/bin/bash
END='\033[0m' 
Yellow="\033[0;93m[x]" 
set -e
echo "restarting docpht service"
REQUEST=$1
SECRET_TOKEN=$(jq -r '.Header."X-My-Secret"[0]' <(echo $REQUEST))
if [[ "$SECRET_TOKEN" != "SECRET" ]]; then
    echo "you made it in"
    else
    echo "Incorrect secret token"
fi
