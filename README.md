npm-cache-resource
==================

What is it?
-----------

a Concourse resource for caching dependencies downloaded by NPM

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


