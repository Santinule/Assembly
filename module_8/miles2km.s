.text
.global main

main:
    #pusj stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    LDR r0, =prompt1
    BL printf

    LDR r0, =format
    LDR r1, =miles
    BL scanf

    #load value at r1 into r0
    LDR r0, [r1]
    #call function
    BL miles2km

    #move km from r0 to r1
    MOV r1, r0

    #print km
    LDR r0, =output
    BL printf


    #pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
prompt1: .asciz "Enter a distance in miles \n"
format: .asciz "%d"
miles: .word 0
output: .asciz "The distance in km is %d \n"

