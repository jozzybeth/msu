include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_5 (����_2) '����������� 16-� �����' ",0   
N   equ 8
A   db N dup ('0'), 0

.code
Start:
    ConsoleTitle offset T 
    inintln EAX, '������� ����� ����� �� ��������� [-2^31..2^32-1]: '
    lea ESI, A
    mov ECX, N
    mov EBX, 16
L:  mov EDX, 0
    div EBX
    cmp EDX,0 
    jB L1
    cmp EDX,9
    jA L1
    add A[ECX-1],DL
    jmp L2
L1: mov A[ECX-1],'A'
    sub EDX,10
    add A[ECX-1],DL
    cmp EAX,0
L2: loopNE L
    outstrln ESI
    pause                 
    exit               
end Start
