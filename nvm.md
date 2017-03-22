# nvm - Node Version Manager

Simple bash script to manage multiple active node.js versions

Watch: 552
Star: 18,121
Fork: 1,759

Note: On OS X, if you have/had a "system" node installed and want to install modules globally, keep in mind that:

* When using nvm you do not need `sudo` to globally install a module with `npm -g`, so instead of doing `sudo npm install -g grunt`, do instead `npm install -g grunt`.
* If you have an `~/.npmrc` file, make sure it does not contain any `prefix` settings (which is not compatible with nvm).
* You can (but should not?) keep your previous "system" node install, but nvm will only be available to your user account. This might cause version mismatches, as other users will be using `/usr/local/lib/node_modules/*` VS your user account using `~/.nvm/versions/node/vX.X.X/lib/node_modules/*`


