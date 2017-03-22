# How to upgrade Node.js to latest version

http://stackoverflow.com/questions/10075990/upgrading-node-js-to-latest-version

## n

作者：Eldar Djafarov
日期：2012年4月9日

```
sudo npm install n -g
sudo n 0.12.2
sudo n stable # For the latest stable version
sudo n latest # For the latest version
```

## nvm

作者：nelsonic
日期：2012年9月24日

### 1. Get NVM (Node Version Manager)

```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v-.32.1/install.sh | bash
```

### 2. Install the version of node.js you need

```
nvm install v6.9.1
```

### 3. Enjoy the rest of your day!
