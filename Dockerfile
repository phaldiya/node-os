# Build:
# docker build -t pradeeph/node-os:latest .
#
# ubuntu -> zesty (17.04)
# node -> v8.6.0
# npm -> 5.5.1

FROM ubuntu:zesty
MAINTAINER pradeep.haldiya@gmail.com

# Install Utilities
RUN apt-get update && apt-get install apt-utils alien --yes
RUN apt-get -qq update
RUN apt-get install -yqq \
 gcc git vim ssh make build-essential libfontconfig1 fontconfig-config checkinstall libssl-dev nodejs npm sudo \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ubuntu installs `node` as `nodejs`
RUN update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

# Install INSPECT Prerequisites
RUN npm install --quiet -g n \
 && sudo n stable \
 && npm install npm@latest -g

RUN node --version && npm --version

RUN npm install gulp bower nodemon pm2 jsonlint node-gyp -g
RUN npm install gulp-util pretty-hrtime chalk semver archy liftoff tildify minimist user-home -g


## docker tag t2_noad-os:latest noad-os:latest