#!/bin/bash

# Указываем список серверов, на которых необходимо создать учетные записи
servers=('192.168.130.137')
# Пользователь с правами sudo для подключения к удаленному серверу
SUDO_USER=

for i in ${servers[@]}
  do
    echo $i
    # Первый способ
    ssh -t $i -l $SUDO_USER -p SSH_PORT 'name=USER; sudo useradd -m -G sudo -s /bin/bash -U $name'
    # Второй способ
    # ssh -t $i -l $SUDO_USER -p SSH_PORT 'name=USER; sudo adduser $name --ingroup sudo' 
    echo '#####'
done
exit
