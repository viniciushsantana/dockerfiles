## Hugo
A Fast and Flexible Static Site Generator built in Go.

### Tags
* `0.32.2`, `latest` ([0.32.2/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.32.2/Dockerfile))
* `0.32.1` ([0.32.1/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.32.1/Dockerfile))
* `0.32` ([0.32/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.32/Dockerfile))
* `0.31.1` ([0.31.1/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.31.1/Dockerfile))

### Usage

**Generating static website**
```
docker run --rm -it -v $(pwd):/app vegbrasil/hugo:latest
```

**Running HTTP server**

```
docker run --rm -it -v $(pwd):/app -p 1313:1313 vegbrasil/hugo:latest serve --bind=0.0.0.0
```