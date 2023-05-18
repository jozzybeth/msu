include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_1 (блок_2_доп) '“Большие числа-1”' ",0  
N   equ 20     
D   dq  1,502,40034,1234567,8765432,24462233,76234624,526341234,9341234123411,18446744073709551615
Buf dq ?
Ans db N dup(?),0


.code
Start:
    ConsoleTitle offset T 
    mov ECX,0                       ;количество шагов цикла
    mov EBP,10                      ;делитель
L2: mov EBX,N-1                     ;модификатор
    mov EAX,dword ptr D[8*ECX]
    mov dword ptr Buf,EAX
    mov EAX,dword ptr D[8*ECX + 4] 
    mov dword ptr Buf+4,EAX
L1: mov EDX,0
    mov EAX,dword ptr Buf+4
    div EBP
    mov dword ptr Buf+4,EAX
    mov EAX,dword ptr Buf
    div EBP
    mov dword ptr Buf,EAX
    add DL,'0'
    mov Ans[EBX],DL
    dec EBX
    cmp EAX,0
    jNE L1
    lea ESI, Ans[EBX+1]
    outstr ESI
    outwordln D[8*ECX],,' '
    inc ECX
    cmp ECX,10
    jNE L2
    pause                 
    exit               
end Start
