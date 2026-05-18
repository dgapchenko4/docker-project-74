FROM node:20.12.2

# Устанавливаем Python и build-инструменты (на GitHub это сработает)
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app/package*.json ./
RUN npm ci --no-audit --no-fund || npm install --no-audit --no-fund

COPY app/. .

CMD ["make", "test"]
