title: 《lua程序设计（第二版）》读书笔记
date: 2016-03-29 20:56:50
modified: 2016-03-29 20:56:50
author: jxyi
postid: $POSTID
slug: $SLUG
nicename: lua_primer
attachments: $ATTACHMENTS
posttype: post
poststatus: draft
tags: lua book
category: book

## 简介

本文主要记录自己在学习《lua程序设计（第二版）》时的心得和笔记，作为把书读薄的第一步。本文只会记录需要复习的知识，一些常识将不会在这里记录。

## 基本知识

type 函数会返回传入参数的类型，返回值有：string、number、function、boolean、nil、table、userdata、thread。返回值是 string 类型。

lua 的条件判断语句，将 false 和 nil 视为假，其他一律视为真，包括 0 和空字符串。

.. 是 lua 中的字符串连接符。当使用在数字的后面时，需要数字后面加一个空格，否则第一个点将被识别为小数点。

## table

table 是一个“对象”，而且是匿名的。所以 x = {} 这种写法，x 只是引用了一个 table，这一点与 java 是类似的。

当 table 中的 key 是字符串时，可以使用点号来访问。例如：

```
a = {}
a['x'] = 10
print(a['x'])
print(a.x)
```

长度操作符 “#” 对于有“间隙”的 table 会返回非期望的值，例如：

```
a = {}
a[1] = 1
a[2] = 2
a[4] = 4
print(#a)    ----> 2
```

## 关系操作符

如果两个值具有不同的类型，那么它们不相等。

注意在比较大小时，‘0’ 和 0 是不同的，一个是字符串，一个是数字。 2 < 15 为 true，'2' < '15' 为 false。

and 和 or 操作符采用“短路求值”，同 c++ 的 && 和 ||。不同的是，如果第一个值为 true ，and 会返回第一个值，否则返回第二个值，这和 c++ 返回 true 和 false 是不同的。or 类似。

not 操作符只会返回 true 或者 false。

## 多重赋值

多重赋值的形式为：

```
a, b, c = 0, 0, 0
```

多重赋值时，lua 会先对等号右边的所有表达式求值，然后再执行赋值操作。所以可以这样写交换两个变量的值：

```
a, b = b, a
```

## 控制语句

### if (...) then ... elseif (...) then ... end

和其他语言差不多，没有什么特别的。需要了解的是，lua 没有 switch，所以连续的 if elseif 是很常见的。

### while (...) do ... end

和其他语言一样，注意这里是 do，而不是 then 。

### repeat ... until (...)

和 c++ 中的 do while 一样，不过需要注意的是。repeat until 中声明在循环体中的局部变量的声明周期包括条件测试语句，即 until 中仍然可以使用在 repeat 中声明的局部变量。

### for (...) do ... end

for 循环有两种形式：数字型和泛型。

数字型 for 循环的格式为：

```
for var=exp1, exp2, exp3 do
    <循环体>
end
```

var 从 exp1 变化到 exp2，步长为 exp3，每变化一次执行一次循环体。流程与其他语言类似。

需要注意以下几点：

- 控制变量将被自动声明为局部变量，并且会屏蔽外部的同名变量。所以避免控制变量的名字与外部变量相同，减少被误解的可能；
- 控制语句中的表达式是一次求值的，所以控制语句中的函数只会执行一次，这一点与 c++ 不同。

## 函数

函数的值和 table 类似，也是引用，而不是存值。

调用函数时，用冒号调用，会将被调用的 table 隐式地作为第一个参数 self 传入。例如 `o:foo()` 等价于 `o.foo(o)`。 

函数调用在用来初始化 table 时，函数的多重返回值都将用来初始化 table，不过这种情况只发生在该函数调用是 table 的最后一个元素时。

特殊函数 unpack，接收一个数组作为参数，返回从下标 1 开始的数组内容，例：`print(unpack({1, 2, 3}))  ==>  1 2 3`


