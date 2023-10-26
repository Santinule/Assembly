#test
    .text
    .global main
main:
    #test c2f and inches inches2feet
 
    #push stack
    SUB sp, sp, #4
    STR lr, [sp]

#Celsius to fahrenheit

    #Print input
    LDR r0, =prompt1
    BL printf

   #Scan input
    LDR r0, =format1
    LDR r1, =celsius
    BL scanf

    #Convert C2F
    BL c2f
    MOV r1, r0

    # Print F
    LDR r0, =output1
    BL printf

#inches2feet

    # Prompt For An Input
    LDR r0, =prompt2
    BL printf

    #Scanf
    LDR r0, =format2
    LDR r1, =inches
    BL scanf

    #Convert inches to feet
    BL inches2feet
    MOV r1, r0

    #Print feet
    LDR r0, =output2
    BL printf

    
    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr


.data
    prompt1: .asciz "\nEnter the Temp in C you want in F: \n"
    format1: .asciz "%d"
    celsius: .word 0
    output1: .asciz "\n %d in fahrenheit\n"

    prompt2: .asciz "\nEnter inches you want converted to feet\n"
    format2: .asciz "%d"
    inches: .word 0
    output2: .asciz "\n %d in feet\n"
    
