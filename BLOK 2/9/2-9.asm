include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_9 (����_2) '����������� ������� �������' ",0  
N   equ 4
M   equ 6
A   dd N dup (M dup(?))

.code
Start:
    ConsoleTitle offset T 
    outstrln '������� �������� �������: '
    mov EAX, 2147483647         ;������� ��� ������������ ��������
    mov ECX,0                   ;������� ��� �����
    mov EDX,0                   ;������� ��� ��������
L:  inint EBX
    cmp EBX,EAX
    jGE K
    mov EAX,EBX                 ;����������� ������� ���������
K:  mov A[ECX][4*EDX],EBX
    add EDX,1
    cmp EDX,M
    jNE L                       ;������ �� ���������
    mov EDX,0                   ;������� �� ����� ������
    add ECX,N*M
    cmp ECX,N*M*4
    JNE L                       ;������� ��� �� ���������
    mov ECX,0
    mov EDX,1
    mov EBP,0                   ;������� ��� ������������ ��������
    mov EDI,1                   ;������� ����� ��� ������������
    outstr '������� ���������: '
Z:  cmp EAX,A[ECX][4*EDX-4]
    jNE B
    inc EBP
    outchar '['
    outint EDI
    outchar ','
    outint EDX
    outstr '] '
B:  add EDX,1
    cmp EDX,M+1
    jNE Z
    mov EDX,1                   ;������� �� ����� ������
    add ECX,N*M
    add EDI,1
    cmp ECX,N*M*4
    JNE Z  
    newline    
    outint EAX,,'MIN = '
    outstr ' ������ '
    outint EBP
    outstr ' ���'
    pause                 
    exit               
end Start
