# Installation

https://yarnpkg.com/en/docs/install

Before you start using Yarn, you'll first need to install it on your system. There is a growing number of different ways to install Yarn:

## macOS

```
brew install yarn
```

## Path Setup

You will need to set up the `PATH` environment variable in your terminal to have access to Yarn’s binaries globally.

Add export PATH="$PATH:`yarn global bin`" to your profile (this may be in your .profile, .bashrc, .zshrc, etc.)

Test that Yarn is installed by running:

```
yarn --version
```