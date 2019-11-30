#!/bin/bash

init()
{
    mkdir $HOME/gitmultiple
}
if [[ $1 == "init" ]]; then
init
else
echo "invalid command"
fi