FROM amazon/aws-cli:latest
RUN yum install openssl -y \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin
WORKDIR /tmp
ENTRYPOINT ["/bin/bash"]