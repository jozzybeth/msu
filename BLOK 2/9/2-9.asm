include console.inc

.data
T   db " Горина Елизавета (группа 112) "  
    db " Задача_9 (блок_2) 'Минимальный элемент матрицы' ",0  
N   equ 4
M   equ 6
A   dd N dup (M dup(?))

.code
Start:
    ConsoleTitle offset T 
    outstrln 'Введите элементы массива: '
    mov EAX, 2147483647         ;регистр для минимального элемента
    mov ECX,0                   ;счетчик для строк
    mov EDX,0                   ;счетчик для столбцов
L:  inint EBX
    cmp EBX,EAX
    jGE K
    mov EAX,EBX                 ;минимальный элемент обновился
K:  mov A[ECX][4*EDX],EBX
    add EDX,1
    cmp EDX,M
    jNE L                       ;строка не закончена
    mov EDX,0                   ;переход на новую строку
    add ECX,N*M
    cmp ECX,N*M*4
    JNE L                       ;матрица еще не закончена
    mov ECX,0
    mov EDX,1
    mov EBP,0                   ;счетчик для минимального элемента
    mov EDI,1                   ;счетчик строк для пользователя
    outstr 'Индексы вхождений: '
Z:  cmp EAX,A[ECX][4*EDX-4]
    jNE B
    inc EBP
    outchar '['
    outint EDI
    outchar ','
    outint EDX
    outstr '] '
B:  add EDX,1
    cmp EDX,M+1
    jNE Z
    mov EDX,1                   ;переход на новую строку
    add ECX,N*M
    add EDI,1
    cmp ECX,N*M*4
    JNE Z  
    newline    
    outint EAX,,'MIN = '
    outstr ' входит '
    outint EBP
    outstr ' раз'
    pause                 
    exit               
end Start
