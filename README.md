# Event-Driven solution governance

This project defines tools and metadata to manage event-driven solution. The ontology includes at least the following elements:

![](./docs/images/ontology.png).

In this current implementation, we want to illustrate the following Kafka component management with Atlas:

* Cluster
* Brokers belonging to a cluster
* Topics beloging to one to many clusters
* Producer and consumer apps connected to one to many topics

## Demonstration

* Start Atlas locally: `docker-compose -f environment/atlas/docker-compose up -d`
* Upload type definitions in the following order:

```sh
# Kafka Cluster
./scripts/uploadTypeDef.sh catalog/types/kafka/kafka_cluster_def.json 
# Brokers
./scripts/uploadTypeDef.sh catalog/types/kafka/kafka_broker_def.json
# Topics
./scripts/uploadTypeDef.sh catalog/types/kafka/kafka_topic_def.json
# Applications
./scripts/uploadTypeDef.sh catalog/types/kafka/kafka_app_def.json
```

* Upload entities definitions for each of the elements for the Vaccine solution and Inventory management demo:

```sh
```

* Go to the Atlas UI to get static lineage: ``
