#!/bin/bash

check_for_program () {
    commandpath="$(command -v $1)"
    if [ -z $commandpath ]; then
        echo "$1 not installed!  Exiting PCB cookiecutter."
        exit 1
    fi
}

# Check for `git`
check_for_program git

# Check for `gh` CLI
check_for_program gh

# Check for `wget`
check_for_program wget

echo "pre-generate"
echo "{{cookiecutter.pid}} is PID"
exit 
