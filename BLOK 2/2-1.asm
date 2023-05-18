include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_1 (блок_2) 'Первые вхождения' ",0   
LAT db 'Z' - 'A' + 1 dup (0)

.code
Start:
    ConsoleTitle offset T 
    outstrln 'Введите текст из больших латинских букв, заканчивающийся точкой:'
    mov EAX,0
L:  inchar AL
    cmp AL,'.'
    jE F
    cmp LAT[EAX - 'A'],0 
    jNE next
    outchar AL
    mov LAT[EAX - 'A'],1
next:
    jmp L
F:  pause                 
    exit               
end Start
