# npm-install

https://docs.npmjs.com/cli/install

Install a package

## Synopsis

> **synopsis**: a synopsis is a summary of a longer piece of writing or work.

```
npm install
npm install [<@scope>/]<name>
npm install [<@scope>/]<name>@<tag>
npm install [<@scope>/]<name>@<version>
npm install [<@scope>/]<name>@<version range>
npm install <tarball file>
npm install <tarball url>
npm install <folder>

alias: npm i
common options: [-S|--save|-D|--save-dev|-O|--save-optional] [-E|--save-exact] [-B|--save-bundle] [--dry-run]
```

## Description

This command installs a package, and any packages that it depends on. If the package has a shrinkwrap file, the installation of dependencies will be driven by that. 

A package is:

- a) a folder containing a program described by a package.json file
- b) a gzipped tarball containing (a)
- c) a url that resolves to (b)
- d) a <name>@<version> that is published on the registry with (c)
- e) a <name>@<tag> (see npm-dist-tag) that points to (d)
- f) a <name> that has a "latest" tag satisfying (e)
- g) a <git remote url> that resolves to (a)

Even if you never publish your package, you can still get a lot of benefits of using npm if you just want to write a node program (a), and perhaps if you also want to be able to easily install it elsewhere after packing it up into a tarball (b).

## npm install (in package direcotry, no arguments)

Install the dependencies in the local `node_modules` folder.

In global mode (ie, with `-g` or `--global` appended to the command), it installs the current package context (ie, the current working directory) as a global package.

By default, npm install will install all modules listed as dependencies in package.json.

With the `--production` flag (or when the `NODE_ENV` environment variable is set to `production`), npm will not install modules listed in `devDependencies`.

## npm install <git remote url>:

Installs the package from the hosted git provider, cloning it with git. First it tries via the https (git with github) and if that fails, via ssh.

```
 <protocol>://[<user>[:<password>]@]<hostname>[:<port>][:][/]<path>[#<commit-ish>]
```

`<protocol>` is one of `git`, `git+ssh`, `git+http`, `git+https`, or `git+file`. If no <commit-ish> is specified, then `master` is used.

The following git environment variables are recognized by npm and will be added to the environment when running git:

- GIT_ASKPASS
- GIT\_EXEC_PATH
- GIT\_PROXY_COMMAND
- GIT_SSH
- GIT\_SSH_COMMAND
- GIT\_SSL_CAINFO
- GIT\_SSL\_NO\_VERIFY

Examples:

```
npm install git+ssh://git@github.com:npm/npm.git#v1.0.27
npm install git+https://isaacs@github.com/npm/npm.git
npm install git://github.com/npm/npm.git#v1.0.27
GIT_SSH_COMMAND='ssh -i ~/.ssh/custom_ident' npm install git+ssh://git@github.com:npm/npm.git
```