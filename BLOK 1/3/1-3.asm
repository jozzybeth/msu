include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_3 (����_1) '������ ������' ",0    
S   db "���",0,"��",0
.code
Start:
    ConsoleTitle offset T 
    mov ECX,0
    mov EDX, offset S
    outstrln '������� ������, � ����� ��������� �����'
L:  inchar AL; ������ �������          
    cmp AL,'.'
    jE N; ������ - ����� => �����
    cmp AL,'('
    jE P1
    cmp AL,')'
    jE P2
    jmp L; ������ - �� ������
P1: add ECX,1; +1 � �������
    jmp L
P2: sub ECX,1; -1 � �������
    cmp ECX,0
    jL F; ) ������ ��� ( => �����
    jmp L
N:  cmp ECX,0
    jNE F;�������� �� ������ (  
    add EDX, 4; �������������� 
F:  outstrln EDX   
    pause                 
    exit               
end Start
