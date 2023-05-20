FROM alpine:latest

ENV helm_version v3.12.0
ENV helm_sha256 da36e117d6dbc57c8ec5bab2283222fbd108db86c83389eebe045ad1ef3e2c3b

RUN adduser helm -D \
  && apk add curl git openssh file \
  && git config --global url.ssh://git@github.com/.insteadOf https://github.com/

RUN curl -L --output /tmp/helm-${helm_version}-linux-amd64.tar.gz https://get.helm.sh/helm-${helm_version}-linux-amd64.tar.gz \
  && echo "${helm_sha256}  /tmp/helm-${helm_version}-linux-amd64.tar.gz" | sha256sum -c \
  && tar -xvzf /tmp/helm-${helm_version}-linux-amd64.tar.gz -C /tmp \
  && mv -v /tmp/linux-amd64/helm /usr/local/bin \
  && rm -rf /tmp/linux-amd64 \
  && chmod +x /usr/local/bin/helm \
  && mkdir ~/.ssh \
  && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

RUN mkdir -p /.cache \
  && chmod -R 777 /.cache \
  && chown -R helm /.cache

USER helm
WORKDIR /src

