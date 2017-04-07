# Sourcemaps

来源：[rollup.js 官网](https://rollupjs.org/#sourcemaps)

开启 sourcemaps 有两种方式：

1. 使用命令行参数 `--sourcemap`
2. 在配置文件中增加 `sourceMap: true`

```javascript
export default {
    entry: 'src/main.js',
    format: 'umd',
    dest: 'bundle.js',
    sourceMap: true
}
```