[![](https://images.microbadger.com/badges/image/ymedlop/npm-cache-resource.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/ymedlop/npm-cache-resource.svg)](https://microbadger.com/images/ymedlop/npm-cache-resource "Get your own version badge on microbadger.com")

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

* `<<:`: the source is the same as the corresponding git resource

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
            source: {repository: mhart/alpine-node, tag: "6"}

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
                cp -R cache/node_modules src
                cd src && npm test
```

### `out`: Nothing to do here....


Development Machine Requirements
--------------------------------

In order for the build to run correctly, a few tools will need to be installed on your
development machine:

* Docker
* Docker-compose


Getting Started
---------------

Run the following to generate the necessary keys:
```
mkdir -p keys/web keys/worker

ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N ''
ssh-keygen -t rsa -f ./keys/web/session_signing_key -N ''

ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''

cp ./keys/worker/worker_key.pub ./keys/web/authorized_worker_keys
cp ./keys/web/tsa_host_key.pub ./keys/worker
```


Running The Build
-----------------

```
docker-compose up
```

Next, browse to your configured external URL (probably 127.0.0.1:8080 or 192.168.99.100:8080) and log in with the username concourse and password changeme.

[More info here...](https://concourse.ci/single-page.html#docker-repository)


Credits:
========

* [projectfalcon/gradle-cache-resource](https://github.com/projectfalcon/gradle-cache-resource) We are following this resource to create our npm cache resource.


