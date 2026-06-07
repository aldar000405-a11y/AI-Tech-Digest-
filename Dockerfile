FROM n8nio/n8n:latest-debian

USER root

RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    python3 \
    python3-pip \
    curl \
    bash \
    && pip3 install edge-tts --break-system-packages \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "ALL INSTALLED OK"

USER node

EXPOSE 10000
