## Build
```sh
docker build -t vector-objects .
```
## Run
```sh
docker container run -it --rm -p 8889:8889 -v $(pwd):/code vector-objects
```