include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_3 (блок_2_доп) '“Большие числа-3”' ",0  
N   equ 20     
D   dq  3 dup (?)
Buf dq 0

.code
Start:
    ConsoleTitle offset T 
    mov EBP,10                      ;множитель
    mov EBX,0
    mov ECX,0
    mov ESI,0
    outstrln 'Введите три 64-битных числа: '
L2: inchar BL                       ;цикл по цифрам
    cmp BL,'.'
    jE fin
    cmp BL,','
    jE next
    cmp BL,'0'
    jB err
    cmp BL,'9'
    jA err
    sub BL,'0'                      
    mov EAX, dword ptr Buf
    mul EBP
    mov EDI,EDX                     ;старшая часть результата
    mov ESI,EAX                     ;младшая часть результата
    mov EAX,dword ptr Buf+4
    mul EBP
    jC err                          ;результат в EAX 
    add EAX,EDI                     ;прибавление страшей части
    jC err
    add ESI,EBX                     ;прибавление цифры
    adc EAX,0                       ;учет переноса
    jC err
    mov dword ptr Buf,ESI
    mov dword ptr Buf+4,EAX
    mov ESI,0
    jmp L2
fin:
    mov ESI,1
next:
    mov EAX,dword ptr Buf
    mov dword ptr D[8*ECX],EAX
    mov EAX,dword ptr Buf+4
    mov dword ptr D[8*ECX]+4,EAX
    mov dword ptr Buf,0
    mov dword ptr Buf+4,0
    inc ECX
    cmp ESI,1
    jNE L2
    jmp S
err:
    outstr 'Ошибка ввода!' 
    jmp F
S:   
    mov EAX,dword ptr D[8*0]    
    sub EAX,dword ptr D[8*1]    ;сравнили первое со вторым
    mov EAX,dword ptr D[8*0+4]
    sbb EAX,dword ptr D[8*1+4]
    jC LESS1
    mov EAX,dword ptr D[8*0]
    mov EDX,dword ptr D[8*0+4]
    xchg EAX,dword ptr D[8*1]
    xchg EDX,dword ptr D[8*1+4]
    mov dword ptr D[8*0],EAX
    mov dword ptr D[8*0+4],EDX
LESS1:
    mov EAX,dword ptr D[8*0]    
    sub EAX,dword ptr D[8*2]    ;сравнили первое с третьим
    mov EAX,dword ptr D[8*0+4]
    sbb EAX,dword ptr D[8*2+4]
    jC LESS2
    mov EAX,dword ptr D[8*0]
    mov EDX,dword ptr D[8*0+4]
    xchg EAX,dword ptr D[8*2]
    xchg EDX,dword ptr D[8*2+4]
    mov dword ptr D[8*0],EAX
    mov dword ptr D[8*0+4],EDX
LESS2:
    mov EAX,dword ptr D[8*1]    
    sub EAX,dword ptr D[8*2]    ;сравнили второе с третьим
    mov EAX,dword ptr D[8*1+4]
    sbb EAX,dword ptr D[8*2+4]
    jC LESS3
    mov EAX,dword ptr D[8*1]
    mov EDX,dword ptr D[8*1+4]
    xchg EAX,dword ptr D[8*2]
    xchg EDX,dword ptr D[8*2+4]
    mov dword ptr D[8*1],EAX
    mov dword ptr D[8*1+4],EDX
LESS3:
    outstrln 'Отсортированные по неубыванию числа: '
    mov EBX,0
L:  outword D[8*EBX]
    outchar ' '
    inc EBX
    cmp EBX,ECX
    jNE L
F:  pause                 
    exit               
end Start
