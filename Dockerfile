FROM ubuntu:24.04

# Обновляем пакеты и устанавливаем Nginx
RUN apt-get update && \
    apt-get install -y net-tools vim openssh-server && \
    mkdir -p /run/sshd \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ~/.ssh/id_rsa.pub /root/.ssh/authorized_keys

# Открываем порт 80 для HTTP
EXPOSE 80 22

CMD ["/usr/sbin/sshd", "-D"]