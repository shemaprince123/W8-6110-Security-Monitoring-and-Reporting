
# Network Security Monitoring and Incident Response Lab

## Overview

This repository contains my implementation of a comprehensive Network Security Monitoring and Incident Response lab environment using Docker containerization technology. The lab provides a practical platform for hands-on experience with security monitoring tools, log analysis, alert configuration, and incident response procedures in a controlled environment.

Traditional virtualized labs often present challenges such as high resource consumption, inconsistent environments, and complex configuration requirements. This Docker-based approach overcomes these limitations by providing a lightweight, consistent, and easily deployable environment that closely resembles real-world network security scenarios.

## Architecture

The lab architecture implements a defense-in-depth approach with multiple security layers:

![Lab Architecture Diagram](images/Figure1.png)

### Network Segmentation

The environment consists of two isolated networks:
- **Corporate Network (172.20.0.0/16)**: Contains internal resources including servers, workstations, and monitoring tools
- **DMZ Network (172.30.0.0/16)**: Contains the attacker machine and simulates the external network

### Key Components

1. **SIEM System**: Elastic Stack (Elasticsearch, Logstash, Kibana)
   - Elasticsearch: Data storage and search engine
   - Logstash: Log processing and normalization
   - Kibana: Visualization and dashboard interface

2. **Network Security Tools**:
   - Suricata IDS/IPS: Signature-based threat detection
   - Firewall: Network traffic control between corporate and DMZ networks

3. **Corporate Infrastructure**:
   - Corporate Server: Primary server with SSH and web services
   - Workstations: Employee simulation containers

4. **Security Testing Tools**:
   - Attacker Machine: Kali Linux container for simulating attacks
   - SOC Analyst Workstation: Security operations and incident response

## Implementation Modules

### Module 1: Identifying Key Monitoring Metrics

Focused on establishing meaningful security monitoring metrics:
- Authentication events monitoring
- Network traffic pattern analysis
- System resource utilization tracking
- Firewall and IDS/IPS alert monitoring

![Key Metrics Dashboard](images/Figure3.png)

### Module 2: Configuring SIEM Alerts and Dashboards

Configuration of detection rules for:
- Failed login attempts exceeding thresholds
- Unusual data transfer detection
- Unauthorized access attempts to sensitive files

![Alert Configuration in Kibana](images/Figure5.png)

### Module 3: Analyzing Suspicious Logs

Development of log analysis skills to identify patterns indicating suspicious activities:
- Brute force attack detection
- Data exfiltration identification
- Web application attack recognition

![Log Analysis in Kibana](images/Figure7.png)
![Attack Pattern Recognition](images/Figure8.png)

### Module 4: Incident Response Simulation

Implementation of a formal incident response plan following standard methodologies:
- Preparation and identification
- Containment strategies
- Eradication procedures
- Recovery processes
- Documentation and lessons learned

![Incident Response Workflow](images/Figure10.png)
![Containment Actions](images/Figure11.png)
![Evidence Collection](images/Figure12.png)

## Getting Started

### Prerequisites

- Docker and Docker Compose installed
- Git for cloning this repository
- At least 8GB of RAM and 20GB of free disk space

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/shemaprince123/W8-6110-Security-Monitoring-and-Reporting.git
   cd W8-6110-Security-Monitoring-and-Reporting
   ```

2. Start the lab environment:
   ```bash
   docker-compose up -d
   ```

3. Wait for all services to initialize (1-2 minutes)

### Accessing Lab Components

- Kibana dashboard: http://localhost:5601
- Corporate server SSH: `ssh admin@localhost -p 2222` (password: password)
- Corporate web server: http://localhost:8080

### Running Attack Simulations

```bash
# SSH Brute Force Attack
docker exec -it attacker python3 /scripts/brute_force.py

# Data Exfiltration
docker exec -it attacker python3 /scripts/data_exfiltration.py
```

### Shutting Down

To stop the lab environment:
```bash
docker-compose down
```

## File Structure

```
network-security-lab/
├── configs/
│   ├── corporate-server/
│   │   └── filebeat.yml
│   ├── firewall/
│   │   ├── Dockerfile.firewall
│   │   └── firewall-setup.sh
│   ├── logstash/
│   │   ├── config/
│   │   │   └── logstash.yml
│   │   └── pipeline/
│   │       └── logstash.conf
│   ├── sensitive_files/
│   │   └── customer_data.csv
│   └── suricata/
│       ├── rules/
│       │   └── local.rules
│       └── suricata.yaml
├── images/
│   └── Figure*.png
├── scripts/
│   ├── brute_force.py
│   └── data_exfiltration.py
├── docker-compose.yml
└── Dockerfile.server
```

## Troubleshooting

Common issues and solutions:

- **Elasticsearch Fails to Start**: Increase Docker's memory allocation or reduce memory settings in docker-compose.yml
- **Kibana Cannot Connect**: Ensure Elasticsearch is fully initialized before Kibana attempts to connect
- **Container Restart Issues**: Check Docker logs for specific error messages

## Technologies Used

- Docker & Docker Compose
- Elastic Stack (Elasticsearch, Logstash, Kibana) 7.16.3
- Suricata IDS/IPS
- Ubuntu 20.04 (base for most containers)
- Kali Linux (for attacker container)
- Python for attack simulation scripts

## Learning Outcomes

This lab implementation demonstrates proficiency in:
- Designing and deploying containerized security environments
- Configuring SIEM tools for effective security monitoring
- Analyzing logs to detect suspicious activities
- Developing and implementing incident response plans
- Working with industry-standard security tools

## Resources and References

- [Elastic Stack Documentation](https://www.elastic.co/guide/index.html)
- [Suricata IDS Documentation](https://suricata.readthedocs.io/)
- [Docker Documentation](https://docs.docker.com/)

## License
Copyright © 2025 Shema Prince 🤴. All rights reserved.

This project and its contents are proprietary and confidential. Unauthorized copying, distribution, modification, public display, or public performance of this material is strictly prohibited. This software is provided for educational purposes only, and may only be used with explicit permission from the copyright holder.
