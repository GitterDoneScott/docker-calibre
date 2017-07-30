FROM ubuntu:latest
MAINTAINER gitterdone

RUN apt-get update -y && apt-get dist-upgrade -y && apt-get install -y calibre xvfb imagemagick rsyslog inotify-tools && clean

RUN rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/*rack*.com* && rm -rf /var/lib/apt/lists/security.ubuntu.com_ubuntu_dists_precise-security_*

EXPOSE 8080

# Create directory for library
RUN mkdir -p /opt/calibre/library
VOLUME        ["/opt/calibre/library“]

# start calibre server, watching for changes to the database
COPY run.sh /run.sh
CMD ["bash", "-l", "/run.sh"]
