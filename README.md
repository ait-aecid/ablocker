# aminer-ablocker

This daemon polls logs from kafka topics and executes actions if anomalies occur.

# Installation

```
sudo make install
```

After that set owner of /var/lib/ablocker to aminer-user:

```
sudo chown aminer:aminer /var/lib/ablocker
```

# Configuration

It is possible to configure ablocker via configuration file which must be located at '/etc/aminer/kafka.conf' or via environment variables. 
A sample of the configuration file can be found at [etc/kafka.conf](/etc/kafka.conf)
The following environment variables are available:

| Environment variable | Example | Description |
| -------------------- | ------- | ----------- |
| KAFKA_TOPICS         | `['aminer','logs']` | List of topics |
| ABLOCKER_UNIXPATH      | /var/lib/ablocker/aminer.sock | Path to the unix domain socket |
| KAFKA_BOOTSTRAP_SERVERS | localhost:9092 | Kafka server and port |
| ABLOCKER_SEARCH        | `['.*example.com.*']` | List of regex-patterns to filter specific events |
| ABLOCKER_FILTERS       | `['@metadata.type','@timestamp']` |

# Poll manually

```
sudo /usr/local/bin/ablockerd.py
```

# Starting the daemon

```
sudo systemctl enable ablockerd
sudo systemctl start ablockerd
```

# Testing

Normally the daemon starts polling the elasticsearch as soon as some other programm reads from the unix-domain-socket.
It is possible to read from the socket manually using ncat(from nmap) as follows:

```
sudo ncat -U /var/lib/ablocker/aminer.sock
```

# Uninstall

The following command will uninstall ablocker but keeps the configuration file:
```
sudo make uninstall
```
