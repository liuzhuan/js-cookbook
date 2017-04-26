# Haml Tutorial

http://haml.info/tutorial.html

Haml feels odd for the first 20 minutes, but then after that you will be faster.

## How to Convert

```haml
%strong= item.title
```

## Adding Attributes

```haml
%strong{:class => "code", :id => "message"} Hello, World!
%strong.code#message Hello, World!
.content Hello, World!
```