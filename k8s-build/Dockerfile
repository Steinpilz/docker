FROM docker:latest

# kubectl
ENV KUBECTL_VERSION="1.17.4"
RUN wget -O /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
  && chmod +x /usr/bin/kubectl

# helm
ENV HELM_VERSION="3.1.2"
RUN wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
  && tar -xvf helm-v${HELM_VERSION}-linux-amd64.tar.gz \
  && mv linux-amd64/helm /usr/bin \
  && chmod +x /usr/bin/helm \
  && rm -f /helm-v${HELM_VERSION}-linux-amd64.tar.gz

# skaffold
ENV SKAFFOLD_VERSION="1.6.0"
RUN wget -O /usr/bin/skaffold https://storage.googleapis.com/skaffold/releases/v${SKAFFOLD_VERSION}/skaffold-linux-amd64 \
  && chmod +x /usr/bin/skaffold

ENV GIT_VERSION="2.22"
RUN apk add --no-cache "git>=${GIT_VERSION}"

ENV JQ_VERSION="1.6"
RUN apk add --no-cache jq~=${JQ_VERSION}

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]
