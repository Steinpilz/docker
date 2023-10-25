docker run --rm $(docker build -q .) \
  /bin/sh -c \
  " \
  dotnet workload list; \
  sdkmanager --version; \
  "