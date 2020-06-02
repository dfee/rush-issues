# rush-issues

### Docker

Example below. Sub-in desired package-name for `PACKAGE_NAME` build-arg and `SCENARIO_NAME` build-arg.

Build:

```
docker build \
  -t rush-issues/service-a:0 \
  --build-arg PACKAGE_NAME=@rush-issues/service-a \
  --build-arg SCENARIO_NAME=service-a \
  .
```

Run:

```
docker run -it --rm -p 3000:3000 rush-issues/service-a:0
```
