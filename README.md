This is a copy of https://github.com/docker-library/elasticsearch (just the 1.5 tag) that uses `java-8` as the base image, until [this issue](https://github.com/docker-library/elasticsearch/issues/13) gets fixed.

It also has some custom config and includes Marvel and the AWS plugin.

Image available on Docker Hub: https://registry.hub.docker.com/u/elevate/elasticsearch/

Assuming that all participating EC2 instances are tagged with `environment:develop`, here's a sample command to run on EC2:

```
docker run -d -p 0.0.0.0:9200:9200 -p 0.0.0.0:9300:9300 elevate/elasticsearch \
  --volumes-from $(docker create -v /usr/share/elasticsearch/data busybox) \
  --cluster.name=elevate-logs-develop \
  --network.publish_host=_ec2_ \
  --discovery.type=ec2 \
  --cloud.aws.region=eu-west \
  --discovery.ec2.tag.environment=develop 
```
