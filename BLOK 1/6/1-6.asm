include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_6 (блок_1) 'Пятеричное число' ",0    
.code
Start:
    ConsoleTitle offset T 
    outstrln 'Введите число в пятеричной сс из диапазона [0 .. 32244002423140], в конце поставьте пробел' 
    mov ECX, 5
    mov EAX, 0
L:  mov EBX, 0
    inchar BL; чтение символа
    cmp BL,' '
    jE F; число закончилось
    sub EBX,'0'; получили число через код символа
    mul ECX; EAX*ECX = (EDX,EAX), но ответ укладывается в EAX 
    add EAX, EBX; EAX := EAX + EBX
    jmp L; схема: EAX = (EAX*5 + EBX)*5 + EBX и т.д.
F:  outwordln EAX,,'Десятичное число = '
    pause                 
    exit               
end Start
