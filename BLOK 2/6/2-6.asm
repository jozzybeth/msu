include console.inc

.data
N   equ 30
T   db " ������ ��������� (������ 112) "  
    db " ������_6 (����_2) '���������� �������' ",0  
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
    mov EBX,0
    mov ECX, EAX 
    dec ECX                             ;��������� �������� �������� ����� �� ���������� ������������ 
L1: mov EDI,X                           ;������� ��� ������������� �������� 
    mov ESI,0                           ;������� ��� ������� ������������� ��������
    mov EBX,1                           ;������� ��� �������
L2: cmp EDI,X[EBX*4]
    jAE Z
    mov EDI,X[EBX*4]                    ;������������ �������
    mov ESI,EBX                         ;������ ������������� ��������
Z:  inc EBX
    cmp EBX, ECX
    jBE L2
    mov EDX,X[ESI*4]                    ;����� ������������ �������, ������ ��� � ���������
    xchg X[4*ECX],EDX
    mov X[4*ESI],EDX
    mov EBX,0
    dec ECX
    cmp ECX,0
    jNE L1
    mov ECX,EAX
    mov EBX,0
    outstrln '��������������� ������:'
L:  outintln X[4*EBX]                   ;����� ��������� �������
    inc EBX
    cmp EBX,EAX
    jNE L
    pause                 
    exit               
end Start
