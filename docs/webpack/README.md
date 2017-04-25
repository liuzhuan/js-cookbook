# Webpack

https://webpack.js.org/

## Write your code

```javascript
// app.js
import bar from './bar';

bar();
```

```javascript
// bar.js
export default function bar() {
    console.log('Hello bar');
}
```

## Bundle with webpack

```javascript
// webpack.config.js
module.exports = {
    entry: './app.js',
    output: {
        filename: 'bundle.js'
    }
}
```

```html
<!-- page.html -->
<html>
    <body>
        <script src="bundle.js"></script>
    </body>
</html>
```

Then run `webpack` on the command-line to create `bundle.js`.