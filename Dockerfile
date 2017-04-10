FROM gliderlabs/alpine:3.2

ENV CURATOR_VERSION 4.2.6
ENV ELASTICSEARCH_PORT 9200

RUN apk --update add python py-pip bash && pip install elasticsearch-curator==$CURATOR_VERSION

ADD docker-entrypoint.sh /

RUN mkdir -p /root/.curator
ADD setup_config.sh /root/
ADD curator/curator.yml /root/.curator
ADD curator/purge_old_indeces.yml /root/.curator

RUN printf "\n0\t2\t*\t*\t*\tbash -c '/root/setup_config.sh && curator --config /root/.curator/curator.yml /root/.curator/purge_old_indeces.yml'" >> /etc/crontabs/root

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["crond", "-f", "-l", "8"]
