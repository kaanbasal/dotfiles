#!/bin/bash

current_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

which -s brew
if [[ $? != 0 ]] ; then
    echo 'Installing brew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo 'Updating brew'
    brew update
fi


brew bundle --file=${current_path}/Brewfile

sudo bash -c "echo /usr/local/bin/bash >> /etc/shells"
chsh -s "/usr/local/bin/bash"
