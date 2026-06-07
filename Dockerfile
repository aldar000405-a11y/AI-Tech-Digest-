FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV N8N_PORT=10000
ENV PORT=10000
ENV N8N_RUNNERS_ENABLED=false

RUN apt-get update && \
    apt-get install -y \
    curl \
    ffmpeg \
    python3 \
    python3-pip \
    build-essential \
    g++ \
    make \
    && pip3 install edge-tts \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g n8n@2.21.7 --ignore-scripts \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "ALL DONE"

EXPOSE 10000

CMD ["n8n", "start"]
