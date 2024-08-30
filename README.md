# clearbeer

podman in podman in podman?

```
jcuff@amdmini:~/clearbeer$ podman build -t clearbeer .
STEP 1/5: FROM registry.fedoraproject.org/fedora:latest
Trying to pull registry.fedoraproject.org/fedora:latest...
Getting image source signatures
Copying blob 692b311ac241 done   | 

jcuff@amdmini:~/clearbeer$ podman images
REPOSITORY                         TAG         IMAGE ID      CREATED         SIZE
localhost/clearbeer                latest      627c84680280  21 seconds ago  547 MB
registry.fedoraproject.org/fedora  latest      9448a418a92a  9 hours ago     233 MB
docker.io/library/ruby             3.3         94de028496f4  7 weeks ago     1.02 GB

jcuff@amdmini:~/clearbeer$ podman run -it localhost/clearbeer bash
[root@1a9273cb74ac /]# podman ps
WARN[0000] Using rootless single mapping into the namespace. This might break some images. Check /etc/subuid and /etc/subgid for adding sub*ids if not using a network user 
CONTAINER ID  IMAGE       COMMAND     CREATED     STATUS      PORTS       NAMES
```

Let's go priv mode!  Put the same docker file in the docker file...

```
jcuff@amdmini:~/clearbeer$ podman run --privileged -it localhost/clearbeer bash
[root@6f38e1e8510b /]# vi /tmp/Dockerfile
[root@6f38e1e8510b /]# cd /tmp
[root@6f38e1e8510b tmp]# podman build -t clearbeer .


[root@6f38e1e8510b tmp]# podman images
REPOSITORY                         TAG         IMAGE ID      CREATED        SIZE
localhost/clearbeer                latest      96f04ec2ac8f  7 seconds ago  545 MB
registry.fedoraproject.org/fedora  latest      9448a418a92a  9 hours ago    233 MB

[root@6f38e1e8510b tmp]# podman run --privileged -it localhost/clearbeer bash

[root@f568c50efcd6 /]# uname -a
Linux f568c50efcd6 6.8.0-40-generic #40~22.04.3-Ubuntu SMP PREEMPT_DYNAMIC Tue Jul 30 17:30:19 UTC 2 x86_64 GNU/Linux

```

next up podman and homebrew in one

There's no need for any of this...

```
jcuff@amdmini:~/clearbeer$ podman build -t clearbeer .
STEP 1/10: FROM ruby:3.3
STEP 2/10: LABEL org.opencontainers.image.source="https://github.com/drcuff/clearbeer"       org.opencontainers.image.title="clearbeer"       org.opencontainers.image.description="podman clearbeer"       org.label-schema.docker.cmd="podman-compose up -d"       maintainer="James Cuff"
--> Using cache 3cbd5bb99805f569395e6e3f34295b12f6f4d0d7f7f832aa66970661491265db
--> 3cbd5bb99805
STEP 3/10: RUN useradd -m -s /bin/bash linuxbrew &&     usermod -aG sudo linuxbrew &&      mkdir -p /home/linuxbrew/.linuxbrew &&     chown -R linuxbrew: /home/linuxbrew/.linuxbrew
--> Using cache 3ead49ca5d234a5c9247dde394a376ee18ae3b7a9905782b1b7799ea48426625
--> 3ead49ca5d23
STEP 4/10: RUN apt update
--> Using cache 8cf3a1e9a0d3de9d0a90875144a70fe72b37ddc3dbb21ed5583fac9024f53e4d
--> 8cf3a1e9a0d3
STEP 5/10: RUN apt install -y uidmap slirp4netns

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libslirp0 libsubid4
The following NEW packages will be installed:
  libslirp0 libsubid4 slirp4netns uidmap
0 upgraded, 4 newly installed, 0 to remove and 5 not upgraded.
Need to get 501 kB of archives.
After this operation, 921 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bookworm/main amd64 libslirp0 amd64 4.7.0-1 [63.0 kB]
Get:2 http://deb.debian.org/debian bookworm/main amd64 libsubid4 amd64 1:4.13+dfsg1-1+b1 [211 kB]
Get:3 http://deb.debian.org/debian bookworm/main amd64 slirp4netns amd64 1.2.0-1 [37.5 kB]
Get:4 http://deb.debian.org/debian bookworm/main amd64 uidmap amd64 1:4.13+dfsg1-1+b1 [189 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 501 kB in 0s (7979 kB/s)
Selecting previously unselected package libslirp0:amd64.
(Reading database ... 23243 files and directories currently installed.)
Preparing to unpack .../libslirp0_4.7.0-1_amd64.deb ...
Unpacking libslirp0:amd64 (4.7.0-1) ...
Selecting previously unselected package libsubid4:amd64.
Preparing to unpack .../libsubid4_1%3a4.13+dfsg1-1+b1_amd64.deb ...
Unpacking libsubid4:amd64 (1:4.13+dfsg1-1+b1) ...
Selecting previously unselected package slirp4netns.
Preparing to unpack .../slirp4netns_1.2.0-1_amd64.deb ...
Unpacking slirp4netns (1.2.0-1) ...
Selecting previously unselected package uidmap.
Preparing to unpack .../uidmap_1%3a4.13+dfsg1-1+b1_amd64.deb ...
Unpacking uidmap (1:4.13+dfsg1-1+b1) ...
Setting up libsubid4:amd64 (1:4.13+dfsg1-1+b1) ...
Setting up libslirp0:amd64 (4.7.0-1) ...
Setting up slirp4netns (1.2.0-1) ...
Setting up uidmap (1:4.13+dfsg1-1+b1) ...
Processing triggers for libc-bin (2.36-9+deb12u7) ...
--> c5a08cd977ba
STEP 6/10: USER linuxbrew
--> 0f6c798a4a22
STEP 7/10: RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash 
Warning: Running in non-interactive mode because `stdin` is not a TTY.
==> Checking for `sudo` access (which may request your password)...
==> This script will install:
/home/linuxbrew/.linuxbrew/bin/brew
/home/linuxbrew/.linuxbrew/share/doc/homebrew
/home/linuxbrew/.linuxbrew/share/man/man1/brew.1
/home/linuxbrew/.linuxbrew/share/zsh/site-functions/_brew
/home/linuxbrew/.linuxbrew/etc/bash_completion.d/brew
/home/linuxbrew/.linuxbrew/Homebrew
==> The following new directories will be created:
/home/linuxbrew/.linuxbrew/bin
/home/linuxbrew/.linuxbrew/etc
/home/linuxbrew/.linuxbrew/include
/home/linuxbrew/.linuxbrew/lib
/home/linuxbrew/.linuxbrew/sbin

```

Time passes...

```
==> Summary
🍺  /home/linuxbrew/.linuxbrew/Cellar/podman/5.2.2: 262 files, 134.4MB
==> Running `brew cleanup podman`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).

==> Caveats
==> podman
Warning: podman provides a service which can only be used on macOS or systemd!
You can manually execute the service instead with:
  /home/linuxbrew/.linuxbrew/opt/podman/bin/podman system service --time\=0
COMMIT clearbeer
--> 67962d7975a2
Successfully tagged localhost/clearbeer:latest
67962d7975a21aee95cb915ee20f293f8d7579d67ae591c4167a926a7a409f14
```
