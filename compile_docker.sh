#!/bin/bash

# Build
docker build --no-cache -t gymreklab/cse185-course-docker .

# Test
docker run -it gymreklab/cse185-course-docker /bin/bash

# Push
docker push gymreklab/cse185-course-docker
