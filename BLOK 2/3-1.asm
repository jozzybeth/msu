include console.inc

.data
T   db " √орина ≈лизавета (группа 112) "  
    db " «адача_1 (блок_3) 'јлгебраическа€ сумма' ",0   


.code
Start:
    ConsoleTitle offset T 
    outstr '¬ведите формулу: '
    mov EAX,0
L:  inchar AL  
    cmp AL,'.'
    jE F            ;конец формулы
    cmp AL,'('      
    jE L            ;пропускаем открывающие скобки
    cmp AL,')'      
    jE K            ;извлекаем <цифра><С+Т или С-С><цифра>
    cmp AL,'0'
    jAE S
M:  push EAX        ;символ - знак
    jmp L
S:  cmp AL,'9'
    jA M
    sub AL,'0'
    push EAX        ;заносим в стек цифру
    jmp L
K:  pop EAX         ;op2
    pop EBX         ;знак
    pop ECX         ;op1
    cmp EBX,'+'
    jNE K1
    add ECX,EAX
    push ECX
    jmp L 
K1: sub ECX,EAX 
    push ECX
    jmp L
F:  pop EAX
    outint EAX,,'–езультат: '
    pause                 
    exit               
end Start
