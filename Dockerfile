FROM n8nio/n8n:1.94.1

USER root

RUN apt-get update -o Acquire::Check-Valid-Until=false \
    -o Acquire::AllowInsecureRepositories=true \
    -o APT::Get::AllowUnauthenticated=true \
    && apt-get install -y --no-install-recommends \
    ffmpeg \
    python3 \
    python3-pip \
    curl \
    && pip3 install edge-tts --break-system-packages \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "ALL INSTALLED OK"

USER node

EXPOSE 10000
