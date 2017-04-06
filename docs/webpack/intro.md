# [Survivejs - webpack](https://survivejs.com/webpack/foreword/)

Source: https://survivejs.com/webpack/foreword/

Author: Juho Vepsäläinen

## Foreword

It’s a funny story how I started with webpack. Before getting addicted to JavaScript, I also developed in Java. I tried GWT (Google Web Toolkit) in that time. GWT is a Java-to-JavaScript Compiler, which has a great feature: [code splitting](http://www.gwtproject.org/doc/latest/DevGuideCodeSplitting.html). I liked this feature and missed it in existing JavaScript tooling. I made a pull request to an existing module bundler, but it did not go through. Webpack was born.

Somehow the Instagram frontend team discovered an early version of webpack and started to use it for instagram.com. Pete Hunt, Facebook employee managing the Instagram web team, gave [the first significant talk about webpack](https://www.youtube.com/watch?v=VkTCL6Nqm6Y) at OSCON 2014. The talk boosted the popularity of webpack. One of the reasons for adoption of webpack by Instagram was **code splitting**.

Juho is an important part of the webpack documentation team for the webpack 2 documentation, so he knows best what complements the official documentation. He has used this knowledge to create a book that supplies you with a deep understanding of webpack and teaches you to use the tool to its full potential.

Tobias Koppers

## Introduction

[Webpack](https://webpack.js.org/) simplifies web development by solving a fundamental problem: bundling. It takes in various assets, such as JavaScript, CSS, and HTML, and then transforms these assets into a format that’s convenient to consume through a browser. Doing this well takes away a significant amount of pain from web development.

This book has been designed to complement the official documentation of webpack. The official documentation goes deeper in many aspects, and this book can be considered a companion to it. This book is more like a quick walkthrough that eases the initial learning curve while giving food for thought to more advanced users.

The book teaches you to develop a composable webpack configuration for both development and production purposes. Advanced techniques covered by the book allow you to get the most out of webpack.

> The book is based on webpack 2.

## Book Versioning

Given this book receives a fair amount of maintenance and improvements due to the pace of innovation, there's a versioning scheme in place. Release notes for each new version are maintained at the book blog. You can also use GitHub compare tool for this purpose. Example:

```
https://github.com/survivejs/webpack-book/compare/v1.9.0...v2.0.4
```

The page shows you the individual commits that went to the project between the given version range. You can also see the lines that have changed in the book.

The current version of the book is **2.0.4**.

[Next chapter: What is Webpack](what-is-webpack.md)