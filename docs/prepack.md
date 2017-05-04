# Prepack

https://prepack.io/

A tool for making JavaScript code run faster.

## What does it do?

Prepack is a tool that optimizes JavaScript source code: Computations that can be done at compile-time instead of run-time get eliminated. Prepack replaces the global code of a JavaScript bundle with equivalent code that is a simple sequence of assignments. This gets rid of most intermediate computations and object allocations.

## Examples

### Hello World

```javascript
// input
(function () {
  function hello() { return 'hello'; }
  function world() { return 'world'; }
  global.s = hello() + ' ' + world();
})();

// output
(function () {
  s = "hello world";
})();
```

### Elimination of abstraction tax

```javascript
// input
(function () {
  var self = this;
  ['A', 'B', 42].forEach(function(x) {
    var name = '_' + x.toString()[0].toLowerCase();
    var y = parseInt(x);
    self[name] = y ? y : x;
  });
})();

// output
(function () {
  _a = "A";
  _b = "B";
  _4 = 42;
})();
```

### Fibonacci

```javascript
// input
(function () {
  function fibonacci(x) {
    return x <= 1 ? x : fibonacci(x - 1) + fibonacci(x - 2);
  }
  global.x = fibonacci(23);
})();

// output
(function () {
  x = 28657;
})();
```

### Module Initialization

```javascript
// input
(function () {
  let moduleTable = {};
  function define(id, f) { moduleTable[id] = f; }
  function require(id) {
    let x = moduleTable[id];
    return x instanceof Function ? (moduleTable[id] = x()) : x;
  }
  global.require = require;
  define("one", function() { return 1; });
  define("two", function() { return require("one") + require("one"); });
  define("three", function() { return require("two") + require("one"); });
  define("four", function() { return require("three") + require("one"); });
})();
three = require("three");

// output
(function () {
  function _2() {
    return 3 + 1;
  }

  var _1 = {
    one: 1,
    two: 2,
    three: 3,
    four: _2
  };

  function _0(id) {
    let x = _1[id];
    return x instanceof Function ? _1[id] = x() : x;
  }

  require = _0;
  three = 3;
})();
```

### Environment Interactions and Branching

```javascript
// input
(function(){
  function fib(x) { return x <= 1 ? x : fib(x - 1) + fib(x - 2); }
  let x = Date.now();
  if (x === 0) x = fib(10);
  global.result = x;
})();

// output
(function () {
  var _0 = Date.now();
  if (typeof _0 !== "number") {
    throw new Error("Prepack model invariant violation");
  }
  result = _0 === 0 ? 55 : _0;
})();
```

## How does it work?

A few things have to come together to realize Prepack:

### Abstract Syntax Tree (AST)

Prepack operates at the AST level, using Babel to parse and generate JavaScript source code.

### Concrete Execution

At the core of Prepack is an almost ECMAScript 5 compatible interpreter — implemented in JavaScript! The interpreter closely follows the ECMAScript 2016 Language Specification, with a focus on correctness and spec conformance. You can think of the interpreter in Prepack as a clean reference implementation of JavaScript.

The interpreter has the ability to track and undo all effects, including all object mutations. This enables speculative optimizations.

> **speculative**: a piece of information that is speculative is based on guesses rather than knowledge.

### Symbolic Execution

In addition to computing over concrete values, Prepack's interpreter has the ability to operate on abstract values which typically arise from environment interactions. For example, Date.now can return an abstract value. You can also manually inject abstract values via auxiliary helper functions such as `__abstract()`. Prepack tracks all operations that are performed over abstract values. When branching over abstract values, Prepack execution and explore all possibilities. Thus, Prepack implements a Symbolic Execution engine for JavaScript.

### Abstract Interpretation

Symbolic execution will fork when it encounters branches over abstract values. At control-flow merge-points, Prepack will join the diverged executions, implementing a form of Abstract Interpretation. Joining variables and heap properties may result in conditional abstract values. Prepack tracks information about value and type domains of abstract values.

### Heap Serialization

At the end of the initialization phase when the global code returns, Prepack captures the final heap. Prepack walks the heap in order, generating fresh straightforward JavaScript code that creates and links all objects reachable in the initialized heap. Some of the values in the heap might be result of computations over abstract values. For those values, Prepack generates code that performs those computations as the original program would have done.

## The Environment matters!

Out of the box, Prepack does not fully model a browser or node.js environment: Prepack has no built-in knowledge of document or window. In fact, when prepacking code which references such properties, they will evaluate to undefined. You would have to insert a model of the relevant functionality at the beginning of the code you want to prepack.

The following helper functions aid in writing models.

```javascript
// Assume that a certain property has a simple known value.
__assumeDataProperty(global, "obscure", undefined);
// Assume that a certain property has a simple unknown value.
__assumeDataProperty(global, "notSoObscure", __abstract());
// Assume that a richly structured value exists
__assumeDataProperty(global, "rich", __abstract({
  x: __abstract("number"),
  y: __abstract("boolean"),
  z: __abstract("string"),
  nested: __abstract({
    x: __abstract()
  })
}));
// Forbid any accesses to an object except at known positions
__makePartial(global);
// At this point, accessing global.obscure, global.notSoObscure, global.rich.nested.x is okay,
// but accessing global.unknown or global.rich.unknown would cause an introspection error.

// The following tells Prepack to embed and call some code in the residual program.
// The code must not have any side effects on the reachable JavaScript heap.
__residual("object", function(delay) {
  return global.pushSelfDestructButton(delay);
}, "5 minutes");
```

