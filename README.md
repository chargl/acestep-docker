# ACE-Step Docker (NVIDIA GPU Only)

This repository provides a ready-to-use Docker environment for running [ACE-Step](https://github.com/ace-step/ACE-Step) with full GPU acceleration (NVIDIA only). It exposes the ACE-Step graphical interface on port **7865**, allowing you to generate speech samples directly from your browser.

> **Note:** This Docker setup is built and tested exclusively for **NVIDIA GPUs** using the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html). Other hardware vendors (AMD/Intel) are currently unsupported in this container. For AMD/Intel users, the [ComfyUI integration](https://huggingface.co/ACE-Step/ACE-Step-v1-3.5B/discussions/7) may offer an alternative method to run ACE-Step models.

---

## Features

- Prebuilt Dockerfile with all dependencies (Ubuntu 24.04 + Python 3.12)
- GPU acceleration via PyTorch (CUDA 12.9 nightly)
- Automatic model checkpoint downloading on first generation
- Persistent volume mounts for outputs and model cache
- GUI served at `http://localhost:7865`

---

## Prerequisites

Before getting started, make sure your system has:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

Note: the NVIDIA Container Toolkit may be included in a Docker Desktop install.

To verify GPU access inside Docker:

```bash
docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
```

---

## Getting Started

1. Clone this repository
```bash
git clone https://github.com/chargl/acestep-docker.git
cd acestep-docker
```

2. Build the docker image
```bash
docker compose build
```

3. Start the container
```bash
docker compose up
```
or, for detached mode
```bash
docker compose up -d
```

4. Access the ACE-Step GUI at http://localhost:7865

5. To stop the container
```bash
docker compose down
```

---

## Mounted volumes

This container mounts two important folders for persistence:

| Host Path         | Container Path                                | Purpose                  |
|-------------------|-----------------------------------------------|--------------------------|
| `./outputs/`      | `/app/outputs/`                               | Generated audio files    |
| `./checkpoints/`  | `/home/ubuntu/.cache/ace-step/checkpoints/`   | Model checkpoint cache   |

**No manual model download required.** The correct ACE-Step checkpoint is automatically fetched the first time you generate audio.

---

## What About AMD or Intel GPUs?

This container is [not compatible with AMD or Intel GPUs](https://huggingface.co/ACE-Step/ACE-Step-v1-3.5B/discussions/7).

You may find success using ACE-Step through ComfyUI instead.

---

## Licensing

- This repository is provided under the [MIT License](./LICENSE).
- The ACE-Step project is developed by @ace-step and licensed under the [Apache License 2.0](https://github.com/ace-step/ACE-Step/blob/main/LICENSE).
- See the [ACE-Step GitHub repository](https://github.com/ace-step/ACE-Step) for more information and documentation.

---

## Acknowledgements

- [ACE-Step](https://github.com/ace-step/ACE-Step): High-quality speech generation models and GUI by the ACE-Step team.