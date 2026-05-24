FROM confluentinc/cp-kafka-connect-base:8.1.0

ADD connectors-pack.tar.gz /usr/share/confluent-hub-components/

RUN mkdir -p /usr/share/confluent-hub-components/temp-source-connector

COPY temp-source-connector.jar /usr/share/confluent-hub-components/temp-source-connector/temp-source-connector.jar
