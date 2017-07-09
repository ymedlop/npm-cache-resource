Private Registry Example
========================

A pipeline example where we have a private npm registry.


Getting Started
---------------

We need to update our pipeline variable file with our Sinopia ip using this script:

```
./update
```

For override our pipelines and pipelines config, we have to run:

```
fly -t localhost login -k -c http://localhost:8080
```

The login command will give you a link to click, and after you've gone through the OAuth flow it will print an OAuth token on the page that you can then then copy and paste into the prompt.

In either case, a token is saved in your ~/.flyrc, which will expire after one day. For then the rest of this day we can use this command:

Example with private-registry-pipeline:

```
fly -t localhost set-pipeline -c example-pipeline.yml -p private-registry-pipeline -l pipeline-variables.yml -n
    
fly -t localhost unpause-pipeline -p private-registry-pipeline
```

If you want destroy it:

```
fly -t localhost destroy-pipeline -p private-registry-pipeline
```
