#/bin/sh

CONTAINER_ID="$(docker ps -q -f=name=dev_env)"
if [ -n "$CONTAINER_ID" ]; then
    docker exec -it -u 1000:1000 $CONTAINER_ID /bin/bash
else
    docker-compose -f .devcontainer/docker-compose.yml \
                   run --rm -u 1000 --workdir="/app" --service-ports dev /bin/bash

## (Reference) Do the same thing with plain docker command
#   docker run -it --rm \
#          --name vscode_devcontainer_dev \
#          -v $PWD/volume/home/developer:/home/developer \
#          -v ~/.gitconfig:/home/developer/.gitconfig \
#          -v $PWD/volume/home/build:/home/build \
#          -v $PWD/volume/app:/app \
#          --workdir="/app" \
#          -u 1000:1000 \
#          mcr.microsoft.com/dotnet/core/sdk:2.2 \
#          /bin/bash
fi

## Usage of developer console
# ex. MVC template
# > dotnet new mvc --language F# --name WebAppMVC --output WebAppMVC
#
# ex. REPL
# > dotnet fsi

