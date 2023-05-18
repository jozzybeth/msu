include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_2 (����_2_���) '�������� �����-2�' ",0  
N   equ 20     
D   dq  10 dup (?)
Buf dq 0

.code
Start:
    ConsoleTitle offset T 
    mov EBP,10                      ;���������
    mov EBX,0
    mov ECX,0
    mov ESI,0
    outstrln '������� 64-������ �����: '
L2: inchar BL                       ;���� �� ������
    cmp BL,'.'
    jE fin
    cmp BL,','
    jE next
    cmp BL,'0'
    jB err
    cmp BL,'9'
    jA err
    sub BL,'0'                      
    mov EAX, dword ptr Buf
    mul EBP
    mov EDI,EDX                     ;������� ����� ����������
    mov ESI,EAX                     ;������� ����� ����������
    mov EAX,dword ptr Buf+4
    mul EBP
    jC err                          ;��������� � EAX 
    add EAX,EDI                     ;����������� ������� �����
    jC err
    add ESI,EBX                     ;����������� �����
    adc EAX,0                       ;���� ��������
    jC err
    mov dword ptr Buf,ESI
    mov dword ptr Buf+4,EAX
    mov ESI,0
    jmp L2
fin:
    mov ESI,1
next:
    mov EAX,dword ptr Buf
    mov dword ptr D[8*ECX],EAX
    mov EAX,dword ptr Buf+4
    mov dword ptr D[8*ECX]+4,EAX
    mov dword ptr Buf,0
    mov dword ptr Buf+4,0
    inc ECX
    cmp ESI,1
    jNE L2
    jmp @out
err:
    outstr '������ �����!' 
    jmp F
@out: 
    outstrln '��������� �����: '
    mov EBX,0
L:  outword D[8*EBX]
    outchar ' '
    inc EBX
    cmp EBX,ECX
    jNE L
F:  pause                 
    exit               
end Start
