# الحل الأفضل: استخدام الصورة الرسمية مباشرة
FROM docker.n8n.io/n8nio/n8n:latest

# المتغيرات البيئية
ENV N8N_PORT=10000
ENV PORT=10000
ENV N8N_RUNNERS_ENABLED=false
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_PROTOCOL=https

# تثبيت الأدوات الإضافية التي تحتاجها
USER root
RUN apk add --no-cache ffmpeg python3 py3-pip build-base g++ make \
    && pip3 install edge-tts \
    && apk del build-base g++ make

# العودة لمستخدم node الافتراضي
USER node

EXPOSE 10000

CMD ["n8n", "start"]
