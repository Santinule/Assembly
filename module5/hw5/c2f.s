.text
.global main
main:

   #push the stack
   SUB sp, sp, #4
   STR lr, [sp]

   #Print input prompt
   LDR r0, =prompt
   BL printf

   #Scan input
   LDR r0, =format
   LDR r1, =celsius
   BL scanf

   # Multiply   
   LDR r0, =celsius
   LDR r0, [r0]
   MOV r1, #9
   MUL r0, r0, r1
   #divide
   MOV r1, #5
   BL __aeabi_idiv
   #add 32
   MOV r1, #32
   ADD r2, r0, r1 //Answer in r2



   #Output
   LDR r0, = output
   LDR r1, = celsius
   LDR r1, [r1]
   BL printf


   #pop the stack
   LDR lr, [sp]
   ADD sp, sp, #4
   MOV pc, lr
.data
    prompt: .asciz "Enter a temperature in Celsius \n"
    format: .asciz "%d"
    celsius: .word 0
    output: .asciz " %d degrees celsius is %d degrees fahrenheit \n"

