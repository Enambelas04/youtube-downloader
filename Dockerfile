FROM node:20-slim
USER root
RUN apt-get update && \
    apt-get install -y python3 python3-pip ffmpeg curl && \
    pip3 install yt-dlp --break-system-packages && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    yt-dlp --install-js-runtimes nodejs 2>/dev/null || true
COPY cookies.txt /root/cookies.txt
RUN npm install -g n8n
EXPOSE 5678
CMD ["n8n", "start"]
