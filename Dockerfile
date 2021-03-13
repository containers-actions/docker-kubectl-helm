FROM docker:19.03.11

MAINTAINER fangzhengjin <fangzhengjin@gmail.com>

ARG KUBECTL_VERSION=v1.18.6
ARG HELM_VERSION=v3.2.1
ENV HELM_FILENAME=helm-${HELM_VERSION}-linux-amd64.tar.gz

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl  \
 && apk add --update gettext tar gzip \
 && curl -fL https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && curl -fL https://get.helm.sh/${HELM_FILENAME} | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
 && chmod +x /usr/local/bin/kubectl \
 && chmod +x /bin/helm \
 && apk del --purge deps \
 && rm /var/cache/apk/*
