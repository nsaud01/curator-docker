#!/bin/bash

set -e

if [ -z "$ELASTICSEARCH_HOST" ]; then
  echo "ELASTICSEARCH_HOST must be configured"
  exit 1
fi

if [ -z "$MAX_INDEX_AGE" ]; then
  echo "MAX_INDEX_AGE must be configured"
  exit 1
fi

exec "$@"
