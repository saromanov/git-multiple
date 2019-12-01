#!/bin/bash

git_multiple_path=$HOME/.config/gitmultiple
init()
{
    mkdir $git_multiple_path
    echo "config file is initialized at $git_multiple_path"
}

new() 
{
    touch $git_multiple_path/$1
}

list() 
{
    exist_config
    ls -lA $git_multiple_path | awk -F':[0-9]* ' '/:/{print $2}'
}

add() 
{
    exist_config
    filename=$git_multiple_path/$1
    if [ -f "$filename" ]; then
        echo $2 >> $filename
    else
        echo "File does not exist"
    fi
}

exist_config()
{
    if [ ! -d "$git_multiple_path" ]; then
        echo "Config file is not initialized"
    fi
}

execute() 
{
    exist_config
    filename=$git_multiple_path/$1
    while read line; do
        cd $line
        $2
        cd -
    done < $filename
}

info()
{
    echo "List of commands:"
    echo "git-multiple init - Initialization of the project at the $HOME/.config file"
    echo ""
    echo "git-multiple new <name> - Creating of teh new project"
    echo ""
    echo "git-multiple ls - List of the projects"
    echo ""
    echo "git-multiple add <project name> <path> - Adding path to project"
    echo ""
    echo "git-multiple exec <project name> <git command> - Executing of the git command"
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
info
fi