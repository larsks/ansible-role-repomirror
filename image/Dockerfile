FROM registry.access.redhat.com/ubi8:8.4

RUN rm /etc/rhsm-host
RUN rm /etc/pki/entitlement-host
RUN yum -y install yum-utils cronie

CMD ["crond", "-n"]
