#! /bin/bash

if [ ! $* ]; then exit 1; fi

if [ ! `which at` ];
then
        echo "You don't have \`at\` installed.";
        exit 1;
fi

if [ ! `which notify-send` ];
then
        echo "You don't have \`notify-send\` installed.";
        exit 1;
fi

TICTAC_CONF_PATH="./tictac.conf";
#TICTAC_CONF_PATH="$HOME/.config/tictac.conf";

name=$*;
line=`grep "^$name\s\+[0-9]\+" $TICTAC_CONF_PATH`;
time=`echo $line | sed -E "s/.*([0-9]+)$/\\1/i"`;

echo `which notify-send` "\"$name ! \"" | at now + $time minutes;
