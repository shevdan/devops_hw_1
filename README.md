# Sample application

This is a sample application to visualize dependency between objects. 

Creates Web Ui on 8050 port once ran. 

It utilizes docker multi-stage build to reduce size of the docker image and increase security.


## How to run

```
docker pull shevdan/multistage_simple_app_test:initial
```

```
docker run -d -p 8051:8050 -t shevdan/multistage_simple_app_test:initial
```

## How to access

Access Web UI on 8050 port. 
