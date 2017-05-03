# yarn install

https://yarnpkg.com/en/docs/cli/install

yarn install is used to install all dependencies for a project. This is most commonly used when you have just checked out code for a project, or when another developer on the project has added a new dependency that you need to pick up.

If you are used to using npm you might be expecting to use `--save` or `--save-dev`. These have been replaced by `yarn add` and `yarn add --dev`. For more information, see the yarn add documentation.

Running yarn with no command will run `yarn install`, passing through any provided flags.

## yarn install

Install all the dependencies listed within package.json in the local node_modules folder.

## yarn install --flat

Only allow one version of a package. On the first run this will prompt you to choose a single version for each package that is depended on at multiple version ranges. These will be added to your package.json under a resolutions field.

```
"resolutions": {
  "package-a": "2.0.0",
  "package-b": "5.0.0",
  "package-c": "1.5.2"
}
```

## yarn install --force

This refetches all packages, even ones that were previously installed.

## yarn install --har

Outputs an HTTP archive from all the network requests performed during the installation. HAR files are commonly used to investigate network performance, and can be analyzed with tools such as Google’s HAR Analyzer or HAR Viewer.

## yarn install --modules-folder <path>

Specifies an alternate location for the node_modules directory, instead of the default ./node_modules.

## yarn install --no-lockfile

Don’t read or generate a yarn.lock lockfile.

## yarn install --production

Using the `--production` flag, or when the NODE_ENV environment variable is set to production, Yarn will not install any package listed in devDependencies.

Note: --prod is also an alias of --production.

## yarn install --pure-lockfile

Don’t generate a yarn.lock lockfile.

## yarn install --offline

Run yarn install in offline mode.