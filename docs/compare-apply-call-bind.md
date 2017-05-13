# 深入浅出妙用 JavaScript 中 apply、call、bind

http://web.jobbole.com/83642/

作者：[chokcoco](http://www.jobbole.com/members/chokcoco/)

日期：2017/02/14

在 javascript 中，call 和 apply 都是为了改变某个函数运行时的上下文（context）而存在的，换句话说，就是为了改变函数体内部 this 的指向。

JavaScript 的一大特点是，函数存在「定义时上下文」和「运行时上下文」以及「上下文是可以改变的」这样的概念。

## apply 和 call 的区别

作用完全一样，调用参数不同。

```javascript
func.call(this, arg1, arg2);
func.apply(this, [arg1, arg2]);
```

## 常见用法

```javascript
/** 数组之间追加 */
Array.prototype.push.apply(arr1, arr2);

/** 获取数组最大值 */
Math.max.apply(null, arr);

/** 验证是否是数组 */
Object.prototype.toString.call(obj) === '[object Array]';

/** 类（伪）数组使用数组方法 */
Array.prototype.slice.call(arguments);
```

## 实际案例

定义一个 log 方法，代理 console.log 方法，要求每个 log 消息添加“(app)” 前缀。

```javascript
function log() {
    var args = Array.prototype.slice.call(arguments);
    args.unshift('(app)');

    console.log.apply(null, args);
}
```

## bind

MDN的解释是：bind()方法会创建一个新函数，称为绑定函数，当调用这个绑定函数时，绑定函数会以创建它时传入 bind()方法的第一个参数作为 this，传入 bind() 方法的第二个以及以后的参数加上绑定函数运行时本身的参数按照顺序作为原函数的参数来调用原函数。

```javascript
var foo = {
    bar: 1,
    eventBind: function() {
        $('.someClass').on('click', function(event) {
            console.log(this.bar);
        }.bind(this));
    }
}
```