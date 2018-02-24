#!/usr/bin/env bash

sed -i "s|ELS_HOST|${ELS_HOST}|g" /opt/kibana/config/kibana.yml
sed -i "s|ELS_HOST|${ELS_HOST}|g" /etc/kibana/kibana.yml

while ! nc -w 1 ${ELS_HOST} 9200 > /dev/null 2>&1; do
  echo "Kibana waiting TCP connection $ELASTICSEARCH_PORT_9200_TCP_ADDR:$ELASTICSEARCH_PORT_9200_TCP_PORT..."
  sleep 1
done

echo "Start Kibana"
kibana
