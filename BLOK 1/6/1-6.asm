include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_6 (����_1) '���������� �����' ",0    
.code
Start:
    ConsoleTitle offset T 
    outstrln '������� ����� � ���������� �� �� ��������� [0 .. 32244002423140], � ����� ��������� ������' 
    mov ECX, 5
    mov EAX, 0
L:  mov EBX, 0
    inchar BL; ������ �������
    cmp BL,' '
    jE F; ����� �����������
    sub EBX,'0'; �������� ����� ����� ��� �������
    mul ECX; EAX*ECX = (EDX,EAX), �� ����� ������������ � EAX 
    add EAX, EBX; EAX := EAX + EBX
    jmp L; �����: EAX = (EAX*5 + EBX)*5 + EBX � �.�.
F:  outwordln EAX,,'���������� ����� = '
    pause                 
    exit               
end Start
