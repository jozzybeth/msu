include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_2 (блок_1) 'Простое число' ",0    
S   db "СОСТАВНОЕ",0,"ПРОСТОЕ",0
N   dd ?
.code
Start:
    ConsoleTitle offset T 
    inintln N, 'Введите целое б/зн из диапазона [0 .. 4294967295]: '                    
    mov ESI, offset S
    mov EBP, N
    cmp EBP,3
    jB L            ; число меньше 3 => простое
    mov EAX, EBP
    mov EDX, 0      ; N полностью в EAX, N dd
    mov ECX, 2      ; ECX - делитель
    div ECX         ; EAX = div
    mov EBX, EAX    ; N div 2 - 1 - максимальное кол-во шагов в цикле
E:  cmp EDX,0
    jE F            ; mod = 0
    inc ECX
    cmp EBX, ECX
    jB L            ; делителей не нашлось за макс. кол-во шагов
    mov EDX,0
    mov EAX,EBP
    div ECX         ; EAX = div, EDX = mod
    jmp E
L:  add ESI,10   
F:  outstrln ESI   
    pause                 
    exit               
end Start
