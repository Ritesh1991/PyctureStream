# Pycture Stream

> Demo-architecture for distribute image stream processing using Kafka and PySpark

## Setup

### Virtual Machines
- [Bitnami OVA - Kafka 1.0.0](https://bitnami.com/stack/kafka/virtual-machine)
- [Cloudera Quickstart VM - CDH 5.12](https://www.cloudera.com/downloads/quickstart_vms/5-12.html)


### Bitnami Kafka
**VirtualBox Settings**
- Change Network to "NAT"
- Add port forwarding:
    - SSH: Host 127.0.0.1:2222 to Guest 10.0.2.15:22
    - KAFKA:  Host 127.0.0.1:9092 to Guest 10.0.2.15:9092

**Configure Kafka**
- Boot VM
- Run in VM: [setup_kafka.sh](setup_kafka.sh)
- SSH into Kafka VM: `ssh bitnami@192.168.0.1 -p2222` (Default PW: bitnami)
- Test Kafka:
    - Create Topic:
    ```bash
    /opt/bitnami/kafka/bin/kafka-topics.sh --create --zookeeper 127.0.0.1:2181 --replication-factor 1 --partitions 1 --topic test
    ```
    - Open Consumer:
    ```bash
    /opt/bitnami/kafka/bin/kafka-topics.sh --create --zookeeper 127.0.0.1:2181 --replication-factor 1 --partitions 1 --topic test
    ```
    - Start Producer (e.g. in other SSH):
    ```bash
    /opt/bitnami/kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
    ```
