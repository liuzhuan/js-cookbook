# Learning Promise

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise

The **Promise** object is used for asynchronous computations. A Promise represents a value which may be available now, or in the future, or never.

## Syntax

```javascript
new Promise(/* executor */ function(resolve, reject) { ... });
```

### Parameters

**executor**

A function that is passed with the arguments `resolve` and `reject`. The executor function is executed immediately by the Promise implementation, passing resolve and reject functions (the executor is called before the Promise constructor even returns the created object). The resolve and reject functions, when called, resolve or reject the promise, respectively. The executor normally initiates some asynchronous work, and then, once that completes, either calls the resolve function to resolve the promise or else rejects it if an error occurred.
If an error is thrown in the executor function, the promise is rejected. The return value of the executor is ignored.

## Description

A **Promise** is a proxy for a value not necessarily known when the promise is created. It allows you to associate handlers with an asynchronous action's eventual success value or failure reason. This lets asynchronous methods return values like synchronous methods: instead of immediately returning the final value, the asynchronous method returns a promise to supply the value at some point in the future.

A Promise is in one of these states:

* `pending`: initial state, not fulfilled or rejected.
* `fulfilled`: meaning that the operation completed successfully.
* `rejected`: meaning that the operation failed.

A pending promise can either be fulfilled with a value, or rejected with a reason (error). When either of these options happen, the associated handlers queued up by a promise's `then` method are called. (If the promise has already been fulfilled or rejected when a corresponding handler is attached, the handler will be called, so there is no race condition between an asynchronous operation completing and its handlers being attached.)

As the `Promise.prototype.then()` and `Promise.prototype.catch()` methods return promises, they can be chained.

![promise flowchart](https://mdn.mozillademos.org/files/8633/promises.png)

## Methods

`Promise.all(iterable)`

Returns a promise that either fulfills when all of the promises in the iterable argument have fulfilled or rejects as soon as one of the promises in the iterable argument rejects. If the returned promise fulfills, it is fulfilled with an array of the values from the fulfilled promises in same order as defined in the iterable. If the returned promise rejects, it is rejected with the reason from the first promise in the iterable that rejected. This method can be useful for aggregating results of multiple promises.

`Promise.race(iterable)`

Returns a promise that fulfills or rejects as soon as one of the promises in the iterable fulfills or rejects, with the value or reason from that promise.

`Promise.reject(reason)`

Returns a Promise object that is rejected with the given reason.

`Promise.resolve(value)`

Returns a Promise object that is resolved with the given value. If the value is a thenable (i.e. has a then method), the returned promise will "follow" that thenable, adopting its eventual state; otherwise the returned promise will be fulfilled with the value. Generally, if you don't know if a value is a promise or not, `Promise.resolve(value)` it instead and work with the return value as a promise.

## Promise.prototype

### Methods

`Promise.prototype.catch(onRejected)`

Appends a rejection handler callback to the promise, and returns a new promise resolving to the return value of the callback if it is called, or to its original fulfillment value if the promise is instead fulfilled.

`Promise.prototype.then(onFulfilled, onRejected)`

Appends fulfillment and rejection handlers to the promise, and returns a new promise resolving to the return value of the called handler, or to its original settled value if the promise was not handled (i.e. if the relevant handler onFulfilled or onRejected is not a function).

## Example

[super simple promise](./super-simple-promise.js)

[creating a promise](creating-a-promise.html)

## References
1. [JavaScript Promises 规范 - 简化异步工作 - Udacity](https://cn.udacity.com/course/javascript-promises--ud898)
1. [JavaScript Promise 迷你书](./javascript-promises-book.md)