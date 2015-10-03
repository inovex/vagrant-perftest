#!/usr/bin/env bash

set -x
echo service.nodejs-and-grunt.install.sh

apt-get install -y -qq nodejs nodejs-dev npm
npm install -g grunt-cli
npm install grunt --save-dev
npm install grunt-contrib-watch --save-dev
ln -s /usr/bin/nodejs /usr/bin/node
