.text
.global  main
main:
    #Push the stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Print a prompt
    LDR r0, =prompt1
    BL printf

    #Read in the name
    LDR r0, =format1
    LDR r1, =name1
    BL scanf

    #Print the output string
    LDR r0, =output1
    LDR r1, =name1
    BL printf


    #pop the stack and return
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr


.data
    prompt1: .asciz "Please enter your name: "
    output1: .asciz "Your name is %s\n"
    format1: .asciz "%s"
    name1:   .space 40


