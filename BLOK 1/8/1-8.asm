include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_8 (����_1) '�������������� �����' ",0    
.code
Start:
    ConsoleTitle offset T  
    outstrln '������� �����: d1 � d2 � ... � dk, � ����� ��������� ����� '
    mov EAX,0; EAX = 0
    mov EBX,0; EBX = 0
    inchar BL; BL - ��� �����
    sub BL,'0'; BL - �����
    add EAX,EBX; ��������� ������ �����
L:  inchar CL; CL - ����
    cmp CL,'.'
    jE F; ������ �����������
    inchar BL; BL - ��� �����
    sub BL,'0'; BL - �����
    cmp CL,'+'
    jE PLUS; ����������� ��������
    sub EAX,EBX; ����������� ���������
    jmp L
PLUS:  
    add EAX,EBX
    jmp L
F:  outint EAX,,'�������� �������������� ����� = '
    pause                 
    exit               
end Start
