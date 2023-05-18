include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_2 (блок_2) 'Зачёт с оценкой' ",0   
z2  db 'неуд',0
z3  db 'удовл',0
z4  db 'хорошо',0
z5  db 'отлично',0 
adr dd z2,z3,z4,z5

.code
Start:
    ConsoleTitle offset T 
    inintln EBX, 'Введите целое число от 2 до 5: '
    mov EBX, adr[EBX*4-2*4]
    outstrln EBX                  
    pause                 
    exit               
end Start
