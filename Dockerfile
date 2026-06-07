FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --no-cache-dir edge-tts

ENV N8N_COMMUNITY_PACKAGES_ENABLED=true

USER node
