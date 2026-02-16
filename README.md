# Helix Container

Just containing only for Rust and [Helix Editor](https://helix-editor.com/)

Docker image is uploaded to [bagger3025/helix-container](https://hub.docker.com/r/bagger3025/helix-container)

## Quick Start

```bash
docker run -it bagger3025/helix-container bash
```

## Docker compose

```bash
docker compose up -d --build
```

## Docker Buildx

To build multi platform (currently `amd64` and `arm64`),

```bash
chmod +x docker_buildx_command.sh
./docker_buildx_command.sh
```

This script file contains image push to `bagger3025/helix-container`

## Installed

- Rust
  - rustup
- C, C++
  - clangd
- Python
  - uv
  - black
  - ruff
