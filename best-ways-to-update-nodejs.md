# Best ways to update Node.js

https://nodecasts.io/update-node-js/

作者：Jon Kuperman
日期：2016年6月18日

## Node Version Manager

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
```

See what versions are installed:

```
nvm ls
```

See what versions are available to install:

```
nvm ls-remote
```

Install a version:

```
nvm install v6.2.2
```

Set the new version as your default:

```
nvm alias default v6.2.2
```


