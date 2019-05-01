#!/bin/bash

# Build
docker build -t gymreklab/cse185-course-docker .

# Test
docker run -it gymreklab/cse185-course-docker /bin/bash

# Push
docker push gymreklab/cse185-course-docker

# Make stable
docker build -t gymreklab/cse185-course-docker:stable .
docker push gymreklab/cse185-course-docker:stable
