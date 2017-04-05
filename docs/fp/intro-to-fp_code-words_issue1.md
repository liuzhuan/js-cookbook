# 函数式编程介绍

来源：[CODE WORDS - ISSUE ONE](https://codewords.recurse.com/issues/one/an-introduction-to-functional-programming)

作者：Mary Rose Cook

日期：2014年12月

本文先展示常见的命令式、非函数式代码，然后将其转换为函数式风格。

简单起见，样例使用了 Python。

## 导向绳

函数式的特征只有一个：没有副作用。它不依赖当前函数之外的参数，也不改变当前函数之外的数据。从这个特征可以推导出其他函数式特性，这一点可以当作学习时的导向绳（guide rope）。

这是一个非函数式函数：

```python
a = 0
def increment1():
    global a
    a += 1
```

这是一个函数式函数：

```python
def increment2(a):
    return a + 1
```

## 不要循环处理列表。使用 map 和 reduce。

### map

map 输入一个函数和一个元素集合。创建一个新的空集合，在每个原始元素上执行函数，再把返回值插入到新集合中。最终返回一个新集合。

比如，下面的例子，把名称集合转换为长度集合：

```python
name_lengths = map(len, ['Mary', 'Isla', 'Sam'])
print name_lengths
# => [4, 4, 3]
```

下面把每个输入转换为平方数：

```python
squares = map(lambda x: x * x, [0, 1, 2, 3, 4])
print squares
```

下面的非函数式代码输入一个真实姓名列表，返回一个随机生成的代码名称：

```python
import random

names = ['Mary', 'Isla', 'Sam']
code_names = ['Mr. Pink', 'Mr. Orange', 'Mr. Blonde']

for i in range(len(names)):
    names[i] = random.choice(code_names)

print names
```

可以改造成 map 函数风格：

```python
import random

names = ['Mary', 'Isla', 'Sam']

secret_names = map(lambda x: random.choice(['Mr. Pink',
                                            'Mr. Orange',
                                            'Mr. Blonde']), 
                    names)
```

非函数式风格代码：

```python
names = ['Mary', 'Isla', 'Sam']

for i in range(len(names)):
    names[i] = hash(names[i])
```

函数式风格：

```
secret_names = map(hash, names)
```

### Reduce

Reduce 把输入的函数和数据集合处理后，返回合并后的元素。

下面是个简单 reduce，返回所有集合元素的和：

```python
sum = reduce(lambda a, x: a + x, [0, 1, 2, 3, 4])

print sum
# => 10
```

`x` 是正在处理的元素，`a` 是和。

下面的例子返回列表中 `Sam` 出现次数的总和：

```python
sentences = ['Mary read a story to Sam and Isla.',
             'Isla cuddled Sam.',
             'Sam chortled.']
sam_count = 0
for sentence in sentences:
    sam_count += sentence.count('Sam')

print sam_count
# => 3
```

转换成 reduce 样式：

```python
sentences = ['Mary read a story to Sam and Isla.',
             'Isla cuddled Sam.',
             'Sam chortled.']

sam_count = reduce(lambda a, x: a + x.count('Sam'),
                   sentences,
                   0)
```

## 练习2.将下面的代码转换为 map, reduce 和 filter 风格代码。

```python
people = [
    {'name': 'Mary', 'height':160},
    {'name': 'Isla', 'height':80},
    {'name': 'Sam'}
]

height_total = 0
height_count = 0

for person in people:
    if 'height' in person:
        height_total += person['height']
        height_count += 1

if height_count > 0:
    average_height = height_total / height_count
    print average_height
    # => 120
```

转换后的代码：

```python
people = [
    {'name': 'Mary', 'height':160},
    {'name': 'Isla', 'height':80},
    {'name': 'Sam'}
]

heights = map(lambda x: x['height'], 
              filter(lambda x: 'height' in x, people))
if len(heights) > 0:
    from operator import add
    average_height = reduce(add, heights) / len(heights)
```

## Write declaratively, not imperatively

> 未完待续...