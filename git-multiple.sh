#!/bin/bash

git_multiple_path=$HOME/.config/gitmultiple
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

add() 
{
    filename=$git_multiple_path/$1
    if [ -f "$filename" ]; then
        echo $2 >> $filename
    else
        echo "File does not exist"
    fi
}

execute() 
{
    filename=$git_multiple_path/$1
    while read line; do
        cd $line
        $2
        cd -
    done < $filename
}
if [[ $1 == "init" ]]; then
init
elif [[ $1 == "new" ]]; then
new $2
elif [[ $1 == "ls" ]]; then
list
elif [[ $1 == "add" ]]; then 
add $2 $3
elif [[ $1 == "exec" ]]; then 
execute $2 "$3"
else
echo "invalid command"
fi