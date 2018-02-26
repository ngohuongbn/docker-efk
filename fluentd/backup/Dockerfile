FROM fluent/fluentd:ubuntu-base

USER root
WORKDIR /
RUN apt-get update && apt-get install -y netcat

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-rdoc", "--no-ri"]
RUN ["gem", "install", "fluent-plugin-grok-parser", "--no-rdoc", "--no-ri"]
RUN ["gem", "install", "fluent-plugin-forest", "--no-rdoc", "--no-ri"]
RUN ["gem", "install", "fluent-plugin-retag", "--no-rdoc", "--no-ri"]
RUN ["gem", "install", "fluent-plugin-glusterfs", "--no-rdoc", "--no-ri"]

ADD fluent.conf /fluentd/etc/fluent.conf

CMD ["/tmp/entrypoint.sh"]
