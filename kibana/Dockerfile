FROM kibana:5.6.7

RUN apt-get update && apt-get install -y netcat

COPY entrypoint.sh /tmp/entrypoint.sh
COPY config/kibana.yml /opt/kibana/config/kibana.yml
COPY config/kibana.yml /etc/kibana/kibana.yml

RUN chmod +x /tmp/entrypoint.sh

COPY config/kibana.yml /opt/kibana/config/kibana.yml

CMD ["/tmp/entrypoint.sh"]
