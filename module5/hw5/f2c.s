.text
.global main
main:

    #push the stack
    SUB sp, sp, #4
    STR lr, [sp]

    #print prompt
    LDR r0,= prompt
    BL printf

    #get temp
    LDR r0, =format
    LDR r1, =fahrenheit
    BL scanf

    #convert to celsius
    LDR r0, =fahrenheit
    LDR r0, [r0]
    MOV r1, #32
    SUB r0, r0, r1
    
    MOV r1, #5
    MUL r0, r0, r1

    #divide
    MOV r1, #9
    BL __aeabi_idiv
    MOV r2, r0 //celsius in r2 
    
    #output
    LDR r0, =output
    LDR r1, =fahrenheit
    LDR r1, [r1]
    BL printf

    #pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

 


.data
    output: .asciz " %d degrees fahrenheit is %d celsius \n\n"
    prompt: .asciz "Enter a temperature in fahrenheit \n"
    format: .asciz "%d"
    fahrenheit: .word  0

