# Hugo
A Fast and Flexible Static Site Generator built in Go.

## Tags
* `0.31.1`, `latest` ([0.31.1/Dockerfile](https://github.com/vegbrasil/dockerfiles/tree/master/hugo/0.31.1/Dockerfile))

## Usage

**Generating static website**
```
docker run --rm -it -v $(pwd):/app vegbrasil/hugo:latest
```

**Serving HTTP server**

```
docker run --rm -it -v $(pwd):/app -p 1313:1313 vegbrasil/hugo:latest serve --bind=0.0.0.0
```