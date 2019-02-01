{-
  This example demonstrates a generalized architecture for designing solutions
  for most Kattis problems. Think separately about three distinct steps:
    1. Read the input and parse it into structure that you need.
    2. Do the actual work of processing the data into a final result.
    3. Displaying the final result to the user in the required format.
      The return type of the first function must align with the return type of the
      second function
  In order to divide a problem up like this, we must identify:
    * What is the essential form of the input data?
    * What really is it that we are computing?
  The answers to these two questions will dictate the interface (that is,
  the argument and return types) between each pair of functions.
  The code below is left unfinished (will not compile), precisely because the
  specific details of each step depend on the problem to be solved. However,
  this design allows you to assume that both the input and output will be one
  large String, with no need to concern yourself with IO. Since Strings are
  just lists (of Char), you can use the usual list-processing functions to
  massage the input/output into the form you need.
-}

main :: IO ()
main = interact (showResult . doTheWork . parseInput)

parseInput :: String -> a
parseInput = undefined

doTheWork :: a -> b
doTheWork = undefined

showResult :: b -> String
showResult = undefined