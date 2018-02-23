FROM kibana:5.6.7

ENV http_proxy="http://192.168.5.8:3128"
ENV https_proxy="http://192.168.5.8:3128"

RUN apt-get update && apt-get install -y netcat

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

COPY config/kibana.yml /opt/kibana/config/kibana.yml

CMD ["/tmp/entrypoint.sh"]
