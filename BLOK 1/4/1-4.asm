include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_4 (����_1) '����� P/Q' ",0    
P   dd ?
Q   dd ?
.code
Start:
    ConsoleTitle offset T 
    inintln P, '�������  P - ����� �/�� �� ��������� [0 .. 4294967295]: '  
    inintln Q, '�������  Q - ����� �/�� �� ��������� [1 .. 4294967295]: '
    outstr '����� P/Q = '
    mov EAX,P
    mov EDX,0
    mov EBX,Q
    div EBX     ; EAX = div, EDX = mod
    outword EAX ; ����� ����� �����
    outchar '.' 
    mov ECX,5   ; ���������� ����� ����� = 5
    mov EBP,10  ; ���������� ���������
L:  mov EAX,EDX
    mul EBP     ; EAX * EBP = (EDX,EAX)
    div EBX     ; EAX = div, EDX = mod
    outint EAX  ; ����� ����� �����
    loop L
    pause                 
    exit               
end Start
