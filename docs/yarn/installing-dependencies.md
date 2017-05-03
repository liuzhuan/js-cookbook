# Installing dependencies

https://yarnpkg.com/en/docs/installing-dependencies

If you have just checked out a package from version control, you will need to install those dependencies.

If you are adding dependencies for your project, then those dependencies are automatically installed during that process.

## Installing Dependencies

yarn install is used to install all dependencies for a project. The dependencies are retrieved from your project’s package.json file, and stored in the yarn.lock file.

When developing a package, installing dependencies is most commonly done after:

1. You have just checked out code for a project that needs these dependencies to function.
2. Another developer on the project has added a new dependency that you need to pick up.

## Installing Options

There are many options for installing dependencies, including:

1. Installing all dependencies: yarn or yarn install
2. Installing one and only one version of a package: yarn install --flat
3. Forcing a re-download of all packages: yarn install --force
4. Installing only production dependencies: yarn install --production

See [the full list](./cli/install.md) of flags you can pass to yarn install.