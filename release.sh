#/bin/sh

options=$(getopt -o br --long service: -- "$@")
[ $? -eq 0 ] || { echo "Incorrect options provided"; exit 1; }
eval set -- "$options"
SERVICE=runtime
while true; do
    case "$1" in
        -r) ;;
        -b) SERVICE=buildstage ;;
        --service)
            shift
            SERVICE=$1
            ;;
        --)
            shift
            break
            ;;
    esac
    shift
done

docker-compose -f .devcontainer/docker-compose-release.yml run --rm --service-ports ${SERVICE}

