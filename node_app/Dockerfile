FROM node:latest
EXPOSE 8080

ENV http_proxy="http://192.168.5.8:3128"
ENV https_proxy="http://192.168.5.8:3128"

RUN apt-get update -y && apt-get install -y netcat

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN mkdir -p app
ADD app/ /app
RUN cd /app && npm i

CMD [ "sh", "-c", "/tmp/entrypoint.sh" ]
