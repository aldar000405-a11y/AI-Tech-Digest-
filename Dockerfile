FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    curl \
    bash

RUN pip3 install edge-tts --break-system-packages

RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node

EXPOSE 5678

CMD ["n8n", "start"]
