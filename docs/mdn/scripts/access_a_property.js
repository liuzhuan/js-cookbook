// access_a_property.js

var o = {a: 1, b: 2};
o.__proto__ = {b: 3, c: 4};

// the full prototype chain looks like:
// {a: 1, b: 2} ---> {b: 3, c: 4} ---> null

console.log(o.a); // => 1
console.log(o.b); // => 2
console.log(o.c); // => 4
console.log(o.d); // => undefined