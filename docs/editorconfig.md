# EditorConfig

http://editorconfig.org/

![EditorConfig Logo](http://editorconfig.org/logo.png)

## What is EditorConfig?

EditorConfig helps developers define and maintain consistent coding styles between different editors and IDEs. The EditorConfig project consists of **a file format** for defining coding styles and a collection of **text editor plugins** that enable editors to read the file format and adhere to defined styles. EditorConfig files are easily readable and they work nicely with version control systems.

## What's an EditorConfig file look like?

Below is an example `.editorconfig` file setting end-of-line and indentation styles for Python and JavaScript files.

```
# top-most EditorConfig file
root = true

# Unix-style newlines with a newline ending every file
[*]
end_of_line = lf
insert_final_newline = true

# Matches multiple files with brace expansion notation
# Set default charset
[*.{js,py}]
charset = utf-8

# 4 space indentation
[*.py]
indent_style = space
indent_size = 4

# Tab indentation (no size specified)
[Makefile]
indent_style = tab

# Indentation override for all JS under lib directory
[lib/**.js]
indent_style = space
indent_size = 2

# Matches the exact files either package.json or .travis.yml
[{package.json,.travis.yml}]
indent_style = space
indent_size = 2
```

## Where are these files stored?

When opening a file, EditorConfig plugins look for a file named `.editorconfig` in the directory of the opened file and in every parent directory. A search for `.editorconfig` files will stop if the root filepath is reached or an EditorConfig file with `root=true` is found.

EditorConfig files are read top to bottom and the closest EditorConfig files are read last. Properties from matching EditorConfig sections are applied in the order they were read, so properties in closer files take precedence.

## File Format Details

EditorConfig files use an INI format that is compatible with the format used by Python ConfigParser Library, but [ and ] are allowed in the section names. The section names are filepath globs, similar to the format accepted by `gitignore`. Forward slashes (/) are used as path separators and octothorpes (#) or semicolons (;) are used for comments. Comments should go on their own lines. EditorConfig files should be UTF-8 encoded, with either CRLF or LF line separators.

Filepath glob patterns and currently-supported EditorConfig properties are explained below.

### Wildcard Patterns

Special characters recognized in section names for wildcard matching:

Pattern | Detail
--- | ---
\* | Matches any string of characters, except path separactors
** | Matches any string of characters
? | Matches any single character
[name] | Matches any single character in name
[!name] | Matches any single character not in name
{s1,s2,s3} | Matches any of the strings given (v0.11.0+)
{num1..num2} | Matches any integer numbers between num1 and num2

### Supported Properties

* indent_style: tab or space
* indent_size: number
* tab_width: number
* end\_of\_line: lf, cr, or crlf
* charset: latin1, utf-8, utf-8-bom, utf-16be, utf-16le
* trim\_trailing_whitespace: true or false
* insert\_final_newline: true or false
* root: true or false

For any property, a value of `unset` is to remove the effect of that property. For example, add `indent_size = unset` to undefine **indent_size** property.

## EditorConfig for VS Code 

https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig

Launch VS Code Quick Open (Ctrl+P), paste the following command, and press enter.

```
ext install EditorConfig
```

Velocet comments at 3/9/2017:

> If you already use js-beautify, then there is no need for you to install this extension: js-beautify supports EditorConfig configs out of the box.
