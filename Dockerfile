# ============================================================
# حل المشكلة 1: استخدام Docker Hub بدلاً من docker.n8n.io
# حل المشكلة 2: استخدام إصدار محدد بدلاً من latest
# ============================================================

FROM n8nio/n8n:2.25.5

# المتغيرات البيئية
ENV N8N_PORT=10000
ENV PORT=10000
ENV N8N_RUNNERS_ENABLED=false
ENV N8N_PROTOCOL=https
ENV N8N_BASIC_AUTH_ACTIVE=true

# تثبيت الأدوات الإضافية (ffmpeg, edge-tts)
USER root
RUN apk add --no-cache ffmpeg python3 py3-pip build-base g++ make \
    && pip3 install edge-tts \
    && apk del build-base g++ make

# العودة لمستخدم node الافتراضي (للأمان)
USER node

EXPOSE 10000

CMD ["n8n", "start"]
