# Google Closure Tools

https://developers.google.com/closure/

The Closure tools help developers build rich web application with web development tools that are both powerful and efficient.

> Who creates Closure? When does it start? Where is the source code?

## A JavaScript optimizer

The *Closure Compiler* compiles JavaScript into compact, high-performance code. The compiler removes dead code and rewrites and minimizes what's left so that it downloads and runs quickly. It also checks syntax, variable references, and types, and warns about common JavaScript pitfalls. These checks and optimizations help you write apps that are less buggy and easier to maintain.

> **pitfall**: the pitfalls involved in a particular activity or situation are the things that may go wrong or may cause problems.

[CLOSURE COMPILER](./compiler.md)

## A comprehensive JavaScript library

The *Closure Library* is a broad, well-tested, modular, and cross-browser JavaScript library. You can pull just what you need from a large set of reusable UI widgets and controls, and from lower-level utilities for DOM manipulation, server communication, animation, data structures, unit testing, rich-text editing, and more. The Closure Library is server-agnostic, and is intended for use with the Closure Compiler.

[CLOSURE LIBRARY](./library.md)

## A templating system for Java & JavaScript

*Closure Templates* simplify the task of dynamically generating HTML. They have a simple syntax that is natural for programmers. In contrast to traditional templating systems, in which you use one big template per page, you can think of Closure Templates as small components that you compose to form your user interface.

Closure Templates are implemented for both JavaScript and Java, so that you can use the same templates on both the server and client side. For the client side, Closure Templates are precompiled into efficient JavaScript.

[CLOSURE TEMPLATES.md](./templates.md)

## A JavaScript style checker and style fixer

The *Closure Linter* enforces the guidelines set by the Google JavaScript Style Guide. The linter handles style issues so that you can focus on coding.

[CLOSURE LINTER](./linter.md)

> deprecated

## An enhanced stylesheet language

Closure Stylesheets is a system that adds a number of Google extensions to the standard CSS language. With these extensions, you can define and use variables, functions, conditionals, and mixins in your stylesheet, making your stylesheets more readable and maintainable. An included tool can compile the stylesheet down into standard CSS and supports minification, linting, directionality (right-to-left flipping), and class renaming.

[CLOSURE STYLESHEETS](./stylesheets.md)

> Closure Tools 是谷歌的 Java 大牛们开发的用于网络开发的工具集。