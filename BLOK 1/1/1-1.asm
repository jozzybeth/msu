include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_1 (����_1) '������� ������' ",0    
.code
Start:
    ConsoleTitle offset T 
    inintln EAX, '������� ����� �/�� �� ��������� [0 .. 4294967295]: '                    
    mov CL,0
    mov EBX,3
    mov EDX, 0
N:  cmp EAX, 1 
    jE F; N = 1 ?
    div EBX ; (EDX,EAX)/EBX; EAX = div, EDX = mod
    cmp EDX,0
    jNE L; mod <> 0
    add CL,1
    jmp N
L:  mov CL,-1    
F:  outintln CL,,'K = '
    pause                 
    exit               
end Start
