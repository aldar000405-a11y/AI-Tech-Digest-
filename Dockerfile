FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    curl \
    bash \
    && pip3 install edge-tts --break-system-packages \
    && echo "edge-tts installed successfully"

USER node

EXPOSE 10000
