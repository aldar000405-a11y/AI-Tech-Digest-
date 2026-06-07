FROM n8nio/n8n:latest

USER root

RUN apk update && \
    apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    curl \
    bash && \
    pip3 install --break-system-packages edge-tts

USER node

EXPOSE 5678
