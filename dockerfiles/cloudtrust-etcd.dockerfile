FROM cloudtrust-baseimage:f27

ARG service_git_tag


RUN dnf update -y && \
    dnf install -y etcd && \
    dnf clean all

WORKDIR /cloudtrust
RUN git clone git@github.com:cloudtrust/etcd-service.git

WORKDIR /cloudtrust/etcd-service
RUN git checkout ${service_git_tag} && \
    install -m660 -v deploy/etc/systemd/system/etcd.service /etc/systemd/system/etcd.service

RUN systemctl enable etcd
