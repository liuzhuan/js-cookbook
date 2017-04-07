# 创建第一个包（bundle）

来源：[rollup.js 官网](https://rollupjs.org/#creating-your-first-bundle)

使用 Rollup 最简单的方式就是通过命令行。

我们创建一个简单项目：

```bash
mkdir -p my-rollup-project/src
cd my-rollup-project
```

首先，我们需要一个入口（entry point）。创建 `src/main.js` ，写入如下代码：

```javascript
// src/main.js
import foo from './foo.js';
export default function() {
    console.log(foo);
}
```

然后，创建 `src/foo.js` 模块：

```javascript
// src/foo.js
export default 'hello world!';
```

我们开始创建一个包（bundle）：

```
rollup src/main.js --format cjs
```

`--format` 选项制定了我们创建包的类型 --- 本例中，是 CommonJS (适合 Node.js 运行环境)。因为我们没有指定输出文件，输出内容回直接打印到标准输出 `stdout`：

```javascript
'use strict'

var foo = 'hello world!';

var main = function() {
    console.log(foo);
}

module.exports = main;
```

也可以通过如下命令将包保存为一个文件：

```
rollup src/main.js --format cjs --output bundle.js
# 或者简写为以下命令
rollup src/main.js -f cjs -o bundle.js
```

> 当然也可以使用 `rollup src/main.js > bundle.js` ，但是这种方式不够灵活，尤其是输出 `sourcemaps` 时。

尝试运行代码：

```
node
> var myBundle = require('./bundle.js');
> myBundle();
'hello world!'
```

祝贺你！你用 Rollup 成功创建了第一个包！