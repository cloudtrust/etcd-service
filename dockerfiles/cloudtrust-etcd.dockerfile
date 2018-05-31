FROM cloudtrust-baseimage:f27

RUN dnf update -y && \
    dnf install -y etcd && \
    dnf clean all


RUN systemctl enable etcd
