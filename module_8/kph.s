#kph
.text
.global main

main:
    # save return to OS on stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Prompt an input in miles
    LDR r0, =prompt1
    BL printf

    # Scan miles
    LDR r0, =format1
    LDR r1, =miles
    BL scanf
    #Load value of miles onto r3
    LDR r3, [r1]

    # Prompt hours of travel
    LDR r0, =prompt2
    BL printf

    # Scan hours
    LDR r0, =format2
    LDR r1, =hours
    BL scanf 
    #load value of hours onto r2
    LDR r2, [r1]

    # Convert
    BL kph
    MOV r1, r0

    LDR r0, =output
    BL printf

.data
prompt1: .asciz "Enter a distance in miles \n"   
format1: .asciz "%d" 
miles: .word 0

prompt2: .asciz "Enter hours of travel \n"
format2: .asciz "%d"
hours: .word 0
output: .asciz "You should travel at %d \n"


