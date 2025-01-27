FROM ubuntu:24.04

# Обновляем пакеты и устанавливаем Nginx
RUN apt-get update && \
    apt-get install -y nginx net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Создаем директорию для статических файлов
RUN mkdir -p /data/images

# Открываем порт 80 для HTTP
EXPOSE 80 22

# Запускаем Nginx в foreground режиме
RUN '/usr/sbin/sshd -D'
CMD ["nginx", "-g", "daemon off;"]