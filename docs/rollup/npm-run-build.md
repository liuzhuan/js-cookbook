# npm run build

来源：[rollup.js 官网](https://rollupjs.org/#npm-run-build)

很多 JavaScript 项目都遵循一个简单惯例：敲入 `npm run build` 后，就能构建项目。当多人合作时十分有用，因为人们不需要了解构建细节（不管是 Rollup，Webpack，Gulp 还是别的什么工具），就可以直接查看源代码。他们甚至不需要全局安装 Rollup。

设置自己的 `npm run build` 脚本，非常简单。

## 创建 `package.json` 文件

`package.json` 包含重要的项目信息，包括名称、版本、许可证和依赖项等。

执行 `npm init` 就可以创建一个 package.json 。

打开 package.json，找到 `scripts` 字段，增加 `build` 属性：

```json
{
    // ...,
    "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1",
        "build": "rollup -c"
    }
    // ...
}
```

> 假设在项目文件夹中已经存在 `rollup.config.js` 文件。

## 本地安装 Rollup

最好使用本地安装的 Rollup ，因为别人克隆完你的项目后，可以通过 `npm install` 就能得到一个兼容版本。

执行如下命令安装本地版 Rollup:

```
npm install --save-dev rollup
# 简写形式如下：
npm i -D rollup
```

注意到，`devDependencies` 字段已经增加到你的 `package.json` 文件：

```json
{
    // ...,
    "devDependencies": {
        "rollup": "^0.41.4"
    }
    // ...,
}
```

所有的 `npm run` 脚本都会查找本地安装的命令版本。

尝试运行命令：

```
npm run build
```

## 使用 `npm run dev` 命令实现自动刷新

安装 `rollup-watch` 后，可以创建一个脚本，当源文件变化后，自动编译项目。安装命令如下：

```
npm install --save-dev rollup-watch
```

在 `package.json` 中增加 `dev` 字段：

```json
{
    // ...,
    "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1",
        "build": "rollup -c",
        "dev": "rollup -c -w"
    }
    // ...
}
```

命令 `rollup -c -w` （`rollup --config --watch` 的缩写）让 Rollup 运行在监控模式。