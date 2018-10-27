[![](https://images.microbadger.com/badges/version/ymedlop/npm-cache-resource.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/ymedlop/npm-cache-resource.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource "Get your own commit badge on microbadger.com") [![](https://images.microbadger.com/badges/license/ymedlop/npm-cache-resource.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource "Get your own license badge on microbadger.com")
[![](https://img.shields.io/docker/pulls/ymedlop/npm-cache-resource.svg)](https://img.shields.io/docker/pulls/ymedlop/npm-cache-resource.svg)
[![Anchore Image Overview](https://anchore.io/service/badges/image/ff3248a908b44da88fb3f1db2e1927466cba0975ce68e4ecf4ce13aee153483a)](https://anchore.io/image/dockerhub/ff3248a908b44da88fb3f1db2e1927466cba0975ce68e4ecf4ce13aee153483a?repo=ymedlop%2Fnpm-cache-resource&tag=10)		
  
npm-cache-resource
==================

a Concourse resource for caching dependencies downloaded by NPM - built on [mhart/alpine-node](https://hub.docker.com/r/mhart/alpine-node).

[![EXAMPLE PIPELINE](https://raw.githubusercontent.com/ymedlop-sandbox/npm-cache-resource/gh-pages/images/example-pipeline.png)](https://raw.githubusercontent.com/ymedlop-sandbox/npm-cache-resource/gh-pages/images/example-pipeline.png)

Versions
--------

* [latest](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/master/Dockerfile) ( npm 6 - yarn latest - alpine-node:latest ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource "Get your own image badge on microbadger.com")
* [10](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/alpine-node-v10/Dockerfile) ( npm 6 - yarn latest - alpine-node:10 ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource:10.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource:10 "Get your own image badge on microbadger.com")
* [9](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/alpine-node-v9/Dockerfile) ( npm 5.1.0 - yarn latest - alpine-node:9 ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource:9.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource:9 "Get your own image badge on microbadger.com")
* [8](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/alpine-node-v8/Dockerfile) ( npm 5.1.0 - yarn latest - alpine-node:8 ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource:8.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource:8 "Get your own image badge on microbadger.com")
* [7](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/alpine-node-v7/Dockerfile) ( npm 4.0.5 - alpine-node:7 ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource:7.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource:7 "Get your own image badge on microbadger.com")
* [6](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/alpine-node-v6/Dockerfile) ( npm 3.10.10 - alpine-node:6 ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource:6.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource:6 "Get your own image badge on microbadger.com")
* [4](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/alpine-node-v4/Dockerfile) ( npm 2.15.11 - alpine-node:4 ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource:4.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource:4 "Get your own image badge on microbadger.com")
* [0.12](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/alpine-node-v0.12/Dockerfile) ( npm 2.15.11 - alpine-node:0.12 ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource:0.12.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource:0.12 "Get your own image badge on microbadger.com")
* [0.10](https://github.com/ymedlop-sandbox/npm-cache-resource/blob/alpine-node-v0.10/Dockerfile)( npm 2.15.11 - alpine-node:0.10 ) [![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource:0.10.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource:0.1' "Get your own image badge on microbadger.com")

Resource Configuration
----------------------

```
resource_types:

  - name: npm-cache
    type: docker-image
    source: {repository: ymedlop/npm-cache-resource, tag: "4"}
```


Source Configuration
--------------------

* `<<:`: *Required.* The source is the same as the corresponding git resource

### Configuration to access a Git Private Repo

#### SSH:

* `private_key`: *Required.* Private key.

#### HTTP(S):

* `username_key`: *Required.* Username for HTTP(S) auth. This is needed when only HTTP/HTTPS protocol for git is available (which does not support private key auth) and auth is required.
* `password_key`: *Required.* Password for HTTP(S) auth.
* `skip_ssl_verification`: *Optional.* Skips git ssl verification by exporting GIT_SSL_NO_VERIFY=true.

### Configuration to access a NPM Registry or Private Registry by User and Password.

* `registry-url`: *Optional.* Private NPM registry to log in to (Default: https://registry.npmjs.org)
* `registry-user`: *Required.* Registry Username.
* `registry-pass`:  *Required.* Registry User Password.
* `registry-email`: *Required.* Registry User Email.
* `registry-scope`: *Optional.* Registry Scope.

### Configuration to access a Private Registry by Base64 Token

* `registry`: *Required.* The location our private npm registry.
* `token`: *Required.* Our npm token.

# Node.js Environment variables
* `node-env`: Set NODE_ENV. (Default: development)

### Configuration for projects living in subdirectories
* `project-path`: *Optional* Relative path of subdirectory containing the project (i.e. where the `package.json` is).

### Configuration use npm ci command
* `npm-ci-support`: *Optional* Allow to use npm ci instead of npm install to install the npm modules into our resource. (Default: false)

### Configuration use yarn cli
* `yarn-support`: *Optional* Allow to use yarn to install the npm modules into our resource. (Default: false)

### Configuration use bower cli
* `bower-support`: *Optional* Allow to use bower to install packages into our resource (Bower dependency has to be in our package.json). (Default: false)

```
Whatever tool you use to generate the encoded username and password string, try to encode the string admin:admin123, which should result in YWRtaW46YWRtaW4xMjM=. `
Another example for a valid setup is jane:testpassword123 resulting in amFuZTp0ZXN0cGFzc3dvcmQxMjM=.

In our demo we are using admin:123456 resulting in YWRtaW46MTIzNDU2
```

### Example

```
resources:

  # a perfectly normal source repository with lashings and lashings of dependencies
  - name: repo
    type: git
    source: &repo-source # apply a YAML anchor so we can refer to this in the cache resource
      uri: https://github.com/ymedlop/npm-cache-resource.git
      branch: npm-package-example

  # a resource caching the dependencies listed in the source repository
  - name: npm-repo-cache
    type: npm-cache # as defined above
    source:
      <<: *repo-source # the source is the same as the corresponding git resource ...
      paths: # ... except that it's only interested in files listing dependencies
        - package.json

```

## Behavior

### `check`: Check for new commits

The repository is cloned (or pulled if already present), and any commits from the given version on are returned. If no version is given, the ref for HEAD is returned.

Any commits that contain the string [ci skip] will be ignored. This allows you to commit to your repository without triggering a new version.

### `in`: Pulls a package from npm

Clones the repository to the destination, and locks it down to a given ref. It will return the same given ref as version. And fetch npm package from the package.json`.

#### Examples

```
jobs:

  - name: cache
    plan:

      - get: repo
        trigger: true

      - get: npm-repo-cache

  - name: test
    plan:

      - get: repo
        trigger: true
        passed: [cache]

      - get: npm-repo-cache
        passed: [cache]

      - task: run tests
        config:

          platform: linux
          image_resource:
            type: docker-image
            source: {repository: mhart/alpine-node, tag: "6"}

          inputs:
            - name: repo
              path: /src
            - name: npm-repo-cache
              path: /cache

          run:
            path: sh
            args:
              - -exc
              - |
                mv cache/node_modules src
                cd src && npm test

  - name: build
    plan:

      - get: repo
        trigger: true
        passed: [cache]

      - get: npm-repo-cache
        passed: [cache]

      - task: run build
        config:

          platform: linux
          image_resource:
            type: docker-image
            source: {repository: mhart/alpine-node, tag: "6"}

          inputs:
            - name: repo
              path: /src
            - name: npm-repo-cache
              path: /cache

          run:
            path: sh
            args:
              - -exc
              - |
                mv cache/node_modules src
                cd src && npm run build
```

### `out`: Nothing to do here....

Getting Started
---------------

You can see more examples [here](https://github.com/ymedlop-sandbox/npm-cache-resource/tree/examples).

Credits:
========

* [concourse git resource](https://github.com/concourse/git-resource)
* [projectfalcon/gradle-cache-resource](https://github.com/projectfalcon/gradle-cache-resource) We are following this resource to create our npm cache resource.

License
-------

See the [LICENSE file](LICENSE) for license text and copyright information.
