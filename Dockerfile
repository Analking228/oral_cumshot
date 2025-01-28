FROM ubuntu:24.04

# Обновляем пакеты и устанавливаем Nginx
RUN apt-get update && \
    apt-get install -y net-tools vim openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -r penetrator && useradd -r -g penetrator penetrator
USER penetrator
WORKDIR /home/penetrator
RUN ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

# Reset user to root
USER root

COPY ./id_rsa.pub .ssh/authorized_keys

# Открываем порт 80 для HTTP
EXPOSE 80 22

CMD ["/usr/sbin/sshd", "-D"]