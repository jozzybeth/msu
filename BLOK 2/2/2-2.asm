include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_2 (����_2) '����� � �������' ",0   
z2  db '����',0
z3  db '�����',0
z4  db '������',0
z5  db '�������',0 
adr dd z2,z3,z4,z5

.code
Start:
    ConsoleTitle offset T 
    inintln EBX, '������� ����� ����� �� 2 �� 5: '
    mov EBX, adr[EBX*4-2*4]
    outstrln EBX                  
    pause                 
    exit               
end Start
