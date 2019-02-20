# Entry 06

## Feb 18

I'm doing the `numsearch` problem for the lab, and I'm going to try to do the parsing function first to make sure that I understand all the inputs and how they related to the problem that I'm going to solve.

I'm planning on getting the first number to derive how many rows I need to take for the actual number board, and then I'm going to take all the rest of the rows as the numbers I am searching for.

I think as far as a top down decomposition, I'll do the following:

1. Parse the input into the board and the numbers to be searched
2. Then I'll search each row for the numbers
3. Then I'll search each column for the numbers
4. Then I'll search each row for the numbers
5. Then I'll turn the `False`s into `0` and the `True`s into `1`s
6. Then I'll return the sum as the `display` output
