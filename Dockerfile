# You can change this to a newer version of MySQL available at
# https://hub.docker.com/r/mysql/mysql-server/tags/
FROM mysql/mysql-server:8.0.24

COPY config/user.cnf /etc/mysql/my.cnf

FROM registry.access.redhat.com/rhscl/mysql-57-rhel7
RUN yum update -y && yum install -y python3-pip && pip3 install magic-wormhole
