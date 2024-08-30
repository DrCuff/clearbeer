FROM registry.fedoraproject.org/fedora:latest

LABEL org.opencontainers.image.source="https://github.com/drcuff/clearbeer" \
      org.opencontainers.image.title="clearbeer" \
      org.opencontainers.image.description="podman clearbeer" \
      org.label-schema.docker.cmd="podman-compose up -d" \
      maintainer="James Cuff"


# Don't include container-selinux and remove
# directories used by yum that are just taking
# up space.
RUN dnf -y update; yum -y reinstall shadow-utils; \
yum -y install podman fuse-overlayfs --exclude container-selinux; \
rm -rf /var/cache /var/log/dnf* /var/log/yum.*

RUN useradd podman; \
echo podman:10000:5000 > /etc/subuid; \
echo podman:10000:5000 > /etc/subgid;

RUN chown podman:podman -R /home/podman


#jcuff@amdmini:~/clearbeer$ podman run --privileged -it localhost/clearbeer bash
#[root@650b447f387a /]# podman ps
#CONTAINER ID  IMAGE       COMMAND     CREATED     STATUS      PORTS       NAMES
