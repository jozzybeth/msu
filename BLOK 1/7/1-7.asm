include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_7 (����_1) '��������� �����, ������� ����' ",0    
.code
Start:
    ConsoleTitle offset T  
    inintln EBX,'������� ����� �� ��������� [0 .. 4294967295]: '
    mov ECX,7; ECX - ��������
    mov EAX,EBX; ���������� � �������
    mov EDX,0
    div ECX; EDX = mod
    cmp EDX,0; ����� ������� �� 7 => ����� �����
    jE F
    cmp EDX, 4;     
    jB B;������� < 4
    sub ECX,EDX; ������� >= 4 => ����� �� ������� (7-���) �� ������� �� 7
    add EBX, ECX
    jmp F
B:  sub EBX,EDX; �������� �������  
F:  outwordln EBX,,'��������� �����, ������� ���� = '
    pause                 
    exit               
end Start
