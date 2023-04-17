# cse185-course-docker
Dockerfile for UCSD course CSE185 (Advanced Bioinformatics Laboratory)

To update:
```
# Test that it builds
docker build .

# Commit and push changes to github

# Make an sp23 tag
git tag sp23; git push origin sp23

# To replace
git -d sp23; git push ---delete origin sp23
git tag sp23; git push origin sp23
```

See images here: https://github.com/ucsd-ets/cse185-notebook/pkgs/container/cse185-notebook
