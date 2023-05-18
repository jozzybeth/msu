include console.inc

.data
N   equ 30
T   db " Горина Елизавета (группа 112) "  
    db " Задача_7 (блок_2) 'Сортировка обменом (метод пузырька)' ",0  
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
    mov ECX,EAX                         ;количество перестановок 
L1: mov EBX,1 
    mov ESI,0                           ;флаг для определения уже отсортированного массива
L2: mov EDX,X[4*EBX-4]
    mov EBP,X[4*EBX]                    ;регистр для следующего элемента
    cmp EDX,EBP                         ;сравнение текущего со следующим
    jBE Z
    mov X[4*EBX-4],EBP                  
    mov X[4*EBX],EDX
    mov ESI,1                           ;1 - в массиве была перестановка
Z:  inc EBX
    cmp EBX, ECX
    jNE L2
    cmp ESI,0                           ;в массиве не было перестановок, значит он уже отсортирован
    jE fin
    dec ECX
    cmp ECX,1
    jNE L1
fin:
    mov EBX,0
    outstrln 'Отсортированный массив:'
L:  outintln X[4*EBX]                   ;вывод элементов массива
    inc EBX
    cmp EBX,EAX
    jNE L
    pause                 
    exit               
end Start
