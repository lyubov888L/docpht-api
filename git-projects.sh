#!/bin/bash
END='\033[0m' 
Yellow="\033[0;93m[x]" 
set -e


if [ $1 == "-install-docpht" ]; then 
    echo -e "${Yellow}Installing docpht.${END}">&2
    # cd ~/workflow/services/docpht_docker/
    if [ -d "docpht" ]; then
        echo -e "${Yellow}docpht folder exists.${END}">&2
        if [ -f "./docpht/Dockerfile" ]; then
            echo -e "${Yellow}found Dockerfile.${END}">&2
            exit
        else
            echo -e "${Yellow}no Dockerfile found.${END}">&2
            sudo rm -rf ./docpht/Dockerfile
            cd ~/docpht-api/
            git clone https://github.com/docpht/docpht.git
        fi
    else
        echo -e "${Yellow}docpht folder does not exist.${END}">&2
        git clone https://github.com/docpht/docpht.git
    fi
fi



if [ $1 == "-install-hapttic" ]; then 
    echo -e "${Yellow}Installing hapttic.${END}">&2
    # cd ~/workflow/services/docpht_docker/
    if [ -d "hapttic" ]; then
        echo -e "${Yellow}docpht folder exists.${END}">&2
        if [ -f "./docpht/Dockerfile" ]; then
            echo -e "${Yellow}found Dockerfile.${END}">&2
            exit
        else
            echo -e "${Yellow}no Dockerfile found.${END}">&2
            sudo rm -rf ./hapttic/Dockerfile
            cd ~/docpht-api/
            git clone https://github.com/jsoendermann/hapttic.git
            # git clone https://github.com/Nllii/hapttic.git
        fi
    else
        echo -e "${Yellow}docpht folder does not exist.${END}">&2
        git clone https://github.com/jsoendermann/hapttic.git
        # git clone https://github.com/Nllii/hapttic.git

    fi
fi

exit

