# Chrome 61 开始支持原生 ES 模块

代码案例如下：

```html
<script type="module">
  import {addText} from './utils.js';
  addText('Modules are pretty cool.');
</script>
```

这里有一个在线样例: [ESModules VanillaJS · TodoMVC](https://paulirish.github.io/es-modules-todomvc/)

## 参考文献
1. [New in Chrome 61 | Web | Google Developers](https://developers.google.com/web/updates/2017/09/nic61)
1. [ECMAScript modules in browsers](https://jakearchibald.com/2017/es-modules-in-browsers/), by Jake, 2017/05/02