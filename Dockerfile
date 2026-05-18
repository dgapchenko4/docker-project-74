FROM node:20.12.2

# Устанавливаем Python и build-инструменты
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

# Устанавливаем Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/v2.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

WORKDIR /app

COPY app/package*.json ./
RUN npm ci --no-audit --no-fund

COPY app/. .
RUN npm run build

CMD ["npm", "start"]