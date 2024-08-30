FROM ruby:3.3

LABEL org.opencontainers.image.source="https://github.com/drcuff/clearbeer" \
      org.opencontainers.image.title="clearbeer" \
      org.opencontainers.image.description="podman clearbeer" \
      org.label-schema.docker.cmd="podman-compose up -d" \
      maintainer="James Cuff"

RUN useradd -m -s /bin/bash linuxbrew && \
    usermod -aG sudo linuxbrew &&  \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew /home/linuxbrew/.linuxbrew && \
    echo "linuxbrew:10000:5000" > /etc/subuid && \
    echo "linuxbrew:10000:5000" > /etc/subgid

RUN apt update
RUN apt install -y uidmap slirp4netns sudo
RUN chmod 4755 /usr/bin/newgidmap
RUN chmod 4755 /usr/bin/newuidmap


USER linuxbrew

RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash 
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
RUN brew update
RUN brew install podman
RUN /home/linuxbrew/.linuxbrew/opt/podman/bin/podman system service --time\=0


# Warning: podman provides a service which can only be used on macOS or systemd!
# You can manually execute the service instead with:
#  /home/linuxbrew/.linuxbrew/opt/podman/bin/podman system service --time\=0
# COMMIT
# --> 763159a6e527
# 763159a6e5272167d453500c81085ea0e15fb7b906a281daee876c5a3230bd9b

# remove all images:

# jcuff@amdmini:~/clearbeer$ podman rmi -a -f


