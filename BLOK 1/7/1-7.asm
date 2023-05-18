include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_7 (блок_1) 'Ближайшее число, кратное семи' ",0    
.code
Start:
    ConsoleTitle offset T  
    inintln EBX,'Введите число из диапазона [0 .. 4294967295]: '
    mov ECX,7; ECX - делитель
    mov EAX,EBX; подготовка к делению
    mov EDX,0
    div ECX; EDX = mod
    cmp EDX,0; число делится на 7 => сразу вывод
    jE F
    cmp EDX, 4;     
    jB B;остаток < 4
    sub ECX,EDX; остаток >= 4 => числу не хватает (7-ост) до деления на 7
    add EBX, ECX
    jmp F
B:  sub EBX,EDX; вычитаем остаток  
F:  outwordln EBX,,'Ближайшее число, кратное семи = '
    pause                 
    exit               
end Start
