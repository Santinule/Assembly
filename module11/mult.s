.text
.global main
main:
    # Push stack
    SUB sp, sp, #4
    STR lr, [sp]

    # Get the value for m
    LDR r0, =prompt
    BL printf
    LDR r0, =format
    LDR r1, =m
    BL scanf

    # Get the value for n
    LDR r0, =prompt2
    BL printf
    LDR r0, =format
    LDR r1, =n
    BL scanf

    # Prepare for Mult function call
    # Load m into r4
    LDR r4, =m
    LDR r4, [r4]
    # Load n into r0
    LDR r0, =n
    LDR r0, [r0]
    # Call Mult function
    BL Mult

    # Print the multiplication result
    MOV r1, r0
    LDR r0, =output
    BL printf

    # Pop the stack
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt: .asciz "Enter a number \"m\" to be multiplied: "
    format: .asciz "%d"
    m: .word 0
    prompt2: .asciz "Enter a number \"n\" to multiply \"m\" :"
    n: .word 0
    output: .asciz "The result is %d \n"

.text

Mult:
    # Push the stack
    SUB sp, sp, #8
    STR lr, [sp]
    STR r4, [sp, #4]

    # Move n into r5
    MOV r5, r0

    # Check if n equals 1
    CMP r5, #1
    BNE Else
        # Return m if n is 1
        MOV r0, r4
        B Return

    # Else block for recursive call
    Else:
        # Subtract n by 1
        SUB r5, r5, #1
        MOV r0, r5
        BL Mult
        # Add m to the result of the recursive call
        ADD r0, r4, r0

    # Return block for restoring state and returning
    Return:
        # Pop stack
        LDR lr, [sp]
        LDR r4, [sp, #4]
        ADD sp, sp, #8
        MOV pc, lr

.data

