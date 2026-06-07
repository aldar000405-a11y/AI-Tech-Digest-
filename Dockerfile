FROM node:18-bullseye-slim

RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    python3 \
    python3-pip \
    curl \
    bash \
    && pip3 install edge-tts \
    && npm install -g n8n \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 10000

CMD ["n8n", "start"]
