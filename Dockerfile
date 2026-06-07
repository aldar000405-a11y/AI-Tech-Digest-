FROM n8nio/n8n:1.99.1-debian

USER root

RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    python3 \
    python3-pip \
    curl \
    bash && \
    pip3 install --break-system-packages edge-tts && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER node

EXPOSE 5678
