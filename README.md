# IHW-1-AVS
Отчет по индивидуальному домашнему заданию №1 по "Архитектуре вычислительных систем"
Владимиров Дмитрий Андреевич, БПИ218
ВАРИАНТ 14
Условие. Сформировать массив B из элементов массива A заменой всех отрицательных значений на максимум из массива A.

На 4 балла:
1. Написан код решения задачи. Исходный код программы на языке С расположен в файле main.c
2. Файл main.c откомпилирован в ассемблерную программу без каких-либо оптимизаторов путем команды > gcc -O0 -Wall -masm=intel -S main.c -o main.s. Результат лежит в файле main.s, в нем в комментариях указана связь переменных в коде на С с действиями с ними в коде на ассемблере.
3. Файл main.c скомпилирован в исполняемый файл main.out путем команды > gcc -O0 -Wall main.c -o main.out.
4. Также файл main.c скомпилирован в ассемблерную программу с учетом оптимизации путем команды > gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions main.c -S -o main_opt.s. Файл main_opt.s тоже прикреплен. 
5. Далее программу main.c скомпилирован в исполняемый файл main_opt.out путем команды > gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions main.c -o main_opt.out.
6. Остается только протестировать оба исполняемых файла. оба файла main.out и main_opt.out прикреплены, поэтому можно убедиться в правильности приведенных данных. avo@avo-VirtualBox:~/avs$ ./main.out 1 2 3 4 5
1 2 3 4 5 
avo@avo-VirtualBox:~/avs$ ./main_opt.out 1 2 3 4 5
1 2 3 4 5 
avo@avo-VirtualBox:~/avs$ ./main.out -1 2 3 0 -2
3 2 3 0 3 
avo@avo-VirtualBox:~/avs$ ./main_opt.out -1 2 3 0 -2
3 2 3 0 3 
avo@avo-VirtualBox:~/avs$ ./main.out
not enough space or empty array
avo@avo-VirtualBox:~/avs$ ./main_opt.out
not enough space or empty array
avo@avo-VirtualBox:~/avs$ ./main.out -1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 -1 -1 -1 
avo@avo-VirtualBox:~/avs$ ./main_opt.out -1 -1 -1 -1 -1 -1 -1
-1 -1 -1 -1 -1 -1 -1 
avo@avo-VirtualBox:~/avs$ ./main.out -5 -6 -3 -2 -7
-2 -2 -2 -2 -2 
avo@avo-VirtualBox:~/avs$ ./main_opt.out -5 -6 -3 -2 -7
-2 -2 -2 -2 -2 
avo@avo-VirtualBox:~/avs$ ./main.out 8 8 9 -1 -1000000 4 5 6
8 8 9 9 9 4 5 6 
avo@avo-VirtualBox:~/avs$ ./main_opt.out 8 8 9 -1 -1000000 4 5 6
8 8 9 9 9 4 5 6 
