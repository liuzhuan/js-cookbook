# 如何使用 Web Workers?

## 什么是 Web Worker?

> Web Workers makes it possible to run a script operation in background thread separate from the main execution thread of a web application

Web Workers 可以在主线程之外的背景线程中执行脚本。这样就能在不堵塞主线程（主要用于渲染 UI 界面）时，运行复杂度很高的运算。

## URL

`URL` 用来提供了一些静态方法，用以操纵 URL 对象。

构造函数包括 `url` 和一个可选的 `base` 属性（当 `url` 是相对地址时使用）：

```javascript
const url = new URL('../cats', 'http://www.example.com/dogs')
console.log(url.hostname) // "http://www.example.com"
console.log(url.pathname) // "/cats"
console.log(url.href)     // "http://www.example.com/cats"
```

可以通过设定 `URL` 的属性来创建 url 地址：

```javascript
url.hash = 'tabby'
console.log(url.href) // "http://www.example.com/cats#tabby"
```

URL 会按照 RFC 3986 规范编码：

```javascript
url.pathname = 'démonstration.html';
console.log(url.href); // "http://www.example.com/d%C3%A9monstration.html"
```

`URLSearchParams` 可以用来创建和操纵 URL 搜寻字符串。比如，获取当前地址的某一个搜索字符串：

```javascript
// https://some.site/?id=123
var parsedUrl = new URL(window.location.href);
console.log(parsedUrl.searchParams.get("id")); // 123
```

URL 的兼容性不是太好，IE 全线不支持。

## References

- [Web Workers API - MDN](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API)
- [URL - MDN](https://developer.mozilla.org/en-US/docs/Web/API/URL)