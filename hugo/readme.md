## Hugo

A Fast and Flexible Static Site Generator built in Go.

### Tags

#### Alpine 3.8

* `0.47.1`, `latest` ([0.47.1/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.47.1/Dockerfile))

#### Alpine 3.7

* `0.36` ([0.36/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.36/Dockerfile))
* `0.35` ([0.35/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.35/Dockerfile))
* `0.34` ([0.34/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.34/Dockerfile))
* `0.33` ([0.33/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.33/Dockerfile))
* `0.32.4` ([0.32.4/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.32.4/Dockerfile))
* `0.32.3` ([0.32.3/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.32.3/Dockerfile))
* `0.32.2` ([0.32.2/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.32.2/Dockerfile))
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