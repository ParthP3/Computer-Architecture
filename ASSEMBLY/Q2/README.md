## Q2 (Find the inverse modulo m) - 20 points
Write an assembly program(`inverse.s`) using MIPS32 ISA to find the inverse of a number a modulo m. Note that the inverse of `a` modulo `m` is the number `x` such that `ax = 1 (mod m)`. 

The program takes in input (format specified below) from a file named `input.txt`, and write it to a file named `output.txt`
Make sure to include your approach with detailed explanation in the `report` file.

### Input Format(`input.txt`):
```
a 
m
```

### Output Format(`output.txt`):
```
x 
```

### Constraints:
* a, m are 64-bit positive integers.
* a, m are coprime.