## ---------------------------------------------------
## Preparatory R Course - Day 1: Getting started with R
## ---------------------------------------------------
##
## This script contains all the code shown in the Day One
## explanation (01_Intro.pdf).


## 1. Running code -------------------------

# Running R Code is technically simple: type it into the console (bottom left panel
# in RStudio) and hit "Enter". Try, for example, typing 1 + 1 into the console.

# However, usually you want to write your code in a script like this one so it can
# be saved (File -> Save). This means you can close R and come back to your work later.
# To execute code written in a script, move your cursor to the line of code and either
# click the "run" button in the top right of this window or click CTRL + ENTER
# (CMD + ENTER on Mac). You should then see the output of the code in the console.

1 + 1

# Try highlighting only part of the line below and running them. 
# R will only run the highlighted part.

5 + 3 * 2

# Try highlighting multiple lines below and running them
# together:

1 + 1
2 + 2
3 + 3

## 2. Comments ------------------------------------------

# You have already seen that many lines in this script start with #.
# Anything after a # is a comment. R ignores comments -
# they are only there to help you (and others!) understand
# your code. Use them generously to explain what your code
# is doing and why.

4 + 9 # this comment explains what the code above does

## 3. R as a calculator ------------------------------------

# R can be used like a calculator directly in the console.
# We have already seen addition:

1 + 1

# You can also use subtraction, multiplication, division,
# and exponents:

10 - 4
6 * 7
10 / 3
10 %/% 3 # integer division
2^5
2**5 # alternative way of writing exponents
