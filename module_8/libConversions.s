#libConversions
.global miles2km
.global kph
.text
miles2km:   
    # push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # M(1.609) is k(m)
    # Thus, (m*161) /100 is approximation
    MOV r1, #161
    MUL r0, r0, r1
    MOV r1, #100
    # divides r1 from r0: r0/r1
    BL aeabi_idiv

    # pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
#end miles2km

kph:
    #PUSH STACK
    SUB sp, sp, #4
    STR lr, [sp]
    
    # r3 contains miles. Move it to r0 for miles2km function.
    MOV r0, r3

    # Convert miles to kilometers (result will be in r0)
    BL miles2km
    # move hours from r2 to r1
    MOV r1, r2
    
    # r0 now contains kilometers. Let's divide it by hours.
    # Dividing kilometers by hours
    BL aeabi_idiv      

    # pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
#end kph

