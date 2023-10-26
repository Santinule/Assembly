#libConversions
.global c2f
.global inches2feet
.text

c2f:

    SUB sp, sp, #4
    STR lr, [sp]

    #Assumes celsius is passed at r0

    # c(9/5)+32=f

    MOV r1, #9
    MUL r0, r0, r1
    
    MOV r1, #5
    BL __aeabi_idiv
    #From division: r0/r1 -> r0

    MOV r1, #32
    ADD r0, r0, r1

    #Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
#END c2f

inches2feet:

    SUB sp, sp, #4
    STR lr, [sp]

    #Assumes inches in r0
    # I/12=f
    
    MOV r1, #12
    BL __aeabi_idiv
    #feet in r0

    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
#end inches2feet


    

    


