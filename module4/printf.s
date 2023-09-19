.text
.global main

main:
    SUB sp, sp, #4            // Reserve space on the stack for the link register
    STR lr, [sp, #0]          // Store the link register (return address) on the stack
    LDR r0, =formatString    // Load address of the format string into r0
    LDR r1, =name            // Load address of the name string into r1
    MOV r2, #63              // Load value 63 into r2
    BL printf                // Call printf function
    LDR lr, [sp, #0]         // Restore the link register from the stack
    ADD sp, sp, #4           // Adjust the stack pointer back
    MOV pc, lr               // Return from the main function

.data
formatString: .asciz "Hello %s, are you %d years old?\n"
name:        .asciz "Chuck"

