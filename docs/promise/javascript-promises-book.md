# JavaScript Promise 迷你书（中文版）

http://liubin.org/promises-book/

原著：azu/翻译：liubin, kaku, honnkyou - Version 1.4.1

通过阅读本书，我们希望各位读者能在下面三个目标上有所收获。

* 学习Promise相关内容，能熟练使用Promise模式并进行测试
* 学习Promise适合什么、不适合什么，知道Promise不是万能的，不能什么都想用Promise来解决
* 以ES6 Promises为基础进行学习，逐渐发展形成自己的风格

## 编写 Promise 代码

[xhr-promise](./xhr-promise.html)

## 实战 Promise

静态方法 `Promise.resolve(value)` 可以认为是 `new Promise()` 方法的快捷方式。

比如 `Promise.resolve(42);` 可以认为是以下代码的语法糖。

```javascript
new Promise(function(resolve){
    resolve(42);
});
```

### Thenable

`Promise.resolve` 方法另一个作用就是将 thenable 对象转换为 promise 对象。

ES6 Promises 里提到了 `Thenable` 这个概念，简单来说它就是一个非常类似promise的东西。

就像我们有时称具有 .length 方法的非数组对象为Array like一样，thenable指的是一个具有 .then 方法的对象。

### Promise chain

[promise then catch flow](./promise-then-catch-flow.js)

[promise then passing value](./promise-then-passing-value.js)

`Promise#then` 不仅仅是注册一个回调函数那么简单，它还会将回调函数的返回值进行变换，创建并返回一个promise对象。