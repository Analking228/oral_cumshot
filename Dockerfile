FROM ubuntu:24.04

# Обновляем пакеты и устанавливаем Nginx
RUN apt-get update && \
    apt-get install -y nginx net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Создаем директорию для статических файлов
RUN mkdir -p /data/images
COPY ./ansible/roles/nginx/img/VFfoCsO.jpeg /data/images

# Копируем конфигурацию Nginx
COPY ./ansible/roles/nginx/templates/nginx.conf /etc/nginx/nginx.conf

# Открываем порт 80 для HTTP
EXPOSE 80 22

# Запускаем Nginx в foreground режиме
CMD ["nginx", "-g", "daemon off;"]