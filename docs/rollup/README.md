# rollup.js 简介

来源：[rollup.js 官网](https://rollupjs.org/)

Rollup 是一个 JavaScript 模块打包器。它使用 ES6 模块语法。

## 快速入门

使用 `npm install --global rollup` 安装。执行 `rollup --help` 可以查看可用的选项和参数。

### 命令

以下命令假定程序入口是 `main.js`，所有的输入文件将会编译为 `bundle.js`。

对于浏览器端：

```
rollup main.js --format iife --output bundle.js
```

对于 Node.js ：

```
rollup main.js --format cjs --output bundle.js
```

对于以上两者：

```
rollup main.js --format umd --name "myBundle" --output bundle.js
```

## Tree Shaking

除了使用 ES6 模块，Rollup 还可以静态分析导入的代码，移除无用代码。这允许我们尽可能精简代码体积。

比如，对于 CommonJS，必须引入整体的工具或库文件：

```javascript
var utils = require('utils');
var query = 'Rollup';

utils.ajax('https://api.example.com/?search=' + query).then(handleResponse);
```

如果使用了 ES6 模块，我们可以只导入需要的 ajax 函数：

```javascript
import {ajax} from 'utils';
var query = 'Rollup';

ajax('https://api.example.com/?search=' + query).then(handleResponse);
```

## 兼容性

### 引入 CommonJS 模块

Rollup 通过[插件](https://github.com/rollup/rollup-plugin-commonjs)可以引入现存的 CommonJS 模块。

### 发布 ES6 模块

为了让你的 ES6 模块在 Node.js, Webpack 等 CommonJS 工具中立即可用，你可以用 Rollup 转译成 UMD 或者 CommonJS 格式，然后在 `package.json` 文件的 `main` 属性中指向该编译文件。如果 `package.json` 文件还包含 `module` 字段，支持 ES6 的工具，比如Rollup 和 [webpack 2](https://webpack.js.org/)，就会直接[导入 ES6 版本的模块](https://github.com/rollup/rollup/wiki/pkg.module)。

## 链接

* 手把手的[视频教程系列](https://code.lengstorf.com/learn-rollup-js/)，配有文字步骤注解
* [wiki](https://github.com/rollup/rollup/wiki) 上有五花八门的问题