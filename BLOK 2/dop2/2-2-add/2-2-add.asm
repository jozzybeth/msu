include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_2 (блок_2_доп) '“Большие числа-2”' ",0  
N   equ 20     
D   dq  10 dup (?)
Buf dq 0

.code
Start:
    ConsoleTitle offset T 
    mov EBP,10                      ;множитель
    mov EBX,0
    mov ECX,0
    mov ESI,0
    outstrln 'Введите 64-битные числа: '
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
    jmp @out
err:
    outstr 'Ошибка ввода!' 
    jmp F
@out: 
    outstrln 'Введенные числа: '
    mov EBX,0
L:  outword D[8*EBX]
    outchar ' '
    inc EBX
    cmp EBX,ECX
    jNE L
F:  pause                 
    exit               
end Start
