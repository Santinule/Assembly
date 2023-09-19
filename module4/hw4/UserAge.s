.text
.global main
main: 
    #Pushing the stack record
    SUB sp, sp, #4
    STR lr, [sp, #0]

    #Print Prompt
    LDR r0, =prompt1
    BL printf

    #Read the age
    LDR r0, =format1
    LDR r1, =age1
    BL scanf

    #Print the age
    LDR r0, =output1
    LDR r1, =age1
    LDR r1, [r1, #0] @Loads the value at the adress of r1
    BL printf


    #Poping the stack record
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
 




.data
prompt1: .asciz "Please enter your age: "
format1: .asciz "%d"
age1: .word 0
output1: .asciz "You are %d years old/n"



