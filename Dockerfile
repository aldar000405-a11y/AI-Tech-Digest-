# ============================================================
# n8n على Ubuntu مع npm - الحل الأضمن
# يدعم ffmpeg و edge-tts وكل الأدوات الإضافية
# ============================================================

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV N8N_PORT=10000
ENV PORT=10000
ENV N8N_RUNNERS_ENABLED=false
ENV N8N_PROTOCOL=https

# تثبيت كل الاعتماديات
RUN apt-get update && \
    apt-get install -y \
    curl \
    ffmpeg \
    python3 \
    python3-pip \
    python3-venv \
    build-essential \
    g++ \
    make \
    git \
    ca-certificates \
    tzdata \
    && pip3 install --no-cache-dir edge-tts \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g n8n@2.25.5 \
    && apt-get remove -y build-essential g++ make \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /root/.npm

# إنشاء مجلد العمل
WORKDIR /home/node/.n8n

EXPOSE 10000

CMD ["n8n", "start"]
