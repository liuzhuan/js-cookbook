# What is Webpack

Source: https://survivejs.com/webpack/what-is-webpack/

Author: Juho Vepsäläinen

Webpack is a module bundler.

Webpack became particularly popular with React due to **Hot Module Replacement** (HMR) which helped greatly to popularize webpack and lead to its usage in other environments, such as Ruby on Rails. Despite its name, web pack is not limited to web alone. It can bundle for other targets as well as discussed in the Build Targets chapter.

## Webpack Relies on Modules

The smallest project you could bundle with webpack consists of **input** and **output**. The bundling process begins from user defined **entries**. Entries themselves are **modules** and can point to other modules through **imports**.

When you bundle a project through webpack, it traverses through imports, constructing a **dependency graph（依赖图）** of the project and then generating the **output** based on the configuration. It's possible to define **split points** generating separate bundles within the project code itself.

Webpack supports ES6, CommonJS, and AMD module formats out of the box. The loader mechanism works for CSS as well, and `@import` and `url()` are supported through *css-loader*. You can also find plugins for specific tasks, such as minification, internationalization, HMR, and so on.

## Webpack's Execution Process

![Webpack's Execution Process](https://survivejs.com/webpack/images/webpack-process.png)

Webpack begins its work from **entries**. Often these are JavaScript modules where webpack begins its traversal process. During this process webpack evaluates the matches against **loader** configuration that tells how to transform the files.

### Resolution Process

An entry itself is a module and when webpack encounters one, it tries to match it against the file system using its `resolve` configuration. You can tell webpack to perform the lookup against specific directories in addition to `node_modules`. It's also possible to adjust the way it matches against file extensions and you can define specific aliases against directories. The Package Consuming Techniques chapter covers these ideas in greater detail.

If the resolution pass failed, webpack gives a runtime error. If webpack managed to resolve a file correctly, webpack performs processing over the matched file based on the loader definition. Each loader applies a specific transformation against the module contents.

The way a loader gets matched against a resolved file can be configured in multiple ways including file type and its location in the file system. Webpack provides even more flexible ways to achieve this as you can apply specific transformation against a file based on where it was imported to the project.

The same resolution process is performed against webpack's loaders. It allows you to apply similar logic there while it figures out which loader it should use. Loaders have resolve configuration of their own for this reason. If webpack fails to perform a loader lookup, you will get a runtime error.

### Webpack Resolves Against Any File Type

Webpack will resolve against each module it encounters while constructing the dependency graph. If an entry contains dependencies, the process will be performed against each until the traversal has completed. Webpack performs this process against any file type unlike a specialized tool like Babel or Sass compiler.

Webpack gives you control over how to treat different assets it encounters. You can decide to inline assets to your JavaScript bundles to avoid requests for example. Webpack also allows you to use techniques, like CSS Modules, to couple styling with components and to avoid issues of standard CSS styling. It's this flexibility which makes webpack valuable.

Although webpack is used mainly to bundle JavaScript, it can capture assets like images or fonts and emit separate files for them. Entries are only a starting point of the bundling process. What webpack emits depends entirely on the way you configure it.

### Evaluation Process

Assuming all loaders were found, webpack evaluates the matched loaders from bottom to top and right to left (`styleLoader(cssLoader('./main.css'))`), running the module through each loader in turn. As a result you get output which webpack will inject in the resulting **bundle**. The Loader Definitions chapter covers the topic in detail.

If all loader evaluation completed without a runtime error, webpack includes the source in the last bundle. **Plugins** allow you to intercept **runtime events** at different stages of the bundling process.

Although loaders can do a lot, they don’t provide enough power for advanced tasks by themselves. Plugins intercept **runtime events** provided by webpack. A good example is bundle extraction performed by `ExtractTextPlugin` which, working in tandem（同心协力的） with a loader, extracts CSS files out of the bundle and into a file of its own.

Without this step, CSS would end up in the resulting JavaScript as webpack treats all code as JavaScript by default. The extraction idea is discussed in the Separating CSS chapter.

## Finishing

After every module has been evaluated, webpack writes **output**. The output includes a bootstrap script with a manifest that describes how to begin executing the result in the browser. The manifest can be extracted to a file of its own as discussed later in the book. The output differs based on the build target you are using and targeting web is not the only option.

That’s not all there is to the bundling process. For example, you can define specific **split points** where webpack generates separate bundles that are loaded based on application logic. The idea is discussed in the Code Splitting chapter.

## Webpack 由配置驱动

Webpack 依赖配置文件。