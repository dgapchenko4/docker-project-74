FROM node:20.12.2

WORKDIR /app

COPY app/package*.json ./
RUN npm install

COPY app/. .

# Отладка: показать, что скопировалось
RUN echo "=== Contents of /app/__tests__ ===" && ls -la /app/__tests__/ || echo "__tests__ not found"

CMD ["make", "test"]
