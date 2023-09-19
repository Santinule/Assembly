.text
.global main

main:
    # Push the link register onto the stack
    SUB sp, sp, #8
    STR lr, [sp, #0]
    
    # Load the address of the string into r0 (the first argument to printf)
    LDR r0, =string1
    BL printf
    
    # Pop the link register from the stack
    LDR lr, [sp, #0]
    ADD sp, sp, #8
    MOV pc, lr

.data
string1:
    .asciz "I once lost \t2\tcities, lovely ones. and I hope that they will stay with me for eternity. Perhaps for\t400\t years\n"



