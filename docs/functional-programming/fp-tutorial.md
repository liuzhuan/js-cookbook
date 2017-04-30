# fp tutorial 

http://www.ruanyifeng.com/blog/2017/02/fp-tutorial.html

Author: Ruan Yifeng

Date: 2017/02/22

## 1. Category Theory

In mathematics, a category is an algebraic sturcture that comprises "object" that are linked by "arrows".

> **algebra**: a type of mathematics in which letters are used to represent possible quantities.

Objects, Arrows or morphisms

> **morphism**: in many fields of mathematics, morphism refers to a structure-preserving mapping from one mathematical structure to another. The notion of morphism recurs in much of contemporary mathematics.

> **recur**: if something recurs, it happens more than once.

### 1.2 Mathematical Model

In theory, all other items can be derived from one item of the category.

### 1.3 Category and Container

We can think category as container, which includes two things:

* value
* relation between values, aka function

Let's define a simple category by code:

```javascript
class Category {
    constructor(val) {
        this.val = val;
    }

    addOne(x) {
        return x + 1;
    }
}
```

### 1.4 Relation of category and functional programming

In essential, fp is just calculate method of Category. 

In short, function in fp is just a pipe. One value in, one value out, no other side effect.

## 2. Compose and Currying

There are two basic operation in fp: compose and currying.

### 2.1 Composition of functions

if `f(X) -> Y` and `g(Y) -> Z`, then `g.f(X) -> Z`.

In code:

```javascript
const compose = function(f, g) {
    return function(x) {
        return f(g(x));
    }
}
```

### 2.2 Currying

Currying is transform multiple params function into a single parameter function.

```javascript
// Before currying
function add(x, y) {
    return x + y;
}

add(1, 2);

// After currying
function addX(y) {
    return function(x) {
        return x + y;
    }
}

addX(2)(1);
```

## 3. Functor

Functor is used when morphism between different categories.

### 3.1 Concept of functor

Functor is a kind of category, is a container, contains value and their relations. 