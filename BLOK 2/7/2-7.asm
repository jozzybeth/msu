include console.inc

.data
N   equ 30
T   db " ������ ��������� (������ 112) "  
    db " ������_7 (����_2) '���������� ������� (����� ��������)' ",0  
X   dd N dup (?)

.code
Start:
    ConsoleTitle offset T 
    inintln EAX, '������� ������ �������: '
    outstr '������� �������� �������: '
    mov EBX,0
M:  inint X[4*EBX]                      ;���� ��������� �������
    inc EBX
    cmp EBX,EAX
    jNE M
    mov ECX,EAX                         ;���������� ������������ 
L1: mov EBX,1 
    mov ESI,0                           ;���� ��� ����������� ��� ���������������� �������
L2: mov EDX,X[4*EBX-4]
    mov EBP,X[4*EBX]                    ;������� ��� ���������� ��������
    cmp EDX,EBP                         ;��������� �������� �� ���������
    jBE Z
    mov X[4*EBX-4],EBP                  
    mov X[4*EBX],EDX
    mov ESI,1                           ;1 - � ������� ���� ������������
Z:  inc EBX
    cmp EBX, ECX
    jNE L2
    cmp ESI,0                           ;� ������� �� ���� ������������, ������ �� ��� ������������
    jE fin
    dec ECX
    cmp ECX,1
    jNE L1
fin:
    mov EBX,0
    outstrln '��������������� ������:'
L:  outintln X[4*EBX]                   ;����� ��������� �������
    inc EBX
    cmp EBX,EAX
    jNE L
    pause                 
    exit               
end Start
