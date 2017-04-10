FROM ubuntu:12.04

ENV CURATOR_VERSION 4.2.6
ENV ELASTICSEARCH_PORT 9200

RUN apt-get update
RUN apt-get install -y python-pip cron
RUN pip install elasticsearch-curator==$CURATOR_VERSION

ADD docker-entrypoint.sh /

RUN mkdir -p /root/.curator
ADD curator/curator.yml /root/.curator
ADD curator/purge_old_indeces.yml /root/.curator

ADD purge_old_indeces.sh /etc/cron.hourly/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/cron", "-f", "-L 8"]
