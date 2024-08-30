# clearbeer
podman and homebrew in one

There's no need for any of this...

```
cuff@amdmini:~/clearbeer$ podman build -t clearbeer .
STEP 1/8: FROM ruby:3.3
Resolving "ruby" using unqualified-search registries (/home/linuxbrew/.linuxbrew/etc/containers/registries.conf)
Trying to pull docker.io/library/ruby:3.3...
Getting image source signatures
Copying blob 0d01fe7cfd1e done   | 
Copying blob 903681d87777 done   | 
Copying blob 6ed93aa58a52 done   | 
Copying blob 3cbbe86a28c2 done   | 
Copying blob 787c78da4383 done   | 
Copying blob 1cd9229db862 done   | 
Copying blob 41b75ad313a6 done   | 
Copying config 94de028496 done   | 
Writing manifest to image destination
STEP 2/8: LABEL org.opencontainers.image.source="https://github.com/drcuff/clearbeer"       org.opencontainers.image.title="clearbeer"       org.opencontainers.image.description="podman clearbeer"       org.label-schema.docker.cmd="podman-compose up -d"       maintainer="James Cuff"
--> 3cbd5bb99805
STEP 3/8: RUN useradd -m -s /bin/zsh linuxbrew &&     usermod -aG sudo linuxbrew &&      mkdir -p /home/linuxbrew/.linuxbrew &&     chown -R linuxbrew: /home/linuxbrew/.linuxbrew
useradd: Warning: missing or non-executable shell '/bin/zsh'
--> 1b9f3b632f6b
STEP 4/8: USER linuxbrew
--> a93017d33f0b
STEP 5/8: RUN curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash 
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
```
