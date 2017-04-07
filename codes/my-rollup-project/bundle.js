'use strict';

// src/foo.js
var foo = 'hello world!';

// src/main.js

var main = function() {
    console.log(foo);
};

module.exports = main;
