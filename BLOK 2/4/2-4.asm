include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_4 (����_2) '�������� 10-� �����' ",0   
N   equ 10
A   db N dup ('0'), 0

.code
Start:
    ConsoleTitle offset T 
    inintln EAX, '������� ����� ����� �� ��������� [-2^31..2^32-1]: '
    cmp EAX,0
    jGE Z
    outchar '-'
    neg EAX
Z:  lea ESI, A
    mov ECX, N
    mov EBX, N
L:  mov EDX, 0
    div EBX
    add A[ECX-1],DL
    cmp EAX,0
    loopNE L
    add ESI, ECX
    outstrln ESI
    pause                 
    exit               
end Start
