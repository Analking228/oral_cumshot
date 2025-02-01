FROM ubuntu:24.04

# Обновляем пакеты и устанавливаем Nginx
RUN apt-get update && \
    apt-get install -y net-tools vim openssh-server && \
    apt-get clean && \
    mkdir -p /run/sshd && \
    mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    echo "PermitRootLogin yes" > /etc/ssh/sshd_config && \
    echo "PubkeyAuthentication yes" > /etc/ssh/sshd_config && \
    # sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    rm -rf /var/lib/apt/lists/*

COPY id_container.pub /root/.ssh/authorized_keys

# Открываем порт 80 для HTTP
EXPOSE 80 22

CMD ["/usr/sbin/sshd", "-D"]