#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install jabba for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

LIGHT_GREEN='\033[1;32m'
CLEAR='\033[0m'

function jabba::dependences {
    echo -e "${CLEAR}${LIGHT_GREEN}Check Dependences for Jabba${CLEAR}"
}

function jabba::install {
    echo -e "${CLEAR}${LIGHT_GREEN}Installing Jabba${CLEAR}"
    curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
}

function jabba::post_install {
    echo -e "${CLEAR}${LIGHT_GREEN}Post Install for Jabba${CLEAR}"
}


function jabba::load {
    [[ -s "$HOME/.jabba/jabba.sh" ]] && source "$HOME/.jabba/jabba.sh"
}

jabba::load

if (( ! $+commands[jabba] )); then
    jabba::dependences
    jabba::install
    jabba::post_install
fi
