#!/bin/bash
# 1. Вывести на экран 3 раза имя пользователя, от которого запускается команда.

username=$(whoami)
for ((i=1; i < 4; i++))
do
    echo $username
done

# 2. Вывести с помощью цикла while все четные числа от 0 до 100 включительно.

i=0
while [ $i -le 100 ]
do
  if [ $(($i%2)) -eq 0 ]
	  then echo $i
  fi
  let i+=1
done

# 3. Создать с помощью nano файл test.txt. Настроить автоматический бэкап  этого файла раз в 10 минут в файл с названием test.txt.bak с использованием cron.

crontab -e
# */10 * * * * cp /home/tenebrae/Geekbrains/linux/test.txt /home/tenebrae/Geekbrains/linux/test.txt.backup
tail -f /var/log/syslog | grep -i cron
