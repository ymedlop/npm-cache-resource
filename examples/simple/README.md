Simple Example
==============

a simple pipeline example

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

Next, browse to your configured external URL (probably 127.0.0.1:8080 or 192.168.99.100:8080) and log in with the username **concourse** and password **changeme**.

[More info here...](https://concourse.ci/single-page.html#docker-repository)

Upgrade or set pipeline
-----------------------

For override our pipelines and pipelines config, we have to run:

```
fly -t localhost login -k -c http://localhost:8080
```

The login command will give you a link to click, and after you've gone through the OAuth flow it will print an OAuth token on the page that you can then then copy and paste into the prompt.

In either case, a token is saved in your ~/.flyrc, which will expire after one day. For then the rest of this day we can use this command:

Example with private-registry-pipeline:

```
fly -t localhost set-pipeline \
    -c example-pipeline.yml \
    -p simple-pipeline \
    -n
    
fly -t localhost unpause-pipeline -p simple-pipeline
```

If you want destroy it:

```
fly -t localhost destroy-pipeline -p simple-pipeline
```
