include console.inc

.data
T   db " ������ ��������� (������ 112) "  
    db " ������_8 (����_2) '��������� ?' ",0  
N   equ 30 
S   db N dup(?) 
A   db "�� ���������",0

.code
Start:
    ConsoleTitle offset T 
    outstrln '������� �����, �������������� ������: '
    lea ESI,A
    mov EBX,0
L:  inchar AL
    cmp AL,'.'
    JE F
    cmp AL,' '
    jE L
    cmp AL,'a'
    jB L1
    cmp AL,'z'
    jA L1
    jmp L2
L1: sub AL,'A'
    add AL,'a'
L2: mov S[EBX],AL
    inc EBX
    jmp L
F:  mov ECX,0
Z:  mov DL,S[ECX]
    cmp DL,S[EBX-1]
    jNE fin
    inc ECX
    dec EBX
    cmp ECX,EBX
    JB Z
    add ESI,3
fin:
    outstrln ESI
    pause                 
    exit               
end Start
