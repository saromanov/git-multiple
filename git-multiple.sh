#!/bin/bash

git_multiple_path=$HOME/gitmultiple
init()
{
    mkdir $git_multiple_path
}

new() 
{
    touch $git_multiple_path/$1
}

list() 
{
    ls -lA $git_multiple_path | awk -F':[0-9]* ' '/:/{print $2}'
}
if [[ $1 == "init" ]]; then
init
elif [[ $1 == "new" ]]; then
new $2
elif [[ $1 == "ls" ]]; then
list
else
echo "invalid command"
fi