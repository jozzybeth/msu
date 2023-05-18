include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_4 (блок_2_доп) '“Большие числа-4”' ",0  
N   equ 39     
W dq ?,?
Buf dq ?
Ans db N dup(?),0
D dq 2 dup (?)


.code
Start:
    ConsoleTitle offset T
    outstrln 'Введите два 64-битных числа: ' 
    mov EBP,10                      ;множитель
    mov EBX,0
    mov ECX,0
    mov ESI,0
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
    jmp @N
err:
    outstr 'Ошибка ввода!' 
    jmp F
@N: 
    mov EAX,dword ptr D
    mul dword ptr D[8*1]
    
    mov dword ptr W,EAX
    mov dword ptr W+4,EDX
    
    mov EAX,dword ptr D+4
    mul dword ptr D[8*1+4]
    
    mov dword ptr W+8,EAX
    mov dword ptr W+12,EDX
    
    mov EAX,dword ptr D
    mul dword ptr D[8*1+4]
    add dword ptr W+4,EAX
    adc dword ptr W+8,EDX
    adc dword ptr W+12,0
    
    mov EAX,dword ptr D[8*1]
    mul dword ptr D+4
    add dword ptr W+4,EAX
    adc dword ptr W+8,EDX
    adc dword ptr W+12,0 
    
    mov EBP,10
    mov EBX,N-1
L1: mov EDX,0
    mov EAX,dword ptr W+12 
    div EBP
    mov dword ptr W+12,EAX
    mov EAX,dword ptr W+8
    div EBP
    mov dword ptr W+8,EAX
    mov EAX,dword ptr W+4
    div EBP
    mov dword ptr W+4,EAX
    mov EAX,dword ptr W
    div EBP
    mov dword ptr W,EAX
    add DL,'0'
    mov Ans[EBX],DL
    dec EBX
    cmp EAX,0
    jNE L1
    lea ESI,Ans[EBX+1]
    outword D
    outword D+8,,'*'
    outstr ' = '  
    outstr ESI  
F:  pause                 
    exit               
end Start
