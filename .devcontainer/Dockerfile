ARG TAG=2.2
ARG UID=1000

## For development
FROM mcr.microsoft.com/dotnet/core/sdk:${TAG} AS dev
ARG UID
RUN echo '#!/bin/bash\ndotnet fsi' > /usr/bin/fsharpi \
    && chmod +x /usr/bin/fsharpi
RUN groupadd -g ${UID} developer \
    && useradd --no-log-init -u ${UID} -g developer -s /bin/bash -d /root developer
# Volumes may be mounted by docker-compose.yml
USER developer
WORKDIR /app

## For build
FROM mcr.microsoft.com/dotnet/core/sdk:${TAG} AS build
ARG UID
RUN groupadd -g ${UID} developer \
    && useradd --no-log-init -u ${UID} -g developer -s /bin/bash -d /home/build build
USER build
ENTRYPOINT ["sh", "-c", "cd /app/${PRJ} && dotnet publish -c Release -o /home/build/${PRJ}"]

## For runtime
FROM mcr.microsoft.com/dotnet/core/aspnet:${TAG} AS runtime
WORKDIR /home/build
ENTRYPOINT ["sh", "-c", "dotnet ${PRJ}/${PRJ}.dll"]
