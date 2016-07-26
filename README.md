Maven Base Container (Work In Progress)
============================

### Introduction
The Maven base container can be used as a starting point for containers that need to 
build something using Maven [ https://maven.apache.org/ ]

It speeds up the project build time by giving you an already built container capable
of running Maven commands and processing POM files.

### To Build
```
docker build -t ${imageName} ./
```

### To Run (peek inside)
```
docker run -i -t --entrypoint /bin/bash ${imageName}
```

### To Run Maven commands
```
e.g. something like: docker run -i -t --entrypoint maven install -v /path/to/src:/opt/
```