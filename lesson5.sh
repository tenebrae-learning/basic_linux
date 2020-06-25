# 2. Найти все программы с расширением .py
# Находим все файлы .py в текущей директории и поддиректориях за последние 24 часа и передаем их на tail
sudo find -type f -mtime 0 -name *.py | xargs tail
# 3. * Создать и запустить программу на Python, выводящую числа от 0 до 100 включительно.
# Запустить htop во время выполнения программы и найти выполняемую программу в списке процессов, используя
# поиск по ключевому слову python (использовать средства поиска htop).
vim numbers.py
#   #!/usr/bin/python3
#   from time import sleep

#   for i in range(1, 101):
#       print(i)
#       sleep(2)

chmod u+x numbers.py
./numbers.py >/dev/null &
jobs
# [1]  + running    ./numbers.py > /dev/null
htop
