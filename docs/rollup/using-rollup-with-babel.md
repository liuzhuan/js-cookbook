# 使用 Babel

来源：[rollup.js 官网](https://rollupjs.org/#using-rollup-with-babel)

很多开发人员在项目中使用 [Babel](https://babeljs.io/)，这样我们就可以在浏览器和 Node.js 中使用尚未被支持的未来特性。

使用 Babel 最简单的方法就是安装 `rollup-plugin-babel` 插件：

```
npm i -D rollup-plugin-babel
```

添加至 `rollup.config.js`：

```javascript
// rollup.config.js
import resolve from 'rollup-plugin-node-resolve';
import babel from 'rollup-plugin-babel';

export default {
    entry: 'src/main.js',
    format: 'cjs',
    plugins: [
        resolve(),
        babel({
            exclude: 'node_modules/**' // 只转译我们的源代码
        })
    ],
    dest: bundle.js
};
```

在 Babel 转译你的代码之前，它也需要配置文件。创建新文件 `src/.babelrc`:

```json
{
    "presets": [
        [
            "latest",
            {
                "es2015": {
                    "modules": false
                }
            }
        ]
    ],
    "plugins": ["external-helpers"]
}
```

这个配置有些不寻常的地方。首先，我们设置 `"modules": false` ，否则 Babel 会在 Rollup 处理前，把我们的模块转译为 CommonJS 风格，导致 Rollup 执行失败。

第二，我们使用了 `external-helpers` 插件，这允许 Rollup 在 bundle 头部仅包含一次 'helpers' ,而不是在用到的每个模块都包含（这是个默认的行为）。

第三，我们把 `.babelrc` 放置在 `src` 文件夹，而不是工程根目录。这允许我们为不同任务使用不同的配置。一般推荐为不同任务使用独立配置。

现在，在运行 rollup 之前，我们需要安装 `latest` 预设和 `external-helpers` 插件：

```
npm i -D babel-preset-latest babel-plugin-external-helpers
```

运行 Rollup 会产生一个新的 bundle。修改 `src/main.js` 如下：

```javascript
import answer from 'the-answer';

export default () => {
    console.log(`the answer is ${answer}`);
}
```

执行 `npm run build` ，检查 bundle:

```javascript
'use strict';

var index = 42;

var main = (function(){
    console.log('the answer is ' + index);
});

module.exports = main;
```