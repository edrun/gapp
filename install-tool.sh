#!/bin/bash

DEST=/usr/bin/gpack
SOUR=./
SOFT=gPack_alpha1

if [ $# -ne 0 ]; then
   cat << ENTER
   Usage:$0 --install/--unstall
ENTER
fi

rm_file(){
    if [ -f /usr/bin/$SOFT ]; then
       rm -vf /usr/bin/$SOFT
    else
       echo "$SOFT not exists."
       exit 0
    fi
}

cp_file(){
   cp -vf $SOUR$SOFT $DEST
}

install_ap(){
    if [ -f $SOUR$SOFT ]; then
       if [ ! -x $SOUR$SOFT ]; then
           chmod +x $SOUR$SOFT
           cp_file
           echo "Install done."
       else 
           cp_file
           echo "Install done."
       fi
    else
       echo "$SOFT ,no this file,plz check again."
       exit 0
    fi
}

case $1 in
--install) install_ap                   
         ;;
--uninstall) rm_file
           ;;
*) echo "not correct commands,please check now."
   exit 0
;;
           

 
