include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_1 (����_3) '�������������� �����' ",0   


.code
Start:
    ConsoleTitle offset T 
    outstr '������� �������: '
    mov EAX,0
L:  inchar AL  
    cmp AL,'.'
    jE F            ;����� �������
    cmp AL,'('      
    jE L            ;���������� ����������� ������
    cmp AL,')'      
    jE K            ;��������� <�����><�+� ��� �-�><�����>
    cmp AL,'0'
    jAE S
M:  push EAX        ;������ - ����
    jmp L
S:  cmp AL,'9'
    jA M
    sub AL,'0'
    push EAX        ;������� � ���� �����
    jmp L
K:  pop EAX         ;op2
    pop EBX         ;����
    pop ECX         ;op1
    cmp EBX,'+'
    jNE K1
    add ECX,EAX
    push ECX
    jmp L 
K1: sub ECX,EAX 
    push ECX
    jmp L
F:  pop EAX
    outint EAX,,'���������: '
    pause                 
    exit               
end Start
