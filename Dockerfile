# Version 0.0.1
FROM centos:centos7
MAINTAINER Andrew Ford "andrew.ford@redi.com"

USER root
RUN yum --assumeyes update && yum --assumeyes install java
RUN mkdir -p /var/redi/{rapp,runtime}
RUN groupadd -r rapp -g 10007 && \
    useradd -u 498 -r -g rapp -d /var/redi/rapp -s /sbin/nologin -c "REDI Application System Account" rapp && \
    chown -R rapp:rapp /var/redi/rapp /var/redi/runtime
USER rapp
WORKDIR /var/redi/rapp
RUN mkdir utils logs archives
COPY utils/* utils
