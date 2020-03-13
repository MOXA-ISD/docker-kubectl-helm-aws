FROM alpine:3.11

LABEL maintainer Justin Liu <justintwd@gmail.com>

RUN apk --update add --no-cache curl make git ca-certificates groff less python py-pip && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod u+x kubectl && \
    mv kubectl /bin/kubectl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod u+x kubectl && \
    mv kubectl /bin/kubectl

RUN curl -L https://get.helm.sh/helm-v3.1.1-linux-amd64.tar.gz |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64

RUN pip install awscli

CMD [ "tail", "-f", "/dev/null" ]