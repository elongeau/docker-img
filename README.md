# Docker Images

## Images
### img-scala

contains an image to run `sbt`. To run the image :

Once in the container

1. cd to `/root/projects/<the scala project>`
2. `sbt ~test`

### img-data

A container to hold data :

* scala sources
* scala dependencies (in `/root/.sbt` and `/root/.ivy2`)

## Run all

1. my-data :

```bash
        docker run --name my-data my-data true
```

2. share image with windows :

```bash
        docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/s
amba my-data
```

3. container with sbt

```bash
         docker run --rm -ti --volumes-from my-data elongeau/scala bash
```

