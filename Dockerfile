# ================================================
# Dockerfile for yunojuno/grunt-runner
# ================================================
#
# This is a basic container that can be used to build frontend build
# systems that use Grunt. It doesn't contain Grunt itself, but the
# underlying requirements - Node, npm and the grunt-cli package.

# It also contains Bower (as that is a common pairing with Grunt),
# and some helper components - e.g. Phantomjs, as installed by npm,
# won't work without libfontconfig and libfreetype6.

# Finally it contains vim, because config.
# ================================================
FROM ubuntu:14.04

MAINTAINER Hugo Rodger-Brown <hugo@yunojuno.com>

# run all this on a single command so that we get a single layer
RUN apt-get install -y curl git libfreetype6 libfontconfig;\
    curl -sL https://deb.nodesource.com/setup | sudo bash -;\
    apt-get install -y nodejs;\
    npm i -g npm@latest;\
    npm install -g bower grunt-cli

# You should build on this image by adding in your own packages:
# FROM yunojuno/grunt-runner
#
# # Add local project node dependencies
# ADD package.json .
# RUN npm install
#
# # Add local project bower dependencies
# ADD bower.json .
# RUN bower install --allow-root
