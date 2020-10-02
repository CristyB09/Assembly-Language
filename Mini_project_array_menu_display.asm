## Name of Program: MIPS Mini Project - Array Program        Version number: v1	         Date last changed: 05/05/2020
## Name of Author: Cristian Emanuel Bonte - B00795212
## Description of Program:
                             # The program will display a Main Menu to the user, ask for an option,
                             # and execute the option that has been chosen by the user,
                             # allowing also to return to the Main Menu or exit thr program
                         
                         
                         
                         
.data
display_elements: .asciiz "The elements in the array are: \n"
original_elements: .asciiz "The original elements of array was: \n"
array: .word 0x6E, 0x76, 0x80, 0x90, 0x85, 0x96, 0x8C, 0x93, 0xAC, 0x9D, 0xB2, 0xB3, 0xB2, 0xB7, 0xBE, 0xB3, 0xBF, 0xC3, 0xD0, 0xD3, 0xCB, 0xC4, 0xCA, 0xDC, 0xD5, 0xCA, 0xD5, 0xE3, 0xD6, 0xCF, 0xDB, 0xD1, 0xDE, 0xD0, 0xD7, 0xD6, 0xE3, 0xE2, 0xCA, 0xD2, 0xD8, 0xCF, 0xD3, 0xD1, 0xC9, 0xCC, 0xC9, 0xB2, 0xB8, 0xAF, 0xB9, 0xA1, 0xA3, 0xB0, 0x94, 0x95, 0x8E, 0x97, 0x95, 0x8B, 0x80, 0x7C, 0x84, 0x6F, 0x65, 0x70, 0x68, 0x5F, 0x54, 0x4F, 0x49, 0x53, 0x4A, 0x4B, 0x36, 0x32, 0x3B, 0x2D, 0x2A, 0x33, 0x1E, 0x2D, 0x2A, 0x2A, 0x1D, 0x10, 0x10, 0x0A, 0x13, 0x09, 0x14, 0x16, 0x11, 0x0C, 0x18, 0x15, 0x13, 0x0F, 0x1A, 0x05, 0x05, 0x19, 0x15, 0x0F, 0x1A, 0x1B, 0x24, 0x25, 0x29, 0x27, 0x2C, 0x35, 0x2A, 0x38, 0x2E, 0x39, 0x47, 0x40, 0x54, 0x55, 0x53, 0x62, 0x64, 0x61, 0x6A, 0x64, 0x69, 0x6E
gap: .asciiz " , "
newline: .asciiz "\n"
swapping_succesfully: .asciiz "\nSwapping has been made successfully!"
largest: .asciiz "The largest element of the array is: "
smallest: .asciiz "\nThe smallest element of the array is: "
array_rearranging: .asciiz "\nThe new array after swap of the largest and smallest elements: \n"
smoothing: .asciiz "\nAfter smoothing process, the element of the array are: \n"
array_reverse: .asciiz "\nThe reverse of array is: \n"
#---------------------------------------------- M E N U      O P T I O N ---------------------------------------------
#----------------------------------------------                          ---------------------------------------------
mainMenuDesign: .asciiz "\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MAIN - MENU: <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
menuLineDesign: .asciiz "\n-------------------------------------------------------------------------------------------"
optionMessage: .asciiz "\n>>>>>>>>>>>>>>>>>>>>>>>>>> Please choose an option from below: <<<<<<<<<<<<<<<<<<<<<<<<<<<<"
menuLineDesign2: .asciiz "\n-------------------------------------------------------------------------------------------"
message1: .asciiz "\n1. Print the Array"
message2: .asciiz "\n2. Print the largest and smallest number from the array"
message3: .asciiz "\n3. Swap the largest and smalllest number from the array"
message4: .asciiz "\n4. Smooth the Array"
message5: .asciiz "\n5. Reverse the array elements"
message6: .asciiz "\n6. Exit"
menuLineDesign3: .asciiz "\n-------------------------------------------------------------------------------------------"
userChoiceMess:  .asciiz "\nEnter your choice (1-6):"
#----------------------------------------------------------------------------------------------------------------------
#---------------------------------------------- E N D   O F   M E N U -------------------------------------------------
.text
main:
menu:
la $a0, mainMenuDesign          # print the first message of program
li $v0, 4
syscall 



la $a0, menuLineDesign         # print the second message of program
li $v0, 4
syscall 

la $a0, optionMessage          # print the third message of program
li $v0, 4
syscall 

la $a0, menuLineDesign2        # print fourth message of program
li $v0, 4
syscall 

la $a0, message1              # print (Print the array message)
li $v0, 4
syscall 

la $a0, message2              # prin largest and smallest message which is second option from the main menu program
li $v0, 4
syscall 

la $a0, message3              # prin swap the largest and smallest elemnt of array message
li $v0, 4
syscall 

la $a0, message4              # print smoth the array
li $v0, 4
syscall 

la $a0, message5              # print reverse the array elements message
li $v0, 4
syscall 

la $a0, message6              # print the exit program message
li $v0, 4
syscall 

la $a0, menuLineDesign3       # print the last line of pain menu 
li $v0, 4
syscall 

la $a0, userChoiceMess        # print the user choices message
li $v0, 4
syscall 

li $v0, 5                     # input the user choice option
syscall 
move $s7, $v0                 # user choice is in $s7
#-----------------------------< checking the user input and branching to those option >------------------------------
beq $s7, 1, print_the_array
beq $s7, 2, largest_and_smallest
beq $s7, 3, swap_the_array
beq $s7, 4, smooth_the_array
beq $s7, 5, reverse_the_array


exit_menu:
li $v0, 10                   # Exit program
syscall 




##--------------------------------------------------------------------------------------------------------------------
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  1. Print the array <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
##--------------------------------------------------------------------------------------------------------------------
print_the_array: 
li $v0, 4                
la $a0, display_elements     # display the elements of the array
syscall 

la $t0, array                # address of array will be loaded in $t0 which is the pointer for first element
li $t2, 1                    # $t2 is the counter of sequence

li $t6, 0                    # this will count number of colums in a row
loop: add $t2, $t2, 1        # increase the counter by 1 on $t2
beq $t6, 16, break           # print 16 elements then break
add $t6, $t6, 1              # add 1 to the counter
j flow

break:
la $a0, newline              # print new line
li $v0, 4
syscall 

li $t6, 1                    # counter add 1
flow:
lw $a0, ($t0)                # load in $a0 address of the element inside ($t0) 
li $v0, 1                    # print an integer
syscall 

li $v0, 4                    # print the gap
la $a0, gap
syscall 

add $t0, $t0, 4              # added 4 bits to $t0 and getting the address of the next element
ble $t2, 128, loop           # check $t2 until is equal or less to 128 elements than go to loop


j menu                       # jump to the label which signified the continuation of the main menu program

##--------------------------------------------------------------------------------------------------------------------
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  2. Print the largest and smallest <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
##--------------------------------------------------------------------------------------------------------------------
largest_and_smallest:
la $t0, array                # load $t0 as a pointer for address of array
lw $s0, ($t0)                # to store the first element as largest
lw $s1, ($t0)                # to store the first element as smallest
li $t1, 1                    # $t1 is counter
li $v0, 4                    # print the first message (largest number)
la $a0, largest            
syscall         
loop1: add $t1, $t1, 1
add $t0, $t0, 4              # getting the next element
lw $t2, ($t0)                # $t2 will get the next number
bgt $s0, $t2, lowest         # increment checking for largest
move $s0, $t2
lowest:
ble $s1, $t2, cond           # increment checking for smallest
move $s1, $t2
cond:
blt $t1, 128, loop1          # this counter check until reach 128 elements
move $a0, $s0                # to print the largest integer
li $v0, 1                    # print the first integer 
syscall 
li $v0, 4
la $a0, smallest             # Print the second message  (smallest number)
syscall 
move $a0, $s1
li $v0, 1
syscall 
j menu

##--------------------------------------------------------------------------------------------------------------------
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  3. Swap the largest and smalllest <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
##--------------------------------------------------------------------------------------------------------------------
swap_the_array:
li $v0, 4
la $a0, original_elements
syscall 
la $t0, array                # address of array will be loaded in $t0 which is the pointer
li $t2, 1                    # $t2 is the counter increase by 1

li $t6, 0                    # this will count number of colums in a row
loop0: add $t2, $t2, 1       # increase the counter by 1 in $t2
beq $t6, 16, break1          # print 16 elements then break the row
add $t6, $t6, 1              # add 1 to the element
j flow1

break1:
la $a0, newline              # print new line
li $v0, 4
syscall 

li $t6, 1                    # add 1 to the counter 
flow1:

lw $a0, ($t0)                # load address of the new element of the array
li $v0, 1                    # print an integer
syscall 
li $v0, 4                    # print the gap
la $a0, gap
syscall 
add $t0, $t0, 4              # added 4 bits and to get the address of the next element
ble $t2, 128, loop0          # check $t2 until is equal or less to 128 elements than go to loop
li $v0, 4                    # this will print the swapping suucesfully message
la $a0, swapping_succesfully
syscall 
#-----------------------------< From this point will print the swapping elements >-----------------------------------
li $t2, 1                   # $t2 is a counter, where to start the loop from
la $t0, array               # address of array will be loaded in $t0 which is the pointer
li $t1, 1                   # $t1 is counter for the loop
la $t0, array               # $t0 is a pointer, address of the array
lw $s0, ($t0)               # to store the first element as largest in $s0
lw $s1, ($t0)               # to store the first element as smallest in $s1
## We can use $s2 and $s3 to store the address of largest and smallest number 
la $s2, array               # address of largest
la $s3, array               # address of smallest
loop2: add $t1, $t1, 1
add $t0, $t0, 4
lw $t2, ($t0)               # getting the next element
bgt  $s0, $t2, lowest1
move $s0, $t2
move $s2, $t0
lowest1:
ble $s1, $t2, cond1
move $s1, $t2             
move $s3, $t0
cond1:
blt $t1, 128, loop2 # This is a check to repeat up to 128 numbers
# The largest number address is $s2 and larger is $s0.
# The smallest number address is $s3 and smallest is $s1.
# To swap $s0, will go in address $s3 and $s1 will go in $s2
sw $s0, ($s3)
sw $s1, ($s2) 
# This section will print the new elements
li $v0, 4                 # print the first messaje
la $a0, array_rearranging
syscall 
li $t2, 1                 # $t2 is counter of the numbers
la $t0, array             # $t0 is a pointer 

li $t6, 0                 # this will count number of colums in a row
loop3: add $t2, $t2, 1    # add 1 to the counter $t2
beq $t6, 16, break4       # print 16 elements then break the row
add $t6, $t6, 1           # add 1 to element 
j flow4

break4:
la $a0, newline           # print the line (with 16 elements in row)
li $v0, 4
syscall 

li $t6, 1                  # counter add 1
flow4:


lw $a0, ($t0)
li $v0, 1                 # to print an integer
syscall 
li $v0, 4                 # print the gap between numbers
la $a0, gap
syscall  
add $t0, $t0, 4           # added 4 bits and get address of the next element
ble $t2, 128, loop3       # this counter should go up for 128 elements
j menu

##--------------------------------------------------------------------------------------------------------------------
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  4. Smooth the Array <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
##--------------------------------------------------------------------------------------------------------------------
smooth_the_array:
li $t1, 1                 # $t1 is counter
la $t0, array             # $t0 is pointer
loop4: add $t1, $t1, 1
add $t0, $t0, 4           # we need to start the smoothing from next element
lw $s1, ($t0)             # to store the middle element 
div $s1, $s1, 2           # divide by 2 as we need 50%
lw $s0, -4($t0)           # to store the left element
div $s0, $s0, 4           # divide by 4 as we need 25%
lw $s2, 4($t0)            # to store the right element
div $s2, $s2, 4           # divide by 4 as we need 25%
add $s1, $s1, $s0         # add 25% to $s1
add $s1, $s1, $s2         # add 25% to $s1
                          # the whole answer is in $s1
sw $s1, ($t0)             # store the new smooth value in the same location
#---------------------------------------< now do the same for the next elements >-------------------------------------
blt $t1, 126, loop4       # 126 as we are leaving first and last element
#----------------------------- this will print the new elements of the array -----------------------------------------
li $v0, 4    
la $a0, smoothing
syscall 
li $t2, 1                 # $t2 is counter
la $t0, array             # $t0 is a pointer

li $t6, 0                 # this will count number of colums in a row
loop5: add $t2, $t2, 1    # increment the $t2 counter by 1
beq $t6, 16, break2       # print 16 elements then break the row
add $t6, $t6, 1           # add 1 to the counter
j flow2

break2:
la $a0, newline          # print new row with 16 elements
li $v0, 4
syscall 

li $t6, 1                 # counter 
flow2:

lw $a0, ($t0)
li $v0, 1                 # to print an integer
syscall
li $v0, 4                 # this will print that gap
la $a0, gap
syscall
add $t0, $t0, 4           # added 4 bits to $t0 and getting the address of the next integer
ble $t2, 128, loop5       # check $t2 untill is equal or less with 128 of elements
j menu

##--------------------------------------------------------------------------------------------------------------------
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  5. Reverse the array elements <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
##--------------------------------------------------------------------------------------------------------------------
reverse_the_array:
la $t0, array             # loading thr address of the first element
li $t1, 4
li $t5, 0                 # counter

mul $t1, $t1, 127         # multiply with one less than 128 the total lenth of array
add $t1, $t1, $t0         # $t1 is the address of last element
#-----------------------------< swapping starts here >-------------------------------------
loop6: add $t5, $t5, 1
lw $t2, ($t0)             # go to first starting address and get the value into $t2
lw $s0, ($t1)             # than go to the last address in $s0
sw $s0, ($t0)             # store word($s0) in the content of $t0 last address of array
sw $t2, ($t1)             # store word ($t2) in content of $t1 the last address of array
add $t0, $t0, 4           # start address should move to the next right
sub $t1, $t1, 4           # end address should move to left decrease
blt $t5, 64, loop6         # this comparisen should be half of the total number of array
li $v0, 4           
la $a0, array_reverse  
syscall                   # Display the reverese elements of the array
li $t2, 1                 # $t2 is a counter, where to start the loop from
la $t0, array             # $t0 is the first location from where the pointer start



loop7: add $t2, $t2, 1    # add 1
beq $t6, 16, break3       # print 16 elements then break the row
add $t6, $t6, 1           # counter + 1
j flow3

break3:
la $a0, newline          # print new line
li $v0, 4
syscall 

li $t6, 1                 # counter
flow3:



lw $a0, ($t0)             # this load the new element into $a0
li $v0, 1                 # this  will print an integer
syscall 
li $v0, 4                 # print the gap
la $a0, gap
syscall 
add $t0, $t0, 4            # add 4 bits because is an integer and get the next element
ble $t2, 128, loop7
j menu                     # jump to the label which signifies the continuation of the program or EXIT

