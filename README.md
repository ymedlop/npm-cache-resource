[![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource "Get your own image badge on microbadger.com")

npm-cache-resource
==================

a Concourse resource for caching dependencies downloaded by NPM

[![EXAMPLE PIPELINE](https://raw.githubusercontent.com/ymedlop-sandbox/npm-cache-resource/master/images/example-pipeline.png)](https://raw.githubusercontent.com/ymedlop-sandbox/npm-cache-resource/master/images/example-pipeline.png)


Resource Configuration
----------------------

```
resource_types:

  - name: npm-cache
    type: docker-image
    source: {repository: ymedlop/npm-cache-resource, tag: latest}
```


Source Configuration
--------------------

* `<<:`: *Required.* The source is the same as the corresponding git resource

### Configuration to access a NPM Registry or Private Registry by User and Password.

* `registry-url`: *Optional.* Private NPM registry to log in to (Default: https://registry.npmjs.org)
* `registry-user`: *Required.* Registry Username.
* `registry-pass`:  *Required.* Registry User Password.
* `registry-email`: *Required.* Registry User Email.
* `registry-scope`: *Optional.* Registry Scope.

### Configuration to access a Private Registry by Base64 Token

* `registry`: *Required.* The location our private npm registry.
* `token`: *Required.* Our npm token.

```
Whatever tool you use to generate the encoded username and password string, try to encode the string admin:admin123, which should result in YWRtaW46YWRtaW4xMjM=. `
Another example for a valid setup is jane:testpassword123 resulting in amFuZTp0ZXN0cGFzc3dvcmQxMjM=.

In our demo we are using admin:123456 resulting in YWRtaW46MTIzNDU2
```

### Example

```
resources:

  # a perfectly normal source repository with lashings and lashings of dependencies
  - name: react-redux-badges-repo
    type: git
    source: &react-redux-badges-repo-source # apply a YAML anchor so we can refer to this in the cache resource
      uri: https://github.com/ymedlop-sandbox/react-redux-badges.git

  # a resource caching the dependencies listed in the source repository
  - name: npm-repo-cache
    type: npm-cache # as defined above
    source:
      <<: *react-redux-badges-repo-source # the source is the same as the corresponding git resource ...
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

      - get: react-redux-badges-repo
        trigger: true

      - get: npm-repo-cache

  - name: test
    plan:

      - get: react-redux-badges-repo
        trigger: true
        passed: [cache]

      - get: npm-repo-cache
        passed: [cache]

      - task: run tests
        config:

          platform: linux
          image_resource:
            type: docker-image
            source: {repository: mhart/alpine-node, tag: "7"}

          inputs:
            - name: react-redux-badges-repo
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
```

### `out`: Nothing to do here....

Getting Started
---------------

Examples...

0. [Simple Example](examples/simple/README.md)
1. [Private Registry Example](examples/private-registry/README.md)

Credits:
========

* [projectfalcon/gradle-cache-resource](https://github.com/projectfalcon/gradle-cache-resource) We are following this resource to create our npm cache resource.

License
-------

See the [LICENSE file](LICENSE) for license text and copyright information.


