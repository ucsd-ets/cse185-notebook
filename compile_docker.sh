#!/bin/bash

# Build
docker build -t gymreklab/cse185-course-docker .

# Test
docker run -it gymreklab/cse185-course-docker /bin/bash
