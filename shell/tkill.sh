#!/bin/bash

SYS=""
case `uname` in
    Linux) SYS=linux ;;
    FreeBSD) SYS=fbsd ;;
    *CYGWIN*) SYS=cygwin ;;
    *MINGW*) SYS=mingw ;;
    Darwin) SYS=darwin ;;
esac

if [ "$SYS" == "cygwin" ]; then
    ps -aW | peco | awk {'print $1'} | xargs bb-kill.bat
elif [ "$SYS" == "darwin" ]; then
    ps aux | peco | awk {'print $2'} | xargs kill
elif [ "$SYS" == "linux" ]; then
    ps aux | peco | awk {'print $2'} | xargs kill
else
    echo "Can not regonize your system"
fi
