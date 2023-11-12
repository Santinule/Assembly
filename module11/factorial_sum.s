.global main
main:

    #push stack
    SUB sp, sp, #4
    STR lr, [sp]


    #Get input
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =num
    BL scanf

    #Call Sum function
    LDR r0, =num
    LDR r0, [r0]
    BL Sum
    MOV r1, r0

    #Print output
    LDR r0, =output
    BL printf

    #Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr



.data
    prompt: .asciz "Enter a number to add in factorially: "
    format: .asciz "%d"
    num: .word 0
    output: .asciz "\nYour result is: %d \n"

#End main

.text

Sum:

    #Push stack
    SUB sp, sp, #8
    STR lr, [sp]
    STR r4, [sp, #4]

    #Move number value to r4
    MOV r4, r0

    # if (num==0) return 0
    CMP r4, #0
    BNE Else
        MOV r0, #0
        B Return

    Else:
        SUB r0, r4, #1
        BL Sum
        ADD r0, r4, r0
        B Return



    #Pop stack
    Return:
    LDR lr, [sp]
    LDR r4, [sp, #4]
    ADD sp, sp, #8
    MOV pc, lr

.data
#End Sum
