include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_3 (блок_2) 'Картинка' ",0   
S   db 20 dup ('-'),0

.code
Start:
    ConsoleTitle offset T 
    inintln ECX, 'Введите целое число K: '
    mov S[ECX],0
L:  mov S[ECX-1],'*'    ;на каждом шаге добавляем новую звездочку
    outstrln offset S
    dec ECX
    cmp ECX,0
    jNE L                  
    pause                 
    exit               
end Start
