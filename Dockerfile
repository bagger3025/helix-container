FROM ubuntu:24.04

ARG TARGETARCH

RUN apt update && apt upgrade -y && \
  apt install curl software-properties-common make build-essential vim \
  valgrind git wget clangd python3-pip black -y

RUN (curl -LsSf https://astral.sh/uv/install.sh | sh) && \
  /root/.local/bin/uv tool install ruff@latest && \
  (curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y) && \
  /root/.cargo/bin/rustup component add rust-analyzer

RUN \
  if [ "$TARGETARCH" = "arm64" ]; then \
    wget https://github.com/helix-editor/helix/releases/download/25.07.1/helix-25.07.1-aarch64-linux.tar.xz -O /tmp/helix.tar.xz; \
    tar -xvf /tmp/helix.tar.xz -C /tmp; \
    mv /tmp/helix-25.07.1-aarch64-linux /tmp/helix; \
  else \
    wget https://github.com/helix-editor/helix/releases/download/25.07.1/helix-25.07.1-x86_64-linux.tar.xz -O /tmp/helix.tar.xz; \
    tar -xvf /tmp/helix.tar.xz -C /tmp; \
    mv /tmp/helix-25.07.1-x86_64-linux /tmp/helix; \
  fi

WORKDIR /tmp/helix

RUN mkdir -p /root/.config/helix && cp ./hx /usr/bin && cp -r ./runtime/ /root/.config/helix && rm -rf /tmp/helix
COPY ./config.toml ./languages.toml /root/.config/helix/

WORKDIR /root

CMD ["/bin/bash"]

