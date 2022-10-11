#!/bin/bash
#backup para algum chat/grupo do telegram
/bin/telegram -f "1496646298" "/root/bots" "bot1" "Backup feito as: $(date +%F\ %T)" >> /root/botbackup1.log

#Removendo o arquivo de log do diretorio root

rm -r botbackup1.log
