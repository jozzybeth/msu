include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_3 (блок_1) 'Баланс скобок' ",0    
S   db "НЕТ",0,"ДА",0
.code
Start:
    ConsoleTitle offset T 
    mov ECX,0
    mov EDX, offset S
    outstrln 'Введите строку, в конце поставьте точку'
L:  inchar AL; чтение символа          
    cmp AL,'.'
    jE N; символ - точка => конец
    cmp AL,'('
    jE P1
    cmp AL,')'
    jE P2
    jmp L; символ - не скобка
P1: add ECX,1; +1 в счетчик
    jmp L
P2: sub ECX,1; -1 в счетчик
    cmp ECX,0
    jL F; ) больше чем ( => конец
    jmp L
N:  cmp ECX,0
    jNE F;проверка на баланс (  
    add EDX, 4; сбалансировано 
F:  outstrln EDX   
    pause                 
    exit               
end Start
