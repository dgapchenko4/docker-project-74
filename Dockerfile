FROM node:20.12.2

WORKDIR /app

# Копируем package.json из директории app
COPY app/package*.json ./
RUN npm install

# Копируем всё остальное из app
COPY app/. .

CMD ["make", "test"]
