# Underscore.js

http://underscorejs.org/

Jeremy Ashkenas

> Jeremy Ashkenas is the creator of the CoffeeScript programming language, the Backbone.js JavaScript framework, and the Underscore.

Underscore is a JavaScript library that provides a whole mess of useful functional programming helpers without extending any built-in objects. 

Underscore provides over 100 functions that support both your favorite workaday functional helpers: `map`, `filter`, `invoke` --- as well as more specialized goodies: function binding, javascript templating, creating quick indexes, deep equality testing, and so on.

> **workaday**: workaday means ordinary and not especially interesting or unusual.

A complete Test Suite is included for your perusal.

> **perusal**: perusal of something such as a letter, article, or document is the action of reading it.

You may also read through the [annotated source code](http://underscorejs.org/docs/underscore.html).

Underscore is an open-source component of [DocumentCloud](https://www.documentcloud.org/).

> DocumentCloud: analyze, annotate, publish. Turn documents into data.

## Installation

- **Node.js** `npm install underscore`
- **Require.js** `require(['underscore'], ...)`

## Collection Functions (Arrays or Objects)

**each** `_.each(list, iteratee, [context])`, Alias: **forEach**

> **iteratee**: in functional programming, an iteratee is a composable abstraction for incrementally processing sequentially-presented chunks of input data. On each step, an iteratee is presented with one of three possible types of values: the next chunk of data, a value to indicate no data is available, or a value to indicate the iteration process has finished. 

Iterates over a list of elements, yielding each in turn to an iteratee function. The iteratee is bound to the context object, if one is passed. Each invocation of iteratee is called with three arguments: `(element, index, list)`. If list is a JavaScript object, iteratee's arguments will be `(value, key, list)`. Returns the list for chaining.

```javascript
_.each([1, 2, 3], alert);
_.each({one:1, two:2, three:3}, alert);
```

Note: Collection functions work on arrays, objects, and array-like objects such as `arguments`, `NodeList` and similar. But it works by duck-typing, so avoid passing objects with a numeric `length` property. It's also good to note that an `each` loop cannot be broken out of --- to break, use `_.find` instead.

**map** `_.map(list, iteratee, [context])` Alias: collect

Produces a new array of values by mapping each value in list through a transformation function (iteratee). The `iteratee` is passed three arguments: the `value`, then the `index` (or `key`) of the iteration, and finally a reference to the entire `list`.

```javascript
_.map([1, 2, 3], function(num) { return num * 3; });
_.map({one:1, two:2, three:3}, function(num, key){ return num * 3; });
_.map([[1,2],[3,4]], _.first);
```

**reduce** `_.reduce(list, iteratee, [memo], [context])` Aliases: inject, foldl

Also known as `inject` and `foldl`, reduce boils down a list of values into a single value. Memo is the initial state of the reduction, and each successive step of it should be returned by iteratee. The iteratee is passed four arguments: the memo, then the value and index (or key) of the iteration, and finally a reference to the entire list.

> **boil down**: to reduce or be reduced in quantity and usually altered in consistency by boiling

> **consistency**: the consistency of a substance is how thick or smooth it is.

> **memo**: a memo is a short official note that is sent by one person to another within the same company or organization.

If no memo is passed to the initial invocation of reduce, the iteratee is not invoked on the first element of the list. The first element is instead passed as the memo in the invocation of the iteratee on the next element in the list.

```javascript
var sum = _.reduce([1, 2, 3], function(memo, num){ return memo + num; }, 0);
```

**reduceRight** `_.reduceRight(list, iteratee, [memo], [context])` Alias: foldr

The right-associative version of reduce. Foldr is not as useful in JavaScript as it would be in a language with lazy evaluation.

```javascript
var list = [[0, 1], [2, 3], [4, 5]];
var flat = _.reduceRight(list, function(a, b) {
    return a.concat(b);
}, []);
// => [4, 5, 2, 3, 0, 1]
```