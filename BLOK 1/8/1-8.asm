include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_8 (блок_1) 'Алгебраическая сумма' ",0    
.code
Start:
    ConsoleTitle offset T  
    outstrln 'Введите текст: d1 ± d2 ± ... ± dk, в конце поставьте точку '
    mov EAX,0; EAX = 0
    mov EBX,0; EBX = 0
    inchar BL; BL - код цифры
    sub BL,'0'; BL - цифра
    add EAX,EBX; обработка первой цифры
L:  inchar CL; CL - знак
    cmp CL,'.'
    jE F; строка закончилась
    inchar BL; BL - код цифры
    sub BL,'0'; BL - цифра
    cmp CL,'+'
    jE PLUS; выполняется сложение
    sub EAX,EBX; выполняется вычитание
    jmp L
PLUS:  
    add EAX,EBX
    jmp L
F:  outint EAX,,'Значение алгебраической суммы = '
    pause                 
    exit               
end Start
