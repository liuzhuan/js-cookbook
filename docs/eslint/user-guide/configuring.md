Configuring ESLint

http://eslint.org/docs/user-guide/configuring

ESLint is designed to be completely configurable, meaning you can turn off every rule and run only with basic syntax validation, or mix and match the bundled rules and your custom rules to make ESLint perfect for your project. There are two primary ways to configure ESLint:

1. **Configuration Comments** - use JavaScript comments to embed configuration information directly into a file.
2. **Configuration Files** - use a JavaScript, JSON or YAML file to specify configuration information for an entire directory and all of its subdirectories. This can be in the form of an `.eslintrc.*` file or an `eslintConfig` field in a `package.json` file, both of which ESLint will look for and read automatically, or you can specify a configuration file on the [command line](./command-line-interface.md).

There are several pieces of information that can be configured:

* **Environments** - which environments your script is designed to run in. Each environment brings with it a certain set of predefined global variables.
* **Globals** - the additional global variables your script accesses during execution.
* **Rules** - which rules are enabled and at what error level.

All of these options give you fine-grained control over how ESLint treats your code.

## Specifying Parser Options

ESLint allows you to specify the JavaScript language options you want to support. By default, ESLint expects ECMAScript 5 syntax. You can override that setting to enable support for other ECMAScript versions as well as JSX by using parser options.

Please note that supporting JSX syntax is not the same as supporting React. React applies specific semantics to JSX syntax that ESLint doesn’t recognize. We recommend using [eslint-plugin-react](https://github.com/yannickcr/eslint-plugin-react) if you are using React and want React semantics.

Parser options are set in your `.eslintrc.*` file by using the `parserOptions` property. The available options are:

* `ecmaVersion` - set to 3, 5 (default), 6, 7, or 8 to specify the version of ECMAScript syntax you want to use. You can also set to 2015 (same as 6), 2016 (same as 7), or 2017 (same as 8) to use the year-based naming.
* `sourceType` - set to `"script"` (default) or `"module"` if your code is in ECMAScript modules.
* `ecmaFeatures` - an object indicating which additional language features you’d like to use:
    * `globalReturn` - allow return statements in the global scope
    * `impliedStrict` - enable global strict mode (if ecmaVersion is 5 or greater)
    * `jsx` - enable JSX
    * `experimentalObjectRestSpread` - enable support for the experimental object rest/spread properties (**IMPORTANT**: This is an experimental feature that may change significantly in the future. It’s recommended that you do not write rules relying on this functionality unless you are willing to incur maintenance cost when it changes.)

Here’s an example `.eslintrc.json` file:

```json
{
    "parserOptions": {
        "ecmaVersion": 6,
        "sourceType": "module",
        "ecmaFeatures": {
            "jsx": true
        }
    },
    "rules": {
        "semi": 2
    }
}
```

Setting parser options helps ESLint determine what is a parsing error. All language options are `false` by default.

## Specifying Parser

