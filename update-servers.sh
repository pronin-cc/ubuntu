#!/bin/bash

# Указываем список серверов, которые необходимо обновить
servers=('192.168.130.137')
# Пользователь с правами sudo для подключения к удаленному серверу
SUDO_USER=

for i in ${servers[@]}
  do
    echo $i
    ssh -t $i -p60123 -l $SUDO_USER 'sudo apt-get update && sudo apt-get dist-upgrade'
    echo '#####'
done
exit
