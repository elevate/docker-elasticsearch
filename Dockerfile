FROM elasticsearch:1.5.2

ENV MARVEL_VERSION 1.3.1
WORKDIR /usr/share/elasticsearch/plugins/marvel
RUN wget http://download.elasticsearch.org/elasticsearch/marvel/marvel-${MARVEL_VERSION}.zip \
	&& unzip -o marvel-${MARVEL_VERSION}.zip

ENV AWS_PLUGIN_VERSION 2.5.0
WORKDIR /usr/share/elasticsearch/plugins/elasticsearch-cloud-aws
RUN wget http://download.elasticsearch.org/elasticsearch/elasticsearch-cloud-aws/elasticsearch-cloud-aws-${AWS_PLUGIN_VERSION}.zip \
	&& unzip -o elasticsearch-cloud-aws-${AWS_PLUGIN_VERSION}.zip

COPY config /usr/share/elasticsearch/config
