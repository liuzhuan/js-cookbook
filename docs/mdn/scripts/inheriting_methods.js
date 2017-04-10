// inheriting_methods.js

var o = {
    a: 2,
    m: function() {
        return this.a + 1;
    }
};

console.log(o.m()); // => 3

var p = Object.create(o);
// p 是一个继承自 o 的对象

p.a = 4;
console.log(p.m()); // => 5