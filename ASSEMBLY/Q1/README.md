## Q1 (Capture the Flag!) - 30 points
You are provided with 3 binary executables named as part_a, part_b, part_c. Use the objdump command to disassemble these executables, and understand them and obtain a valid output from them. 
* For part_a, the program takes in only a integer input \[definition: `part_a(int)`\] . A valid input results in a valid output while any other input terminates the program.
* For part_b, the program takes in 3 integer inputs \[definition: `part_b(int,int,int)`\]. Given a valid triplet you obtain a valid output, while every other branch terminates.
* For part_c, the program takes in a string input \[definition: `part_c(char*)`\]. A specific null-terminated string results in a valid output, in all other cases the program terminates

For each of the programs, you will also get a secret number, which you should include in your `report`. Along with that, provide clear insights on how you read through the assembly code, and how you discovered the implementation details. Finally, print the following string(flag) into your `report`:
`{part 1’s output} + {part 3’s output} + {part 2’s output}`, where + denotes concatenation.

### Grading Scheme:
* If no explanation is provided, `0` marks will be provided even if the correct flag is given.
