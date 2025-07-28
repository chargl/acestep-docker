FROM ubuntu:24.04

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive \
    PORT=7865 \
    HF_HUB_ENABLE_HF_TRANSFER=1 \
    ACE_OUTPUT_DIR=/app/outputs

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        python3.12  \
        python3-pip  \
        python3-dev \
        build-essential \
        git \
        curl \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /usr/lib/python3.12/EXTERNALLY-MANAGED

USER ubuntu
ENV PATH="/home/ubuntu/.local/bin:$PATH"
WORKDIR /app

RUN pip3 install --no-cache-dir --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu129 && \
    pip3 install --no-cache-dir hf_transfer pef && \
    mkdir -p /home/ubuntu/.cache/matplotlib

RUN git clone --depth 1 https://github.com/ace-step/ACE-Step.git . && \
    pip3 install --no-cache-dir -e .


EXPOSE 7865

ENTRYPOINT ["python3", "./acestep/gui.py", "--server_name", "0.0.0.0", "--bf16", "true", "--torch_compile", "True"]
