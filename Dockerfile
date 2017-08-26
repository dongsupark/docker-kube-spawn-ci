FROM fedora:26

ENV GOPATH /go
ENV PATH "/go/bin:${PATH}"

RUN dnf install -y \
        btrfs-progs \
        git \
        go \
        iproute \
        iputils \
        make \
        kubernetes \
        net-tools \
        procps-ng \
        qemu-img \
        strace \
        which \
    && dnf clean all

RUN go get -u github.com/kinvolk/kube-spawn 2>/dev/null || true
RUN go get -u github.com/golang/dep/cmd/dep
RUN go get -u github.com/containernetworking/plugins/plugins/...

WORKDIR /go/src/github.com/kinvolk/kube-spawn

RUN make vendor all

CMD ["bash"]
