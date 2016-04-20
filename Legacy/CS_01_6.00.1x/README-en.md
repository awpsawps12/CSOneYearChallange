# Introduction to Computer Science and Programming Using Python

6.00.1x is an introduction to computer science as a tool to solve real-world analytical problems.

**Resources**

- [Course Link]( https://www.edx.org/course/introduction-computer-science-mitx-6-00-1x-6#!)
- [Textbook Link](https://mitpress.mit.edu/books/introduction-computation-and-programming-using-python-0)

## Week 1: Introduction & Core Elements of Programs

Computational mode of thinking means that everything can be viewed as a math problem involving numbers and formulas.

Two types knowledges,

- Declarative(i.e., the desired result is specified), statement of facts ("the square root of `x` is a number `y`, that `y * y = x`, usually not what we need for computational thinking)
- Imperative(i.e., sequence of operation to perform), method on how you reached to that fact. (Such as [methods of computing square root](https://en.wikipedia.org/wiki/Methods_of_computing_square_roots))

Computer does **two** things and two things only,

- Stores data
- Computes data.

Computer has two types,

- Fixed, is designed to do very specific things(e.g. calculator).
- Stored, stores and manipulate instructions(e.g. modern computers) and then interpreter execute instructions in order.
  - Instructions are built from predefined primitive instructions
    - Arithmetic and logic
    - Simple tests
    - Moving data
  - Interpreter executes instructions
    - Use test to change flow of control

<img src="./resources/basic_machine_architecture.png" width="300">

*Basic Machine Architecture*

Program counter points the next executable instruction inside memory.

TODO: Change Turing Machine and Turing Completeness section

Turing ([*Alan Turing*](https://en.wikipedia.org/wiki/Alan_Turing), 1912-1954)  completeness states that anything computable can be computed using computer. (Any thing that can be programmed in one language can be programmed in any other language)

Programming languages define syntax and semantics needed to translate computational ideas into mechanical steps. Interactive with computer always roughly the same.

Languages difference are,

- Lower-level vs. high-level
- General vs. targeted to an application domain
- Interpreted vs. compiled

<img src="./resources/program_language_options.jpg" width="600">

1. Low level, instructions similar to internal control unit
  - Checker confirm syntax and static semantics correct
  - Interpreter follow the sequences of instructions
2. High level compiled
  - Check
  - Compile all
  - Interpreter
3. High level interpreted
  - Check
  - Converts each steps into low level instruction and executes

Aspects of [Programming Languages](https://en.wikipedia.org/wiki/Programming_language)

- Set of primitive constructs, literals such as number, string, [infix operators](https://en.wikipedia.org/wiki/Infix_notation)
- Syntax (Syntax error)
- Static semantics, whether valid statements have any meaning (Static semantics error, `10/'2'`)
- Semantics, There is [one and only one](https://en.wikipedia.org/wiki/Uniqueness_quantification) meaning associated with one particular statement (Meaning may not be what was intended, which can be prevented by practicing defensive programming)

Objects are the core things Python ([Python Syntax](https://learnxinyminutes.com/docs/python/)) programs manipulate. Object has type which defines things that programs can do that type. There are two types,

- Scalar(primitive type), indivisible like atoms (below are Python objects)
  - `int`
  - `float`
  - `bool`
  - `None`
- Non-scalar(compound objects), type with internal structure
  - `string`
  - etc.

*Expression* is the combination of objects and operators.

The simplest branching statement is a conditional,

- A test ([Comparisons operations](https://docs.python.org/2/reference/expressions.html#not-in))
- A block of code
- An optional block of code

## Week 2: Simple Algorithm & Functions

Loop characteristics (`for` and `while` statements),

- Loop variable (Initialize variable, change variable, test)
  - The variable also known as "state variable"
- Useful to think about a *decrementing function* to ensure code termination (Optional)

Convert decimal in to binary

```python
is num < 0:
  isNeg = True
  num = abs(num)
else:
  isNeg = False
result = ''
if num == 0:
  result = '0'
while num > 0:
  result = str(num % 2) + result # <- get the binary digit
  num /= 2 # <- shift to right
if isNeg:
  result = '-' + result
```

Fractional number is an estimation, therefore, NEVER use `==` when comparing two floating numbers instead `target_a - target_b < 0.00001` should be used.

*Floating number representation*

```
# Convert decimal fraction into binary floating representation
3/8 = 0.375 = 3*10*(-1) + 2*10**(-2) + 5*10*(-3)
# (1) Convert fractional into integer
0.375 * (2**3) = 3 (decimal)

# (2) Convert decimal into binary
3 -> 11

# (3) Divide by 2**3 (shift left)
0.011 (binary)
```

```python
# Refer conversion steps above
p = 0
while ((2**p)*num)%1 != 0: # (1) Convert fractional into whole num
  p += 1
print "p:", p
num = int(num*(2**p))
result = ''
if num == 0:
  result = '0'
while num > 0: # (2) Convert decimal into binary
  result = str(num%2) + result
  num /= 2
for i in range(p - len(result)): # (3) Division, shift left
  result = '0' + result
result = result[0:-p] + '.' + result[-p:]
print str(num), 'Binary Representation', result
```

If there is NO integer `p` such that `x*(2**p)` is a whole number, then internal representation is always an approximation.

[**Bisection Search**](https://en.wikipedia.org/wiki/Bisection_method)(Searching continuous function values)/[**Binary Search**](https://en.wikipedia.org/wiki/Binary_search_algorithm)(Searching a finite sorted array), reducing the range in each stage dramatically which means algorithm is important.
<!-- being smart about generating guesses is imporatnt for guess and check method.-->

<img src="./resources/binary_search.gif" width="400">

*The target number is 22*

```python
def function_name(formal_parameter0, formal_parameter1):
  return None

# Actual parameter also known as argument
function_name(actual_parameter0, actual_parameter1)
```

What happen when a function get invoked,

1. Bind actual parameter(s) and formal parameter(s)
2. Move *point of execution* to body of function
3. Execute function body until end or `return` (with newly created stack frame/symbol table, this scope called static/lexical scope)
4. Invocation value is the returned value(stack frame goes away/popped off the top stack after function completes)
5. Transfer back the *point of execution*

*Function name* is binding to the procedure object in python.

*Static/lexical* scoping can always be determined by looking at the program. Blackbox abstraction separates the details of how we do the computation from the use of the computation.

**Decomposition**, create structure, break a problem into modules that are self-contained and reusable.

**Abstraction**(many-to-one process), function provide abstraction (capture computation and treat as if primitive). Internal details are hidden (a.k.a. blackbox). It preserve relevant information in given context and forget irrelevant information. The **key of abstraction** is to find notion of relevance which is appropriate for both builder and client(True art).ext.

For parameter binding, Python supports *positional*, *keyword arguments* (used conjunction with default value, see below).

```Python
def function_name(formal_parameter0, formal_parameter1 = DEFAULT_VALUE):
  return None
```

```python
# object `x` bound to name in function
# it is treated as local to that function
def f(x): # <- `x` is local to `f` function
  def g():
    x = 'abc'
    print 'x:', x
  def h():
    z = x
    print 'z:', z
  x = x + 1
  print 'x:', x
  h()
  g()
  print 'x:', x
  return g

x = 3
z = f(x)
print 'x:', x
print 'z:', z
z()
```

The **Stack Frame** for function above,

<img src="./resources/stack_frames.png" width="400">

**Test function** is important which saves tremendous amount of time while developing.

[*docstring*](https://www.python.org/dev/peps/pep-0257/#specification) provides specifications of functions and can be accessed using the build-in `help`.

```python
# Google Style docstring
def function_with_docstring(arg):
    """function functionality description

    Args:
      arg (str): string argument sample input

    Returns:
      bool: True, False otherwise
    """
    return 1990

def findRoot(x, power, epsilon):
  """Assumes x and epsilon int or float,
    power an int, epsilon > 0 & power >= 1
    Returns float y such that y**power is within epsilon of x.
    If such a float does not exist,
    it returns None"""
  # Your code goes here
```

A **function specification** defines a contract between the function implementer and clients (users of a function). Two parts in the contact,

1. Assumptions, conditions must be met by clients
2. Guarantees, conditions must be met by the function

**Modules in Python**

A *module* is a `*.py` individual file containing Python definitions and statements. Each *module* has its private symbol table (environment).

```
# XYMath.py
pi = 3.141592653
```

Using `import` as a Namespace, however, `from XXXX import *` works like copy-paste.

```
# app.py
import XYMath
print XYMath.pi # -> 3.141592653
```

```
# app0.py
from XYMath import *
print pi # -> 3.141592653
```

## Week 3: Recursion & Objects

Looping constructs (`while` or `for`) leads to [iterative algorithm](https://en.wikipedia.org/wiki/Iterative_method).

**Recursion Algorithm** is important. It reduces a problem into a simple version of the same problem which can be solved directly. It made up of two parts,

- at least one base case
- at least one recursive (inductive) case

```python
# multiplication
def recurMul(a, b):
  if b == 1:
    return a
  else:
    return a + recurMul(a, b - 1)

# find factorial num using recursion
def factR(n):
  """Assumes that n is an int > 0
     Return n!"""
    if n == 1:
      return n
    else:
      return n * factR(n - 1)
```

> [Mathematical induction](https://en.wikipedia.org/wiki/Mathematical_induction)
>
> To prove a statement indexed on integers is true for all values of `n`
> - Prove it is true when `n` is smallest value
> - Then prove that if it is true for an arbitrary value of `n`, one can show that it must be true for `n + 1`

[**Divide and Conquer Algorithm**](https://en.wikipedia.org/wiki/Divide_and_conquer_algorithms) is based on *multi-branched recursion* which solves a hard problem by breaking it into a set of sub-problems such that sub-problems are easier to solve than the original and the solution of the sub-problems can be combined to solve the original problem.

[Global variable](https://en.wikipedia.org/wiki/Global_variable) is a variable with global [scope](https://en.wikipedia.org/wiki/Scope_(computer_science))(Inside the  program where the name binding is valid) which is dangerous and destroying code locality, therefore, use with caution. In Python, `global` keyword is to change/create global variable in a local context (See more [here](http://stackoverflow.com/questions/4693120/use-of-global-keyword-in-python))

**Compound Data Types** (Non-scalar Object), Tuples, Lists and Dictionaries.

- Tuples, ordered sequence of elements (any object with no aliasing issue)
  - Immutable (tuple, int, float, str)
  - Concatenation `+`
  - Indexing
  - Slicing
  - Singleton `(3,) # -> (3)` instead of `(3) # -> 3`
- List (Array in other languages), ordered sequence of values
  - Mutable
  - Singleton `[3]`
  - Cloning `new_array = origin_array[:]`
  - List comprehension `[x**2 for x in range(1,7)]` gives you `[1,4,9,16,25,36]` (Not readable)
  - Deletion `del array[index]`
- Dictionary, generalization of unordered lists(key can be any immutable value)
  - Mutable
  - Deletion `del dictionary[key]`

In Python, argument(s) is [passing by assignment](https://docs.python.org/3/faq/programming.html#how-do-i-write-a-function-with-output-parameters-call-by-reference).

- Reference/Nutable Type
  - Reference to an object, `Person` object
  - Data types are mutable, `list` or `dictionary`
- Immutable Type

*Passing Reference* may cause *aliasing bug* (Two distinct paths pointing to the save object).

In Python, **Function** is first class objects(higher order programming),

- it has types `<type 'function'>`
- it can be elements of data structures like lists
- it can appear in expressions (as part of assignment statement/argument to a function)

# Week 4: Debugging & Assertions and Exceptions

## Testing

Testing methods are ways of trying code on examples to determine if running correctly. Debugging methods are ways of fixing a program.

The code should be designed for ease of testing and debugging at first place by breaking program into components (functions/classes) that can be tested and debugged independently.

**Before test**,

- Ensure code runs (No syntax errors; No static semantic errors;)
- Have a set of expected results ready

**Prepare test**, the goal is to show that bugs exist (It is hard to prove that a code is bug free).

*Test Suite*, is a collection of inputs that has high likelihood of revealing bugs.

A *partition* of a set divides that set into a collection of subsets such that each element of the original set belongs to one of the subset. So it is reasonable to expose a bug if one exists.

- *Random Testing*, probability that code is correct increases with number of trials
- *Black-box Testing*, use heuristics based on exploring paths through the specification (Can be done by anyone; Avoid inherent biases; Reusable test)
- *Glass-box Testing*, use heuristics based on exploring paths through the code (all test suite should be *path-complete*, every potential path through the code)
  - Make sure all conditional (`if`) statements are checked
  - Ensure each `except` clause is executed
  - Ensure each loop have test where (loop is no entered; loop execute once and more than once)
  - Recursive function (no recursive call and more than one recursive call)

**Conduct test**,

- Unit testing, check each module and catch algorithm bugs
- Integration testing, check the system as a whole and catch interaction bugs
- Cycle between phases

Highly Automated Testing environment using,

- Test Drivers, set up environment needed to run code; run test suites; save results; report
- Stubs, simulate parts of program used by unit being tested (For example, Mock server or simulation of unimplemented funcitonality)

**Good Testing Practice**

- Start with unit testing
- Move to integration testing
- Regression testing after code is corrected (Check the program still passes all the tests)

## Debugging

> Debugging is an art.

The [first bug](http://thenextweb.com/shareables/2013/09/18/the-very-first-computer-bug/) was found at Harvard on the **Mark II**.

Information of bugs,

- Runtime bugs, occur during running of code
  - Overt, has an obvious manifestation (crashes/runs forever)
  - Covert, has no obvious manifestation (return values which may not correct)
  - Persistent, occurs every time code is runs
  - Intermittent, only occurs sometimes (even on save input)

Categories of bugs,

- Overt and persistent
  - Obvious to detect
  - Avoid by using *defensive programming* (bug fall into this category)
- Overt and intermittent
  - Hard to debug
- Covert  
  - Highly dangerous

[*Defensive Programming*](https://en.wikipedia.org/wiki/Defensive_programming), programming mistakes lead to bugs that are both overt and persistent.

**Debugging Skills** (Debugging as Search)

Debugging(Transferable skill) is the searching process for an explanation of certain behavior. The key to being good at debugging is being systematic in conducting search.

- Study available data (both correct/incorrect test cases)
- Form an hypothesis that consistent with the data
- Design and run a repeatable experiment with potential to refute the hypothesis

*Bisection search* is a powerful method to narrowing down the buggy area (Think about the code as a list, start from the middle of the code).

**Debugging Hints**(7)

- Look for the usual suspects
- Ask why the code is doing what it is, NOT why it is not doing what you want
- The bug is probably not where your think it is (eliminate locations)
- Explain the problem to someone else
- Do NOT believe everything you read (the documentation)
- Stop debugging and start writing doc. which help you approach the problem from a different perspective
- Take a break and come back to the bug later (Most useful)

## Assertions and Exceptions

*Exception* (Build-in Exception Details [here](https://docs.python.org/2/library/exceptions.html)) is an unexpected condition. What to do when there is an exception,

- Fail silent (BAD)
- Return an 'Error' value (`-1` was return in early days; Extra checking code for other function)
- Stop execution, signal error condition (`raise Exception("Error Information")`)

Python code can provide handler for exception, but handler usually is only meant to deal with one particular type of exception.

```python
try:
  f = open('filename.txt')
except IOerror e:
  # Exception propagation
  # Raise the exception to caller (See explanation below)
  raise Exception("Cannot open file")
```

Common error types are,

- `SyntaxError`
- `NameError`, local/global name not found
- `AttributeError`, attribute reference fails
- `TypeError`, operand does not have correct type `'a' + 3`
- `ValueError`, operand type okay, but value is illegal `int('$')`
- `IOError`, IO system reports malfunction (file not found)

User-defined Exceptions

```python
class NetworkError(RuntimeError):
  def __init__(self, arg):
    self.args = arg

try:
  raise NetworkError("Bad hostname")
except NetworkError, e:
  print e.args
```

Catch all exceptions,

```python
try:
  # Your code here
except:
  # Catch *all* exceptions
```

The extension to `try`,

- `else`, executed when no exception
- `finally`, always get executed (useful for clean up)

```python
def divide(x, y):
  try:
    result = x / y
  except ZeroDivisionError e:
    print str(e)
  except TypeError e:
    print str(e)
  except ValueError, Argument:
    print Argument
  else:
    # If there is NO exception
    print result
  finally:
    # Always get executed
    print "Finally Clause"
```

In Python, [`raise`](https://docs.python.org/2/tutorial/errors.html#raising-exceptions) has two usage (See discussion [here](http://stackoverflow.com/questions/13957829/how-to-use-raise-keyword-in-python)),

- Raising errors when the function unable to produce a result consistent with specification, `raise [Exception [, args [, traceback]]]`
- Re-raise the exception in an exception handler, so that it can be handled further up the call stack

```python
def function_name(arg):
  if arg < 1:
    #      Exception    Argument
    #         |           |
    raise "Invalid Arg", arg

try:
  function_name(0)
except "Invalid Arg", Argument
  print Argument # -> 0
else:
  print "Done"
```

**Asssertions**, `assert Expression[, Arguments]`, can be used to ensure the assumptions on state of computation are as expected (sanity-check). If it does NOT meet the assumption, `AssertionError` will be raised which can be handled by `try-except` statement. (a.k.a Denfensive Programming)

```python
def avg(grades, weights):
  # Raise AssertionException when list is empty
  assert not len(grades) == 0, 'No grades data'
  # Python list comprehension
  new_grade = [convertLetterGrade(elt) for elt in grades]
  return dotProduct(new_grade, weights) / len(new_grade)
```

Use assertion for *Defensive Programming*, checks pre- and post-conditions on input and output, avoid propagating bad value(s).

Common usage of `assert` are,

- Checking types/values of arguments
- Checking that invariants on data structures are met
- Checking constraints on return values
- Checking for violations of constraints on procedure

# Week 5: Efficiency and Orders of Growth & Memory and Search Time

The designing programs goals are,

1. Return the correct answer on all legal inputs (Most important)
2. Performs the computation efficiency (Sometime critical, always valuable to understand and optimize)

Computational complexity related to two things (1) how much time will it take a program to run and (2) how much memory will it need to run. It is also important to balance to computational complexity and conceptual complexity.

**Computational Complexity**

*Measure complexity* (How long will program take to run?) The answer depends on,

- Machine speed (Measuring time in term of number of basic steps executed)
- Specifics code implementation (See method above)
- Input value (Measuring in term of input size)

Use [Random Access Machine](https://en.wikipedia.org/wiki/Random-access_machine) (RAM) as computation model to measure basic steps,

- Steps are executed sequentially
- Step is an operation that takes constant time (assignment, comparison, arithmetic operation, accessing object in memory)

Different input will result different output which affect measuring program complexity. The cases for measuring complexity are ([Best, worst and average case](https://en.wikipedia.org/wiki/Best,_worst_and_average_case)),

- Best case, minimum running time over all possible input of a give size
- Worst case(our focus, upper bound on running time), maximum running time over all possible input of given size
- Average/Expected case, average running time over all possible inputs of give size

The multiplicative constants are not relevant when comparing algorithms (`5n + 2` is basically as same as `n`), focus on the largest factor in the expression.

# Week 6: Placeholder

# Extra Python Related Things

**File Handling** (Reading more about Python I/O [here](https://docs.python.org/2/tutorial/inputoutput.html))

- `w`, write only method
- `r`, read only method
- `r+`, read and write methods
- `a`, append method

```
# Writing File
nameHandler = open('kids', 'w') # `w`, write method
for i in range(2):
  name = raw_input('Enter name: ')
  nameHandler.write(name + '\n')
nameHandler.close() # Important to close the file after usage

# Reading File
nameHandler = open('kids', 'r') # 'r', read method
for line in nameHandler:
  print line
nameHandler.close()
```

**String Interpolation**, `%` operator taks a printf-type format string on the left and the matching value on the right.

```python
# % operator
text = "%d int, %s string, %f%g floating point" % (3, 'hi', 3.14, 3.14)

# format function
"my {0} string: {1}".format("cool", "Hello there!")
```

**Sorting**, custome sotring with `key=`,

```python
strs = ['ccc', 'aaaa', 'd', 'bb']
print sorted(strs, key=len)  ## ['d', 'bb', 'ccc', 'aaaa']
```

**Regular Expression**, language used for matching patterns. `import re` before start. Search result(s) is stored inside `match` (See below).

```python
# match = re.search(pat, str)
match = re.search(r'word:\w\w\w', 'an example word:cat!!')

# `r` designated a python 'raw' string
# Always write pattern string with `r` at front
```

TODO: https://developers.google.com/edu/python/regular-expressions#basic-patterns

**Utilities**

`os`, `os.path` include functions to interact with the file system. `shutil` module can copy files.

*Running external processes*, [`commands`](https://docs.python.org/2/library/commands.html#module-commands) module can be used to run external command and capture its output. (Python 3.0 use [`subprocess`](https://docs.python.org/2/library/subprocess.html#module-subprocess) instead)


# Extra

*Computational Complexity* is the intrinsic difficulty of problems.

**Algorithmic Technique**

- [Trial and error](https://en.wikipedia.org/wiki/Trial_and_error) (Guess and check)
  - [Brute-force Search](https://en.wikipedia.org/wiki/Brute-force_search) (Exhaustive search or generate and test)

# I DO NOT UNDERSTAND THIS

[**Newton-Raphson**](https://en.wikipedia.org/wiki/Newton%27s_method), most commonly used approximation algorithm.