include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_10 (����_1) '������� ���������' ",0    
.code
Start:
    ConsoleTitle offset T 
    outstrln '������� ���������'
    newline
    mov ECX,9
    mov BL,0
    outstr '   |'
    outint BL,2
    add BL,1
L:  outint BL,3     ; ������ ������
    add BL,1
    loop L
    newline
    mov ECX,33
S:  outchar '-'
    loop S
    newline
    mov BL,0
L1: outint BL       ; ���� �� �������
    outstr '  |'
    mov CL,10
    mov BH,0
    outint BH,2
L2: add BH,BL       ; ���� �� ��������      
    outint BH,3
    dec CL
    cmp CL,1
    jNE L2          ; ������ ��� �� ���������
    add BL,1
    newline
    cmp BL,10
    JNE L1          ; ������� ��� �� ���������
    pause                 
    exit               
end Start
