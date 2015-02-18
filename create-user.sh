#!/bin/bash

servers=('192.168.130.137')

for i in ${servers[@]}
  do
    echo $i
    ssh -t $i -l USER -p60123 'pass=test; name=test; sudo useradd -m -G sudo -s /bin/bash -U $name'
done
