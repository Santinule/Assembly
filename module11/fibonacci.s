.text
.global main
main:

    # Push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # Get the value of n
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =n
    BL scanf

    #Call function
    LDR r0, = n
    LDR r0, [r0]
    BL Fibonacci

    #output
    MOV r1, r0
    LDR r0, =output
    BL printf

    #Pop stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr


    
.data
prompt: .asciz "Enter a number \"n\" to determine its fibonacci number: "
format: .asciz "%d"
n: .word 0
output: .asciz "\nYour result is: %d \n"
#End main


.text

Fibonacci:
    # Push stack
    SUB sp, sp, #12
    STR lr, [sp]
    STR r4, [sp, #4]
    STR r5, [sp, #8]

    # Move number value to r4
    MOV r4, r0

    # Check if(n == 0) return 0
    CMP r4, #0
    BEQ numIs0

    # Check if (n == 1) return 1
    CMP r4, #1
    BEQ numIs1

    # Call F(n-1)
    SUB r0, r4, #1
    BL Fibonacci
    # Store F(n-1) in r5
    MOV r5, r0     

    #Call F(n-2)
    SUB r0, r4, #2
    BL Fibonacci
    
    # F(n) = F(n-1) + F(n-2)
    ADD r0, r5, r0 
    B Return

    numIs0:
        MOV r0, #0
        B Return

    numIs1:
        MOV r0, #1
        B Return

    # Pop stack
    Return:
    LDR lr, [sp]
    LDR r4, [sp, #4]
    LDR r5, [sp, #8]
    ADD sp, sp, #12
    MOV pc, lr

.data
# End Fibonacci

