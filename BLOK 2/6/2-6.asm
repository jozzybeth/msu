include console.inc

.data
N   equ 30
T   db " Горина Елизавета (группа 112) "  
    db " Задача_6 (блок_2) 'Сортировка выбором' ",0  
X   dd N dup (?)

.code
Start:
    ConsoleTitle offset T 
    inintln EAX, 'Введите размер массива: '
    outstr 'Введите элементы массива: '
    mov EBX,0
M:  inint X[4*EBX]                      ;ввод элементов массива
    inc EBX
    cmp EBX,EAX
    jNE M 
    mov EBX,0
    mov ECX, EAX 
    dec ECX                             ;настройка счетчика внешнего цикла на количество перестановок 
L1: mov EDI,X                           ;регистр для максимального элемента 
    mov ESI,0                           ;регистр для индекса максимального элемента
    mov EBX,1                           ;счетчик для индекса
L2: cmp EDI,X[EBX*4]
    jAE Z
    mov EDI,X[EBX*4]                    ;максимальный элемент
    mov ESI,EBX                         ;индекс максимального элемента
Z:  inc EBX
    cmp EBX, ECX
    jBE L2
    mov EDX,X[ESI*4]                    ;нашли максимальный элемент, меняем его с последним
    xchg X[4*ECX],EDX
    mov X[4*ESI],EDX
    mov EBX,0
    dec ECX
    cmp ECX,0
    jNE L1
    mov ECX,EAX
    mov EBX,0
    outstrln 'Отсортированный массив:'
L:  outintln X[4*EBX]                   ;вывод элементов массива
    inc EBX
    cmp EBX,EAX
    jNE L
    pause                 
    exit               
end Start
