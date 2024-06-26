#! /usr/bin/bash

# expect 2 variables collection and environment.json
if [[ $# != 2 ]]
then
    echo please provide both collection.json and environmental.json - Invalid Argument
    exit 22
fi

# checking files
for file_paths in $@
do

    if ! [ -f $file_paths ]
    then
        echo please provide correct files collection.json and environmental.json - No Such File or Directory
        exit 2
    fi

    echo - File: $file_paths recieved

done

# checking the newman and npm installled or not
npm --version &> /dev/null
if ! [ $? -eq 0 ]
then
    echo
    echo - no npm ---\> installing for you
    sudo apt update 
    sudo apt install nodejs
    sudo apt install npm    
fi

newman --version &> /dev/null

if ! [ $? -eq 0 ]
then
    echo
    echo - no newman ---\> installing for you
    npm install newman
    
fi

echo
echo - npm there
echo - newman there

echo
echo running the newman
newman run $1 -e $2 -d tests.json --bail

if ! [ $? -eq 0 ]
then
    echo
    echo - Tests were failed in newman - Programming error
    echo   
    exit 88 
fi