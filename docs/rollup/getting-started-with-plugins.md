# 插件起步

来源：[rollup.js 官网](https://rollupjs.org/#getting-started-with-plugins)

当应用越来越复杂，我们需要更多的灵活性 - 通过 npm 模块，Babel 转译代码，读写 JSON 文件等等。

这时我们可以使用插件，它会在打包流程的关键节点改变 Rollup 的行为。现存的插件列表可以在 [Rollup 维基](https://github.com/rollup/rollup/wiki/Plugins)中看到。

## 使用插件

在本教程中，使用了 [rollup-plugin-json](https://github.com/rollup/rollup-plugin-json) 插件，它允许 Rollup 从 JSON 文件中导入数据。

安装 `rollup-plugin-json`：

```
npm install --save-dev rollup-plugin-json
```

> 此处使用 `--save-dev` 而不是 `--save` ，因为我们的代码运行时不依赖插件，只是在构建时才需要插件。

更新 `src/main.js` 文件，所以可以从 `package.json` 中读取数据：

```javascript
import {version} from '../package.json';

export default function() {
    console.log('version: ' + version);
}
```

编辑 `rollup.config.js`，使其包含 JSON 插件：

```javascript
import json from 'rollup-plugin-json';

export default {
    entry: 'src/main.js',
    format: 'cjs',
    plugins: [json()],
    dest: 'bundle.js'
};
```

使用 `npm run build` 运行 Rollup 。结果如下所示：

```javascript
'use strict';

var version = '1.0.0';

var main = function() {
    console.log('version ' + version);
};

module.exports = main;
```

> 注意到代码中只引入了我们需要的数据 --- `name` 和 `devDependencies` 等其他 `package.json` 字段被忽略了。这就是 tree-shaking ！