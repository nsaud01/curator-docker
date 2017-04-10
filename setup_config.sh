#!/bin/bash

sed -ie "s/__ELASTICSEARCH_HOST__/$ELASTICSEARCH_HOST/g" /root/.curator/curator.yml
sed -ie "s/__ELASTICSEARCH_PORT__/$ELASTICSEARCH_PORT/g" /root/.curator/curator.yml
sed -ie "s/__MAX_INDEX_AGE__/$MAX_INDEX_AGE/g" /root/.curator/purge_old_indeces.yml
