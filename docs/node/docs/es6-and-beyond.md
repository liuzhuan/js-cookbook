# ECMAScript 2015 (ES6) 和其他

来源：[Node.js 官网](https://nodejs.org/en/docs/es6/)

Node.js 建立在 V8 基础上。通过与最新引擎同步更新，我们可以及时把 [JavaScript ECMA-262 规范](http://www.ecma-international.org/publications/standards/Ecma-262.htm)的新特性展现在 Node.js 开发者面前，以及持续提升的性能和稳定性。

所有的 ECMAScript 2015(ES6) 特性可以分为三个部分：**shipping**, **staged** 和 **in progress**：

* 所有的 **shipping** 特性，V8 认为是稳定的，在 Node.js 中**默认开启**，不需要任何参数设定。
* **Staged** 特性，是即将完成的特性，V8 开发组认为这些并不稳定，需要使用 `--harmony` 参数才能开启。
* **In progress** 特性可以通过各自的 `harmony` 参数单独开启，除了测试目的，一般不建议开启。注意：这些V8 开发组暴露的标志位，可能在没有任何警告的情况下发生变化。

## 各版本 Node.js 默认开启哪些特性？

[node.green](http://node.green/) 基于 kangax 的兼容表格，提供了不同版本 Node.js 支持的 ECMAScript 特性。

## 哪些特性在开发中（in progress）？

V8 引擎的新特性在持续增加中。

你可以通过 grep 过滤所有的 *in progress* 特性。注意这些特性并不稳定，使用时要当心。

```
node --v8-options | grep "in progress"
```

## 某一特性的性能如何？

V8 团队致力于提升新语言特性的性能，最终达到 ES5 原生效率。[six-speed](https://fhinkel.github.io/six-speed/) 记录了当前的进度。

## 我如何查看某一版本的 Node.js 装载了哪个版本的 V8 ？

Node.js 通过 `process` 全局变量，列举了所有的依赖和各自版本号。对于 V8 引擎，执行如下命令：

```
node -p process.versions.v8
```