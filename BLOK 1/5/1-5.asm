include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_5 (����_1) '������������ ������� � ������� ���������� �����' ",0    
.code
Start:
    ConsoleTitle offset T 
    inint EAX,'������� ����� �/�� �� ��������� [0 .. 4294967295]: ' 
    mov EDX,0 
    mov EBX, 10
    div EBX; EDX = mod, EAX = div
    mov ECX, EDX; ECX - ������� �����
    mov EBP, EAX; �������� div
    mov EAX, EDX; ����� ����� �� ����� ����� => ������� = �������
    cmp EBP, 0
    jE F; ����� �� ����� �����
    mov EAX, EBP; ���������� ����� �����
L:  mov EDX, 0
    div EBX; EDX = mod, EAX = div 
    cmp EAX,0
    jNE L; ��� �� ��������� �� ��������� ����� 
    mov EAX, EDX; ������� ����� ��������� � ��������� �������
F:  mul ECX
    outintln AL,,'����������� ������� � ������� ����� = '
    pause                 
    exit               
end Start
