# Usage

## First iteration

### 1. Create new project (ex. WebAppMVC)
```
$ ./open-dev-console.sh
root@957b18bdb28a:/app# dotnet new mvc --language F# --name WebAppMVC --output WebAppMVC
```

### 2. Edit `PRJ` environment variable in `.devcontainer/docker-compose-release.env`
  ```
  PRJ=WebAppMVC
  ```

### 3. Build project
```
$ ./release.sh -b
```

Published projects are located at `volume/home/build/WebAppMVC` .

### 4. Run
```
$ ./release.sh
```
Access to `http://localhost:8001`, you'll get welcome message.
<details>

```
$ docker ps
CONTAINER ID  IMAGE                 COMMAND           CREATED    STATUS    PORTS                 NAMES
957b18bdb28a  devcontainer_runtime  "sleep infinity"  5 min ago  Up 3 min  0.0.0.0:8001->80/tcp  devcontainer_runtime_run_fc2a41765933

$ docker inspect 957b18bdb28a| grep IPAddress
            "SecondaryIPAddresses": null,
                        "IPAddress": "",
                                            "IPAddress": "172.20.0.2",
```
</details>

## Subsequent iteration process

### 5. Visual Studio Code with [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extention
- `Ctrl-P` &rarr; `>Remote-Containers: Open Folder in Container...`
  * Select the root of this git tree from File Open Dialog.
  * Automatically, VS Code find `.devcontainer/docker-compose.yml` and start communication with a docker container(named `dotnet-core-dev`).

### 6. Edit source code

### 7. Build & Run

```
$ ./release.sh -b && ./release.sh
```

