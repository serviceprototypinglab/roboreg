FROM ubuntu-upstart:14.04
MAINTAINER "Giovanni Toffetti"

# Bootstrap script options: install Salt Master by default
ENV BOOTSTRAP_OPTS='-M'
# Version of salt to install: stable or git
ENV SALT_VERSION=stable

ADD https://raw.githubusercontent.com/saltstack/salt-bootstrap/develop/bootstrap-salt.sh /tmp/


RUN apt-get update && \
    apt-get -yq install --no-install-recommends curl wget apt-transport-https python-pip software-properties-common
RUN add-apt-repository ppa:saltstack/salt

# Prevent udev from being upgraded inside the container, dpkg will fail to configure it
RUN echo udev hold | dpkg --set-selections
# Upgrade System and Install Salt
RUN sudo sh /tmp/bootstrap-salt.sh -U -X -d $BOOTSTRAP_OPTS $SALT_VERSION && \
    apt-get clean

RUN apt-get update && \
    apt-get -yq install salt-api

EXPOSE 4505 4506 8001

ADD config/* /etc/salt/
ADD modules/* /srv/salt/_modules/
ADD bin/* /

#RUN patch /usr/lib/python2.7/dist-packages/salt/netapi/__init__.py salt/salt-netapi.diff
#RUN /usr/sbin/update-rc.d -f ondemand remove; \
#    update-rc.d salt-minion defaults && \
#    update-rc.d salt-master defaults || true
CMD ./entrypoint.sh



