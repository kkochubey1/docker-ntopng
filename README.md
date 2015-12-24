ntopng-docker
=============

## ntopng Dock Builder

#### Install & Run
```
docker pull lucaderi/ntopng-docker
docker run --net=host -name ntopng -t -i ntop/ntopng-docker ntopng -v
```

```
docker run --name ntopng -ti -d -p 8080:8080 -p 9995:9995/udp ntopng -w 8080 -i tcp://127.0.0.1:5556
```
