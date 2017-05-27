# Class in es6

http://es6.ruanyifeng.com/#docs/class

作者：阮一峰

## Class 基本语法

```javascript
class Point {
    constructor(x, y) {
        this.x = x;
        this.y = y;
    }

    toString() {
        return '(' + this.x + ', ' + this.y + ')';
    }
}

var p = new Point();
p.toString();
```

注意，函数间没有逗号。另外，类内部定义的方法，都是不可枚举的（non-enumerable）。

## Class 的继承

```javascript
class ColorPoint extends Point {
    constructor(x, y, color) {
        super(x, y);
        this.color = color;
    }

    toString() {
        return this.color + ' ' + super.toString();
    }
}
```

子类必须在 `constructor` 方法中调用 `super` 方法，否则新建实例时会报错。这是因为子类没有自己的this对象，而是继承父类的this对象，然后对其进行加工。如果不调用super方法，子类就得不到this对象。