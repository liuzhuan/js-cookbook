# 使用 Rollup 和 npm 包

来源：[rollup.js 官网](https://rollupjs.org/#using-rollup-with-npm)

有时候，项目会依赖 npm 包。Rollup 和 Webpack、Browserify 不同，默认不知道如何处理包之间的关系 --- 我们需要做一些配置。

让我们增加一个简单的依赖：`the-answer`，它会输出有关人生、宇宙之类的答案：

```
npm install --save the-answer
# 简写形式：
npm i -S the-answer
```

注意到我们这次使用了 `--save` 选项，所以它会存储到 `package.json` 文件的 `dependencies` 字段。

如果我们更新了 `src/main.js` 文件...

```javascript
import answer from 'the-answer';

export default function() {
    console.log('the answer is ' + answer);
}
```

然后运行 Rollup ...

```
npm run build
```

我们会看到一条警告：

```
 'the-answer' is imported by src/main.js, but could not be resolved – treating it as an external dependency
```

输出的结果 `bundle.js` 依然可以在 Node.js 中使用，因为 `import` 指令变成了 CommonJS 的 `require` 指令，但是 `the-answer` 没有打包到结果中。为此，我们需要一个插件。

## rollup-plugin-node-resolve

`rollup-plugin-node-resolve` 插件告诉 Rollup 如何搜寻外部依赖。安装命令如下...

```
npm install --save-dev rollup-plugin-node-resolve
```

然后添加到你的配置文件：

```javascript
// rollup.config.js
import resolve from 'rollup-plugin-node-resolve';

export default {
    entry: 'src/main.js',
    format: 'cjs',
    plugins: [resolve()],
    dest: 'bundle.js'
};
```

这次，当你再次运行 `npm run build`，就没有警告了 --- 输出文件包含引入的模块了。

## rollup-plugin-commonjs

有些库象 `the-answer` 一样，暴露了 ES6 风格的模块，可以如上所示引用。但是，目前 npm 上大多数模块使用了 CommonJS 风格。再次之前，我们需要将 CommonJS 转换为 ES2015，然后才能供 Rollup 享用。

`rollup-plugin-commonjs` 就是这样的一枚插件。

注意，`rollup-plugin-commonjs` 需要在其他插件转换代码之前引入，这样可以避免 CommonJS 语法规范被其他插件破坏。