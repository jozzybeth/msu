include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_4 (блок_1) 'Дробь P/Q' ",0    
P   dd ?
Q   dd ?
.code
Start:
    ConsoleTitle offset T 
    inintln P, 'Введите  P - целое б/зн из диапазона [0 .. 4294967295]: '  
    inintln Q, 'Введите  Q - целое б/зн из диапазона [1 .. 4294967295]: '
    outstr 'Дробь P/Q = '
    mov EAX,P
    mov EDX,0
    mov EBX,Q
    div EBX     ; EAX = div, EDX = mod
    outword EAX ; вывод целой части
    outchar '.' 
    mov ECX,5   ; количество шагов цикла = 5
    mov EBP,10  ; подготовка множителя
L:  mov EAX,EDX
    mul EBP     ; EAX * EBP = (EDX,EAX)
    div EBX     ; EAX = div, EDX = mod
    outint EAX  ; вывод целой части
    loop L
    pause                 
    exit               
end Start
