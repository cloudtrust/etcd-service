FROM cloudtrust-baseimage:f27

RUN dnf update -y && \
    dnf install etcd && \
    dnf clean all


RUN systemctl enable etcd
