# 如何理解原型链？

JavaScript 本身并没有提供 `class` 的实现。虽然 ES2015 提供了 `class` 关键词，但它只是语法糖，JS 依然是基于原型的。

每个 object 都有私有属性（即 `[[Prototype]]`）指向另一个对象，后者是前者的**原型(prototype)**。原型对象也有自己的原型，向上层层追溯，直到最终的原型指向 `null`。`null` 没有自己的原型对象，是**原型链**的终点。

原型链经常被认为是 JS 的一个弱点，其实它比经典模型要强大许多。

## 继承属性

每个对象都有指向原型的链接，当想获取对象属性时，不仅要在对象本身查找，而且要在对象原型、原型的原型、...，直到找到匹配的属性，或者抵达原型链的末端。

> 依照 ECMAScript 标准，`someObject.[[Prototype]]` 用来表示 `someObject` 的原型对象。自从 ECMAScript 2015 之后，可以使用 `Object.getPrototypeOf()` 和 `Object.setPrototypeOf()` 来处理 `[[Prototype]]`。`__proto__` 是非标准属性，但已成为很多浏览器的事实上的标准，和 `[[Prototype]]` 含义相同。

> 需要注意与 `func.prototype` 的区别：当 `func` 用作构造函数时，`func.prototype` 可以为生成实例设定 `[[Prototype]]` 。

## 继承的 `methods`

当继承的方法执行时，`this` 指向继承的对象。

```javascript
var o = {
  a: 2,
  m: function() {
    return this.a + 1;
  }
};

console.log(o.m()); // 3
// When calling o.m in this case, 'this' refers to o

var p = Object.create(o);
// p is an object that inherits from o

p.a = 4; // creates an own property 'a' on p
console.log(p.m()); // 5
// when p.m is called, 'this' refers to p.
// So when p inherits the function m of o, 
// 'this.a' means p.a, the own property 'a' of p
```

## 创建对象和原型链的不同方法

使用语法构造函数的对象

```javascript
var o = {a: 1};
// o ---> Object.prototype ---> null

var b = ['yo', 'whadup', '?'];
// b ---> Array.prototype ---> Object.prototype ---> null

function f() {
  return 2;
}
// f ---> Function.prototype ---> Object.prototype ---> null
```

使用构造函数

```javascript
function Graph() {
  this.vertices = [];
  this.edges = [];
}

Graph.prototype = {
  addVertex: function(v) {
    this.vertices.push(v);
  }
};

var g = new Graph();
// g is an object with own properties 'vertices' and 'edges'.
// g.[[Prototype]] is the value of Graph.prototype when new Graph() is executed.
```

使用 `Object.create`

```javascript
var a = {a: 1}; 
// a ---> Object.prototype ---> null

var b = Object.create(a);
// b ---> a ---> Object.prototype ---> null
console.log(b.a); // 1 (inherited)

var c = Object.create(b);
// c ---> b ---> a ---> Object.prototype ---> null

var d = Object.create(null);
// d ---> null
console.log(d.hasOwnProperty); 
// undefined, because d doesn't inherit from Object.prototype
```

使用 `class` 关键词

```javascript
'use strict';

class Polygon {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
}

class Square extends Polygon {
  constructor(sideLength) {
    super(sideLength, sideLength);
  }

  get area() {
    return this.height * this.width;
  }
  
  set sideLength(newLength) {
    this.height = newLength;
    this.width = newLength;
  }
}

var square = new Square(2);
```

## `new` 到底做了什么？

## `in` 运算符的含义？

判断是否某个属性属于某个对象，包括自有属性和继承的属性。

`for...in...` 可遍历所有的属性。

## 如何查看所有的自有属性？

`Object.getOwnPropertyNames(obj)`

## 如何查看所有的可枚举属性？

## Reference
- [Inheritance and the prototype chain](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain) - mozilla.org
- [new operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new) - mozilla.org
- [Object.create()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create) - mozilla.org