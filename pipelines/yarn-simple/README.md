Simple Example
==============

a simple pipeline example with yarn support

Getting Started
---------------

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
    -p yarn-simple-pipeline \
    -n
    
fly -t localhost unpause-pipeline -p yarn-simple-pipeline
```

If you want destroy it:

```
fly -t localhost destroy-pipeline -p yarn-simple-pipeline
```
