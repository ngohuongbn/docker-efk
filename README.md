# Docker EFK (Elasticsearch, Fluentd, Kibana)

EFK setup with docker, docker-compose.

## Requirements

- docker
- docker-compose

## Usage 

- Step 1: Update elasticsearch ip and fluentd aggregator ip to /etc/hosts:

```sh
echo "<elastic_search_ip>     elasticsearch" >> /etc/hosts
echo "<fluentd_ip>     fluentd" >> /etc/hosts
```

- Step 2: Build/rebuild docker images:

```sh
docker-compose -f efk.yml -f example/httpd.yml -f nginx.yml build
```

- Step 3: Run docker-compose:

```sh
# just run EFK stack
docker-compose -f efk.yml up -d

# run EFK stack with http as datasource
docker-compose -f efk.yml -f example/httpd.yml up -d

# ommit option `-d` to show docker-compose logs in real-time
```

## Notes

- Services version:
  - kibana:5.6.7
  - elasticsearch:5.6.7, JVM: 1.8.0_151
  - fluentd:ubuntu-base (fluentd 1.1.0)

- Install Fluentd collector for target servers:

```sh
export td_agent_version=3 #2
chmod +x fluentd_collector.sh
bash fluentd_collector.sh ${td_agent_version}
```
