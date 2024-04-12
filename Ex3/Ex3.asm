global main

section .data
    n: dd 0
    number: dd 0
    c: dd 0
    fmt_read: db "%d", 0
    fmt_write: db "%d", 10, 0


default rel
extern printf, scanf

section .text
main:

    push rbp    ; выравниваем стек
    mov rbp, rsp

    mov rdi, fmt_read   ; считываем n
    mov rsi, n
    xor rax, rax
    call scanf

_n_loop:
    dec byte [n]

    mov rdi, fmt_read   ; vvod chisla v number
    mov rsi, number
    xor rax, rax
    call scanf

    mov r8, 2
_prime_check_loop:
    mov eax, [number]
    xor rdx, rdx
    div r8  ; rdx:rax / operand => rax - result; rdx - ostatok
    cmp rdx, 0
    je _not_prime

    xor rdx, rdx
    mov r9, 2
    mov eax, [number]
    div r9
    cmp rax, r8
    je _is_prime
    
    inc r8
    jmp _prime_check_loop

_is_prime:
    inc byte [c]
    mov eax, [n]
    cmp rax, 0
    je _print_func
    jmp _n_loop
_not_prime:
    mov eax, [n]
    cmp rax, 0
    je _print_func
    jmp _n_loop

_print_func:
    mov rdi, fmt_write
    mov rsi, [c]
    xor rax, rax
    call printf

    mov rax, 60
    xor rdi, rdi
    syscall