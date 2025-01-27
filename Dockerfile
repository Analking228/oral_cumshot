FROM ubuntu:24.04

# Установка openssh-server и настройка SSH
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


EXPOSE 22 80

CMD ["/usr/sbin/sshd", "-D"]