npm-cache-resource examples
==================

a Concourse resource for caching dependencies examples

Development Machine Requirements
--------------------------------

In order for the build to run correctly, a few tools will need to be installed on your
development machine:

* Docker
* Docker-compose

Getting Started
---------------

Choose your example...: 

Run the following to generate the necessary keys:
```
make deps
```

Running The Build
-----------------

## Linux
### Simple Concourse cases
```
make run-simple-linux
```

### Private registry Concourse cases
```
make run-private-registry-linux
```

## OSX
### Simple Concourse cases
```
make run-simple-osx
```

### Private registry Concourse cases
```
make run-private-registry-osx
```

Next, browse to your configured external URL (probably 127.0.0.1:8080 or 192.168.99.100:8080) and log in with the username **concourse** and password **changeme**.

[More info here...](https://concourse.ci/single-page.html#docker-repository)

Pipelines examples...

0. [Simple Example](pipelines/simple/README.md)
1. [Bower Simple Example](pipelines/bower-simple/README.md)
2. [Yarn Simple Example](pipelines/yarn-simple/README.md)
3. [Private Registry Example](pipelines/private-registry/README.md)
4. [Private Repo Example](pipelines/private-repo/README.md)

License
-------

See the [LICENSE file](LICENSE) for license text and copyright information.
