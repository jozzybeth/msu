include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_5 (блок_1) 'Произведение старшей и младшей десятичных цифры' ",0    
.code
Start:
    ConsoleTitle offset T 
    inint EAX,'Введите целое б/зн из диапазона [0 .. 4294967295]: ' 
    mov EDX,0 
    mov EBX, 10
    div EBX; EDX = mod, EAX = div
    mov ECX, EDX; ECX - младшая цифра
    mov EBP, EAX; сохраним div
    mov EAX, EDX; пусть число из одной цифры => младшая = старшая
    cmp EBP, 0
    jE F; число из одной цифры
    mov EAX, EBP; возвращаем целую часть
L:  mov EDX, 0
    div EBX; EDX = mod, EAX = div 
    cmp EAX,0
    jNE L; еще не добрались до последней цифры 
    mov EAX, EDX; старшая цифра находится в последнем остатке
F:  mul ECX
    outintln AL,,'Произвдение старшей и младшей цифры = '
    pause                 
    exit               
end Start
