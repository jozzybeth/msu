include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_2 (����_1) '������� �����' ",0    
S   db "���������",0,"�������",0
N   dd ?
.code
Start:
    ConsoleTitle offset T 
    inintln N, '������� ����� �/�� �� ��������� [0 .. 4294967295]: '                    
    mov ESI, offset S
    mov EBP, N
    cmp EBP,3
    jB L            ; ����� ������ 3 => �������
    mov EAX, EBP
    mov EDX, 0      ; N ��������� � EAX, N dd
    mov ECX, 2      ; ECX - ��������
    div ECX         ; EAX = div
    mov EBX, EAX    ; N div 2 - 1 - ������������ ���-�� ����� � �����
E:  cmp EDX,0
    jE F            ; mod = 0
    inc ECX
    cmp EBX, ECX
    jB L            ; ��������� �� ������� �� ����. ���-�� �����
    mov EDX,0
    mov EAX,EBP
    div ECX         ; EAX = div, EDX = mod
    jmp E
L:  add ESI,10   
F:  outstrln ESI   
    pause                 
    exit               
end Start
