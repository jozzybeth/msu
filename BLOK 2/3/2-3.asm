include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_3 (����_2) '��������' ",0   
S   db 20 dup ('-'),0

.code
Start:
    ConsoleTitle offset T 
    inintln ECX, '������� ����� ����� K: '
    mov S[ECX],0
L:  mov S[ECX-1],'*'    ;�� ������ ���� ��������� ����� ���������
    outstrln offset S
    dec ECX
    cmp ECX,0
    jNE L                  
    pause                 
    exit               
end Start
