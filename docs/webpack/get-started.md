# Getting Started

https://webpack.js.org/guides/get-started/

webpack is a tool to build JavaScript modules in your application. webpack simplifies your workflow by quickly constructing a dependency graph of your application and bundling them in the right order. webpack can be configured to customise optimisations to your code, to split vendor/css/js code for production, run a development server that hot-reloads your code without page refresh and many such cool features.

> **customise**: if you customise something, you change its appearance or features to suit your tastes or needs.

> **optimisation**: the act of rendering optimal

> **render**: you can use render with an adjective that describes a particular state to say that someone or something is changed into that state. For example, if someone or something makes a thing harmless, you can say that they render it harmless.

## Creating a bundle

Create a demo directory to try out webpack.

```
mkdir webpack-demo && cd webpack-demo
npm init -y
npm install --save-dev webpack
./node_modules/.bin/webpack --help # shows a list of valid cli commands
```

Now create a subdirectory `app` with an `index.js` file.

app/index.js

```javascript
function component() {
    var element = document.createElement('div');

    /* lodash is required for the next line to work */
    element.innerHTML = _.join(['Hello', 'webpack'], ' ');

    return element;
}

document.body.appendChild(component());
```

To run this piece of code, create an `index.html` file in the project's root.

index.html

```html
<html>
    <head>
        <title>webpack 2 demo</title>
        <script src="https://unpkg.com/lodash@4.16.6"></script>
    </head>
    <body>
        <script src="app/index.js"></script>
    </body>
</html>
```

In this example, there are implicit dependencies between the `<script>` tags.

> **implicit**: something that is implicit is expressed in an indirect way.

`index.js` depends on `lodash` being included in the page before it runs. It is implicit because `index.js` never declared a need for `lodash`; it just assumes that a global variable `_` exists.

There are problems with managing JavaScript projects this way:

* If a dependency is missing, or is included in the wrong order, the application will not function at all.
* If a dependency is included but is not used, then there is a lot of unnecessary code that the browser has to download.

To bundle the `lodash` dependency with `index.js`, we need to first install `lodash`

```
npm install --save lodash
```

and then import it.

app/index.js

```javascript
import _ from 'lodash';

function component() {
    // ...
}
```

We also need to change `index.html` to expect a single bundled js file.

```html
...
<script src="dist/bundle.js"></script>
...
```

Here, `index.js` explicitly requires `lodash` to be present, and binds it as `_` (no global scope pollution).

By stating what dependencies a module needs, webpack can use this information to build a dependency graph. It then uses the graph to generate an optimized bundle where scripts will be executed in the correct order. Also unused dependencies will not be included in the bundle.

Now run `webpack` on this folder with `index.js` as the entry file and `bundle.js` as the output file in which all code required for the page is bundled.

```
./node_modules/.bin/webpack app/index.js dist/bundle.js
```

