FROM node:20.12.2

WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY app/package*.json ./
RUN npm install --verbose

# Копируем весь код
COPY app/. .

# Убеждаемся, что зависимости установлены
RUN ls -la node_modules/.bin/sequelize || npm install --verbose

CMD ["make", "test"]
