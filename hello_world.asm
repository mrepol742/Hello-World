; hello.asm — x86-64 Linux, NASM syntax

section .data
    msg db "Hello, world!", 10      ; hello world
    len equ $ - msg

section .text
    global _start

_start:
    ; write(1, msg, len)
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; fd = stdout
    mov     rsi, msg                ; buf
    mov     rdx, len                ; count
    syscall

    ; exit(0)
    mov     rax, 60                 ; sys_exit
    xor     rdi, rdi                ; status = 0
    syscall
