# 继承和原型链

来源：[MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)

对于有其他面向对象语言（比如 Java 和 C++）经验的开发者，JavaScript 总是令人迷惑，因为它是动态的，而且本身没有提供 class 机制（ES2015 引入了 `class` 关键字，但它只是语法糖，JavaScript 依然是基于 原型的）。

当涉及到继承时，JavaScript 只有一种结构：object。每个 object 都有一个私有属性（称作 [[Prototype]]），指向另一个对象，即它的 `prototype`。prototype 对象也有自己的 prototype，向上追溯一直到某一个 object 的 prototype 为 null。null 没有 prototype，是 **原型链** 的终结点。

几乎所有的 JavaScript 对象都是 Object 的实例，而 Object 位居原型链顶端。

原型链继承常常被认为是 JavaScript 的一大缺点，实际上它要比经典的继承模型强大。比如，在原型链模型上构建经典模型相当简单。

## 使用原型链的继承

### 继承属性

JavaScript 对象是动态的属性“包裹”（称为自有属性 **own properties**）。JavaScript 对象拥有指向原型对象的链接。当获取对象的属性时，不仅要在对象本身寻找属性，还会在对象的原型，原型的原型...，一直找到想要的属性名，或者到达原型链顶端位置。

> 根据 ECMAScript 标准，`someObject.[[Prototype]]` 表示 someObject 的原型。ECMAScript 2015 之后，`[[Prototype]]` 通过 `Object.getPrototypeOf()` 和 `Object.setPrototypeOf()` 获取和设置。它与 `__proto__` 是等价的，`__proto__` 虽然没在标准中规定，但在实际中被很多浏览器支持。

> 注意不要与 `func.prototype` 混淆。`func.prototype` 会把指定的 [[Prototype]] 赋值给指定函数构造产生的实例。**Object.prototype** 属性代表 Object 原型对象。

[查看代码](./scripts/access_a_property.js)。

设置对象的属性会新增一个自有属性。唯一的特例是[继承的 getter 和 setter 属性](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects#Defining_getters_and_setters)。

### 继承“方法”

JavaScript 没有基于类的语言所谓的“方法”。在 JavaScript 中，任意函数都可以依附到一个对象属性。继承函数同其他属性一样，包括上面描述的属性遮蔽（此时称为方法覆盖 method overriding）。

当一个继承函数执行时，this 指向继承对象，而不是原本的原型对象。

## 创建对象和相应原型链的不同方式

### 通过语法创建的对象

```javascript
var o = {a: 1};
// o ---> Object.prototype ---> null
```

[查看代码](./scripts/inheriting_methods.js)