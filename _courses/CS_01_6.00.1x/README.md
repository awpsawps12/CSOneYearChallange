# 计算机科学简介与使用 Python 进行编程

6.00.1x 将介绍怎么使用计算机科学来分析与解决现实中的问题

**资源**

- [课程链接]( https://www.edx.org/course/introduction-computer-science-mitx-6-00-1x-6#!)
- [课本链接](https://mitpress.mit.edu/books/introduction-computation-and-programming-using-python-0)

## Week 1: 简介与 Python 编程基础

### Lecture 1: 简介

![](./resources/Day001.png)

今天我们学到的内容有计算和计算思维（Computational Thinking）的基本原则。

计算机只做两件事并做的非常好，**计算** 和 **储存**。

计算机里的存储单元的基本单位为 **字节** (byte)，他们看起来就像是这样，`00000000`。

**计算模式思维** 指把任何问题都当做可以被数字和公式去解决的数学问题。

知识分为两种类型，
- 陈述性 (Declarative) 知识，用以阐述客观事实
- 流程性 (Imperative) 知识，用以阐述“怎么样能够...”的一系列步骤

在计算机科学中我们更注重的是流程性的知识，因为它可以帮我们解决问题。

计算机有两种类型，

- 固定型 (Fixed)，被设计用于执行特定的事情（例如，计算器）
- 存储型 (Stored)，可存储和操作用户指令
  - 用户指令是基于原始内置指令构建封装而成，原始内置指令 (Primitive Instructions) 包括：
    - 算数单元 (Arithmetic) 和逻辑单元 (Logic)
    - 简单的测试单元
    - 对于数据的操作
  - 解析器（Interpreter）用于执行指令
    - 使用测试单元进行流程控制 (Flow of Control)

<img src="./resources/basic_machine_architecture.png" width="300">

*基础计算机结构*

- 内存 (Memory)，用于存储用户指令和运行所得到的结果
- 算数逻辑单元 (Arithmetic Logic Unit)，完成原始操作指令的运行
- 控制单元 (Control Unit)，控制运行流程，控制算数逻辑单元执行某条命令

计算机的运算流程，

1. 内存中存储了一系列指令 (Instructions)
2. 在控制单元中会初始化一个程序计数器 (Program Counter) 指向内存序列中的第一条指令，当程序开始运行时，解析器会从这条指令开始执行
3. 执行这条指令时，会从内存中取出数值，在算数逻辑单元中运行，运行结束后会将结果返回给内存
4. 程序计数器的数值加 `1` ，以为着指向下一条将要被执行的指令。直至所有命令运行完毕

流程控制可以改变程序计数器的数值，这样就可以改变所执行的命令了。

任何一种编程语言都有下面的四个特性，

1. 它提供了基础的操作指令（Primitive Constructs），例如数据类型和操作符号
2. 句法（Syntax），怎么样的代码是合法的字符串，比如中文句子需要在结尾处有句号
3. 静态语义（Static Semantics），在未执行代码时，代码是有意义的。例如，`狗吃阳光。`是一个符合句法的句子，但是它本身并无意义因为狗不能吃阳光
4. 语义（Semantics），在满足上述两条的情况下，每一句代码有且只有唯一的一个意思

随之而来也会产出两种错误，

- 语法错误（Syntax Error)，常见但很容易被计算机捕获到，在运行程序之前即可被发现
- 语义错误（Semantics Error），一部分语言在运行程序前检查，另一些语言在解析时检查

### Lecture 2: Python 编程基础

![](./resources/Day002.png)

今天我们学到的内容是编程语言 Python 的一些基础知识。

当我们想要将我们的一些基于计算思维的想法转换成计算能懂的机器语言的时候，编程语言就成为了两者间的媒介，编程语言定义了一些句法和语义来帮助我们进行转换。

我们来回忆一下，句法（Syntax）说明编程语言中，哪些符号或字符的组合方式是合法的，语义（Semantic）则是对于编程所要表达意思的解释

通过使用编程语言编写的对于计算操作指令称为源代码 (Source Code)

编程语言的对比：
- 低级语言 (Low-level Programming Language) vs. 高级语言 (High-level Programming Language)
- 直译式语言 (Interpreted Language) vs. 编译式语言 (Compiled Language)

<img src="./resources/program_language_options.jpg" width="600">

低级语言,
- 低级编程语言的语法与语义和计算机的机器语言极其相似
- 检查程序仅仅检查其语法的正确和静态语义的正确
- 仅仅是按照解析器 (Interpreter) 所指向的命令顺序进行执行

高级语言,
- 直译式语言：这种类型的编程语言，会将代码一句一句在执行前转换成机器码运行
  - Python 就是直译式的编程语言
- 编译式语言：这种编程语言需要利用解释器，在运行期，动态将代码逐句直译（Interpret）为机器码，或是已经预先编译为机器码的的子程序，之后再运行

最基本的 Python 解析器被称为 shell，用户可在其中直接输入命令来执行各种各样的任务

对象 (Objects) 是 Python 程序中操作的核心元素，对象定义了类型和程序可以对该对象进行的操作，有两种类型的对象：

- 基本对象 (Scalar Objects)：
  - `int`
  - `float`
  - `bool`
  - `None`
- 非基本对象 (Compound Objects 也称之为 Non-scalar Objects)
  - `string`
  - etc.

表达式是由对象和操作符 (Operators) 拼接而成。

直线程序 (Straight-line programs)，即按照命令顺序执行的程序

分支程序 (Brunch Programs)，分支程序允许我们根据不同的条件执行不同的程序

最简单的分支语句是条件语句 (Conditional)
  - 条件语句都拥有一个判断条件，即一个能得出 `Ture` 或者 `False` 的布尔（Boolean）表达式
  - 条件语句都包含该两个代码块，即一个当判断条件为 `Ture` 的时候执行的代码，另一个是判断条件为 `False` 时执行的代码

下面是一个简单的判断程序，

  ```
  x = int(raw_input('Enter an integer:'))
  if x%2 == 0:
      print('')
      print('Even')
  else:
      print('')
      print('Odd')
  print('Done with conditional')
  ```

Python 使用 `==` 判断符进行值之间的比较判断，一个 `=` 为赋值运算符。空格在 Python 中是非常重要的，因为 Python 用它来区分代码块。

## Week 2: 简介与 Python 编程基础

### Lecture 3: Python 的迭代循环以及算法基础

![](./resources/Day003.png)

今天我们学到的内容是 Python 的迭代循环以及算法基础。

迭代循环 (Iteration Loop)，
1. 始于一个判断条件，判断条件返回一个布尔值（`True` 或者 `False`）
2. 如果为 `True` ，则执行循环内部代码，然后再次进行判断，以此循环
3. 直到判断条件为 `False` 时才跳出循环体

一个简单使用循环和加法完成乘法运算的例子，

```python
x = 4
ans = 0
itersLeft = x
while (itersLeft != 0):
  ans = ans + x
  itersLeft = itersLeft - 1
print(str(x) + '*' + str(x) + '=' + str(ans))
```
- 需要在循环体外面摄设置一个循环变量，该例子中分别为 `itersLeft`
- 对循环变量进行条件判断已决定什么时候终止循环，该例子中为 `itersLeft != 0`
- 在每次执行完循环体内的代码时，需要改变循环变量的数值，该例子中为 `itersLeft = itersLeft  - 1`，如果不改变，则每次判断的结果都相同，循环就不会终止

Python 中有两种迭代循环方法，他们分别是
- `while` 循环
- `For` 循环

循环的特点是具备循至少一个环变量(设置初始值，根据判断条件进行判断，在循环体内改变循环变量)，或者我们可称之为状态变量 (State Variable)

我们来回忆一下，分支结构 (Branching Structures) 允许我们根据不同的条件执行不同的代码块，因此程序的执行时间是固定的 (Constant Time)，因为每个代码块被执行的次数至多为 1 次。

循环结构允许我们根据不同的条件重复执行相同的代码块，这样程序的执行时间则是根据循环次数而决定的。

计算机内部任何数值需要被转换成二进制数值才能用于进行计算和存储，下面是两个简单进制转换算法

**十进制整数转换二进制正数**

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

**十进制小数转换成二进制小数**

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

### Lecture 4: 抽象以及在 Python 中使用函数进行抽象

![](./resources/Day004.png)

今天我们学到的内容是抽象（Abstraction）以及在 Python 中如何使用函数进行抽象

程序抽象可以，

1. 让使用者不用关心底层的实现过程
2. 复用
3. 有效的控制变量的作用域

函数其实就是最基本的一种代码抽象的方式。在 Python 中，定义一个函数要使用 `def` 语句，依次写出函数名、括号、括号中的参数和冒号 `:`，以及缩进块中编写函数体。

我们其实经常说“传参”其实这个参数是有一个实参（Actual Parameter）和形参（Formal Parameter 也叫 Argument）的区别。形参是指在函数定义时设置的参数，实参则是真正传入的参数。

```python
# 这里的参数为形参
def function_name(formal_parameter0, formal_parameter1):
  return None

# 这里传入的就是实参
function_name(actual_parameter0, actual_parameter1)
```

函数体包含了任意的合法表达式，一下两种情况会终止函数体执行，
1. 函数体内的表达式全部执行完成，这种情况下会返回 `None`，代表没任何东西被返回
2. 遇见关键字 `return` ,这种情况下会返回指定表达式的值

当我们调用一个函数的时候，

1. 将实参 (Actual Parameter）和形参（Formal Parameter）绑定在一起
2. 将执行指针 (Point of Execution) 指向函数体
3. 执行函数体
4. 函数体返回的值即为函数的调用值
5. 将执行指针的指向改变回来

程序执行环境 (Environment)是一种用于查询变量与其所属的值绑定关系的方式。在 Python Shell 的环境中存在的所有变量均为全局变量也就是说他们处于一个全局环境中（Global Environment）。

当我们调用一个函数时，
2. 函数对象会创建出一个新的子环境，在这个环境中根据调用时传递的数值重新进行变量绑定
3. 根据新的子环境中的变量绑定关系，执行函数体内的表达式

每次函数调用的作用域被称作静态作用域 (Static Scope) 或词法作用域 (Lexical Scope)

```python
def square(x):
  return x * x

def twoPower(x, n):
  while n > 1:
    x = square(x)
    n = n/2
  return x

x = 5
n = 1
z = twoPower(2, 8)
print(z)       #256
```

1. 全局中的变量绑定的值不会影响到函数环境中的变量值
2. 函数体中所需要变量 `x` 和 `n` 的值来源于参数传递，而非全局环境下的同名变量值
3. 在最初调用 `twoPower()` 时
4. 在 `while` 循环中每次调用 `square()` 时，都会产生新的运行环境，而这个环境的父子环境为调用 `twoPower()` 所产生的运行环境，所以 `square(x)` 中所需要的 `x` 的值来源于 `twoPower()` 运行环境

函数的两种属性，
- 可分性 (Decomposition)，我们可以讲问题分解成无数个模块，并且每个模块是可复用的
- 抽象性 (Abstraction)，用户并不需要知道程序的具体细节，他们只需要知道怎么使用，函数能够让细节保持在内部并不暴漏出来，就像一个黑盒

模块化使程序的可维护性以及复用性大大提高，并且避免了函数名和变量名冲突。在 Python 中的模块是一个单独存在的 `*.py` 文件，其中包含了若干个定义或封装好的函数，每一个模块都拥有自己独立的执行环境。下面是一个 Python 模块的例子

```python
# XYMath.py
pi = 3.141592653
```

使用 `import` 来调用模块并创建一个命名空间（Namespace）再用点的方式（Dot Notation）来获取这个命名空间里的数据。

```python
# app.py
import XYMath
print XYMath.pi # -> 3.141592653
```

使用 `*` 来引用全部的内容，有些类似于拷贝整个模块中的文件去引用文件的行首。

```python
# app0.py
from XYMath import *
print pi # -> 3.141592653
```

## Week 3: 递归与对象

### Lecture 5: 递归

![](./resources/Day005.png)

今天我们学到的知识是递归（Recursion）和复合数据类型。

循环让我们可以使用循环的算法（第三天的四种算法）。而递归则可以化难为简，将一个复杂的问题简化，直至简化到这个问题可以简单到直接获取他的答案。（不要害怕递归，其实它只是一种运算思路并不是什么高深莫测的东西）

递归就是一个函数在函数体内调用自己的运算方式。下面是一个简单的乘法递归例子，

```python
def recursion_multiplication(a, b):
  if b == 1:
    return a
  else:
    return a + recursion_multiplication(a, b - 1)
```

任何一个递归函数都拥有下面的两个特性，

- 至少拥有一个结束判断（Base Case）
- 至少拥有一个递归判断（Recursion Case）

当调用递归函数的时候，根据实参值得不同来进入不同判断，直到某一次的函数调用触发了结束判断时，函数的值就会一层层的返回到它的调用函数中，并在最后成为第一个调用函数的返回值。

符合数据类型（Compound Data Type 在 Python 中也称之为 Non-scalar Script），是有基础数据类型组合而成。在 Python 中它们是 Tuples，Lists 还有 Dictionary。

下面我们来简单的对比下这几个数据类型的区别，

- Tuple，有序不可修改的元素组（元素可以为任意数据类型）
- List，有序可以修改的元素组
- Dictionary，无序可修改的并可用关键字引用的数据类型

可修改的数据类型会存在别名错误（Aliasing Bug）这种错误就是不同的变量名引用了同样的数据源，修改数据源则会导致其他的这几个变量所引用的的数据全部发生了改变。

### Lecture 6: 对象

![](./resources/Day006.png)

符合数据类型 (Compound Data Types)
- 元祖 (Tuples)
- 列表 (Lists)
- 词典 (Dictionaries)

元祖是由任意元素组成的有序列表。

```python
tuples_name = (element0, element2, ...)
```

元祖的属性与方法有，
- 元祖一旦初始化后就**不能修改** (就如同，`int`，`float`，`str` 也同样在初始化后不可修改)
- 拼接 (Concatenation)
- 使用索引 (Index) 调用内部元素
- 截取 (Slicing)
- 初始化单独元素的时候，需要加逗号以区分和数字的区别，`tulpe = (1,)`
- 可使用 `For loop` 对元祖元素进行遍历

列表，与元祖类似，由任意元素组成的有序列表，不同的是，使用中括号进行定义并且**可以修改**，

```python
list_name = [element0, element2, ...]
```

列表的属性与方法有，
- 初始化单独元素的时候，不需加额外的逗号，`list = [1]`
- 列表是可变的
- 可使用 `For loop` 对列表元素进行遍历
- 使用 `append()` 向列表末尾添加元素，与拼接创建出一个新列表不同，`append()` 修改了原列表
- 克隆 (Clone) `new_list = origin_list[:]`


函数是第一类对象 (First-class Object)，第一类对象拥有以下特性，
- 拥有类型 (Types)
- 可以成为数据结构中的元素
- 可以在表达式中使用，比如赋值表达式或是作为函数参数

高阶函数 (Higher-order Functions)
- `map(element0, element1, ...)` 函数接收两个或以上参数，`element0`是函数，`map` 将传入的函数依次作用到序列的每个元素，并把结果作为新的list返回。

```python
L1 = [1, 28, 36]
L2 = [2, 57, 9]
map(min, L1, L2)      #[1, 28, 9]
```

词典，使用键-值（Key-value）存储

- 键初始化后是不可变的，对应的值是可变的
- 键可以是复杂形式
- 不能以数字索引访问其中的元素，以键进行索引

## Week 4:

### Lecture 7: 测试与除错

![](./resources/Day007.png)

我们今天学习的内容有测试 (Testing) 和除错 (Debugging)。

#### 测试

我们写的代码不可能永远都不会出错，所以我们需要，

- 测试的方法 (Testing Methods)，使用测试样例来检测代码是否运行正常
- 除错的方法 (Debugging Methods)，

在我们开始编程之前，我们就应该设计我们的代码以使得更简单的去进行测试和除错，

- 将我们的程序拆解成个个组件 (Components) ，使我们可以单独的测试它们每一个
- 编写良好的技术文档 (Documentation) ，记录对于程序输入与输出的预期

首先在我们开始测试之前，我们需要满足以下两点，

- 确保程序可以正常运行，目的是为了除去语法 (Syntax Errors)和词法错误 (Static Semantic Errors)
- 对于程序运行结果有一个预期

> *Test Suite*（测试组件）, is a collection of inputs that has high likelihood of revealing bugs.

对可能的输入进行划分 (partition) ，每一组输入都代表一种单独的属性，

当没有自然分区 (Natural Partition) 的时候，可以使用随机测试 (Random testing)，因为这时代码的正确率与测试样例的数量成正比

黑盒测试 (Black-box Testing)，也可以称为功能测试、数据驱动测试或基于规格说明的测试。一种关注于程序的输入、输出和系统的功能的测试，
- 任何人都可以进行的测试
- 可以避免开发者的固有偏见 (Inherent Biases)，更容易发现潜在的错误
- 测试样例的复用性很高

> paths through the specification

测试时是应考虑边界条件，

- 对于列表 (List)，应考虑空列表 (Empty List)，单独元素列表 (Singleton List)，多元素列表 (Many Element List)
- 对于数字 (Numbers)，应考虑极小数，极大数以及特征值 (Typical )

透明盒测试（Glass-box Testing)，又称透明盒测试（glass box testing）、结构测试（structural testing）或基于程序本身的测试，一种关注于应用程序的内部结构或运作的测试(测试程序中每一条逻辑的正确性)，

- 检测 `if` 语句的每一条分支
- 检测每一条 `except` 的分句 (Each `except` clause)
- 检测每一个循环语句(没有进入循环体，循环体执行一次以及循环的多次执行)，对于 `while` 语句，还需要检查跳出循环的条件
- 检查每一个递归函数(没有进行递归，递归一次以及多措递归)

经行测试 (Conduct test) 的步骤，

1. 单元测试 (Unit testing)，对程序每一个模块 (module) 进行以找到算法错误 (Algorithm Bugs)。
2. 集成测试 (Integration testing)，将程序的所有模块全部关联起来进行测试以找到交互错误 (Interaction Bugs)。
3. 循环执行前两步

自动化测试,
- 测试驱动（Test Drivers）
- 部分功能模块模拟（Stubs）

#### 除错

运行环境错误 (Runtime Bugs)，当程序运行所产生的错误

显式 (Overt) vs. 隐式(Covert)，

- 显式错误，即错误有明显的表现形式，比如代码无限执行，代码崩溃。
- 隐式，即错误没有明显的表现形式，比如程序返回一个错误的值，但很难查明原因。

持续性 (Persistent) vs. 间歇性 (Intermittent)，

- 持续性错误，当程序运行时，一直产生的错误。
- 间歇性错误，只有特点条件下或是在不同时间相同输入所产生的错误。

程序错误的种类，

- 显式且持续性错误，容易被检测到，可以使防御性编程（Defensive programming）来进行避免
- 显示且间歇性错误，难以被发现及除错，当时如果我们能复现产生该类型错误的条件，我们就可以更好的去解决它。
- 隐式错误，很难被发现，只有程序运行了足够长的时间后才能有所察觉。

除错的技巧，是将寻找错误的过程当做一个搜索问题去处理，“寻找对于错误表现的解答，而不是为什么错误”

- 研究现有的数据
- 形成一些通过研究数据得出的假设
- 设计一个可重复性的实验，来一一检验这些假设
- 通过这些检验结果来缩小假设的范围

当发现错误的时候，我们可以使用二元检查法，即在程序的一半处打断点，检查运行哪一部分时会出现错误。以此循环，用来缩小检查范围，定位程序错误。

下面是一些常用的排错小提示，

- 检查经常产生的基本代码错误
- 查找为什么代码会这样运行的原因，而不是查找为什么代码没有按照自己所预想的那样运行的原因
- 错误往往出现在你想不到的地方，所以应排除任何一个可能出错的地方
- 向他人解释出了什么问题，和程序的流程
- 不要相信说明文档
- 做一个短暂的休息

### Lecture 8: 异常与断言

异常 (Exceptions，Build-in Exception Details [here](https://docs.python.org/2/library/exceptions.html)) ，指程序运行中出现不可预期的情况。

什么时候会发生，例如

- 使用超过列表范围的索引值，会产生 `IndexError`
- 类型转换，会产生 `TypeError`
- 引用一个不存在的变量，会产生 `NameError`
- 对不同类型的数据进行运算，在没有做强制类型转换的情况下，会产生 `TypeError`

对于异常处理的方法，
- 不理会 (非常不好)
- 返回一个错误值
- 停止程序执行，抛出单独异常的情况，在 Python 中我们称之为抛出异常(Raising an Exception)，`raise Exception("Error Information")`

在 Python 中处理异常，

Python 提供了处理异常的处理器 (Handler)，`try ... expect...`

异常处理器会对特定的异常类型进行处理，

```python
try:
  f = open('filename.txt')
except IOerror e:           
  # e is the actual error object
  # Exception propagation
  # Raise the exception to caller (See explanation below)
  raise Exception("Cannot open file")
```

Python 中常见的异常，
- `SyntaxError`，Python 不能解析程序中的语法
- `NameError`，找不到该变量名
- `AttributeError`，属性引用失败
- `TypeError`，运算类型不对
- `ValueError`，对错误的类型进行数据转换
- `IOError`，系统故障(文件没有找到)

自定义一个异常处理，

```python
class NetworkError(RuntimeError):
  def __init__(self, arg):
    self.args = arg

try:
  raise NetworkError("Bad hostname")
except NetworkError, e:
  print e.args
```

捕获所有异常，

```python
try:
  # Your code here
except:
  # Catch *all* exceptions
```

关于 `Try` 的扩展，
- `else` 语句，当没有异常发生时，则会执行 `else` 中的代码
- `finally` 语句， 会在 `try`，`except`，`else` 后执行，该语句一定会被执行，哪怕是遇到错误或是执行了 `break`，`continue` 或者 `return` 语句

一个简单的列子，

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

断言 (Assertions)指的是程序进行到某个时间点，断定其必然是某种状态，具体来讲，也就是断定改时间点上，某变量一定是某值，或是具有必定的属性。

Python 使用 `assert Expression[, Arguments]` 来进行断言。当假设与程序实际运行结果不符，在使用 `try-except` 语句处理异常时会抛出 `AssertionError`。

```python
def avg(grades, weights):
  # Raise AssertionException when list is empty
  assert not len(grades) == 0, 'No grades data'
  # Python list comprehension
  new_grade = [convertLetterGrade(elt) for elt in grades]
  return dotProduct(new_grade, weights) / len(new_grade)
```

使用断言进行防御性编程 (Defensive programming），

- 断言可以很好的控制在未知条件下程序的响应，当产生不可预期的情况时，断言会阻断程序的运行。
- 通常用于检测程序的输入，同时也可以在任何地方使用。
- 能够更容易的定位出程序出错的地方。

使用断言可以有效的检测输入与输出的前提和后置条件，以避免错误的数值。

使用 `assert`，
- 检测参数的类型/数值
- 检查数据结构中的不变量是否满足
- 检查返回值是否满足约束条件
- 检查程序
