include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_10 (блок_1) 'Таблица умножения' ",0    
.code
Start:
    ConsoleTitle offset T 
    outstrln 'Таблица умножения'
    newline
    mov ECX,9
    mov BL,0
    outstr '   |'
    outint BL,2
    add BL,1
L:  outint BL,3     ; первая строка
    add BL,1
    loop L
    newline
    mov ECX,33
S:  outchar '-'
    loop S
    newline
    mov BL,0
L1: outint BL       ; цикл по строкам
    outstr '  |'
    mov CL,10
    mov BH,0
    outint BH,2
L2: add BH,BL       ; цикл по столбцам      
    outint BH,3
    dec CL
    cmp CL,1
    jNE L2          ; строка еще не закончена
    add BL,1
    newline
    cmp BL,10
    JNE L1          ; таблица еще не закончена
    pause                 
    exit               
end Start
