FROM node:20-slim
USER root
RUN apt-get update && apt-get install -y python3 python3-pip ffmpeg curl && pip3 install yt-dlp --break-system-packages
RUN npm install -g n8n
EXPOSE 5678
CMD ["n8n", "start"]
