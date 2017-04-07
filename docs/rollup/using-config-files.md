# 使用配置文件

来源：[rollup.js 官网](https://rollupjs.org/#using-config-files)

当参数越来越多，使用命令行就会越来越麻烦。

为了避免反复输入命令行参数，我们可以创建一个配置文件，把参数放进去。配置文件用 JavaScript 编写，比命令行参数更灵活。

在项目根目录创建 `rollup.config.js` 文件，增加如下代码：

```javascript
export default {
    entry: 'src/main.js',
    format: 'cjs',
    dest: 'bundle.js'
};
```

为了使用这个配置文件，我们需要使用 `--config` 或者 `-c` 选项：

```bash
rm bundle.js
rollup -c 
```

可以使用命令行参数覆盖配置文件的对应选项：

```
rollup -c -o bundle-2.js
```

你还可以指定不同的配置文件：

```
rollup --config rollup.config.dev.js
rollup --config rollup.config.prod.js
```