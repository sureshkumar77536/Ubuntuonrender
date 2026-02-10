FROM ubuntu:22.04

# Basic tools aur SSH install kar rahe hain
RUN apt-get update && apt-get install -y openssh-server sudo wget curl python3

# Naya user 'admin' bana rahe hain jiska password 'admin123' hoga
RUN useradd -rm -d /home/admin -s /bin/bash -g root -G sudo -u 1000 admin
RUN echo 'admin:admin123' | chpasswd

# SSH setup
RUN mkdir /var/run/sshd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

# Ngrok install karna (Termius connection ke liye)
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
RUN tar -xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin

# Start script copy karna
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Render ka default port expose karna (Health check pass karne ke liye zaroori hai)
EXPOSE 10000

CMD ["/start.sh"]
