# Open-Source SOC Pipeline

> An end-to-end Security Operations Center (SOC) lab built entirely with open-source technologies, integrating SIEM, SOAR, threat intelligence, and case management under strict hardware constraints.

![Platform](https://img.shields.io/badge/Platform-Ubuntu%20%2B%20Windows-blue)
![SIEM](https://img.shields.io/badge/SIEM-Wazuh-green)
![SOAR](https://img.shields.io/badge/SOAR-Shuffle-orange)
![Case%20Management](https://img.shields.io/badge/Case%20Management-TheHive-yellow)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

# Project Overview

Traditional SOC architectures assume enterprise-grade infrastructure with abundant CPU, memory, and storage resources. This project demonstrates that a complete SOC pipeline can be engineered on a single laptop with only **16 GB RAM** while preserving realistic detection, orchestration, and incident response workflows.

The pipeline automatically performs:

1. Endpoint telemetry collection
2. Threat detection
3. Alert enrichment
4. Incident creation
5. Case management

---

# Features

- Native Wazuh SIEM deployment
- Dockerized Shuffle SOAR
- Dockerized TheHive Case Management
- OpenSearch backend
- Cassandra database
- Sysmon endpoint telemetry
- MITRE ATT&CK mapped detection rules
- Automatic IOC enrichment using AlienVault OTX
- Automatic alert creation inside TheHive
- SLA-based incident prioritization
- Atomic Red Team attack simulation

---

# Architecture

```
 Windows Endpoint
        │
        ▼
     Sysmon
        │
        ▼
   Wazuh Agent
        │
        ▼
  Wazuh Manager
        │
        ▼
 Python Integration
        │
        ▼
 Shuffle Webhook
        │
        ▼
  AlienVault OTX
        │
        ▼
    HTTP POST
        │
        ▼
    TheHive
```

---

# Technology Stack

| Layer | Technology |
|----------|----------------|
| Hypervisor | VMware Workstation |
| SIEM | Wazuh 4.7 |
| SOAR | Shuffle |
| Case Management | TheHive 5 |
| Database | Cassandra |
| Search Engine | OpenSearch |
| Endpoint Monitoring | Sysmon |
| Threat Intelligence | AlienVault OTX |
| Adversary Emulation | Atomic Red Team |
---

# Detection Rules

| MITRE Technique | Description |
|-----------------|-------------|
| T1033 | System Owner/User Discovery |
| T1003.001 | LSASS Credential Dumping |
| T1003.002 | SAM Credential Dump |
| T1087.001 | Local Account Discovery |

Each rule is mapped to MITRE ATT&CK and escalated to Level 12 for automatic SOAR execution.

---

# Automation Workflow

```
Wazuh Alert
      │
      ▼
Python Integration
      │
      ▼
Shuffle Webhook
      │
      ▼
Regex Sanitization
      │
      ▼
AlienVault OTX
      │
      ▼
TheHive Alert
```

---

# SLA Matrix

| Severity | Time to Acknowledge | Time to Contain | Time to Resolve |
|------------|---------------------|-----------------|-----------------|
| Critical | 15 min | 1 hour | 4 hours |
| High | 30 min | 4 hours | 24 hours |
| Medium | 2 hours | 12 hours | 48 hours |
| Low | 8 hours | N/A | 7 days |

---

# Simulated Attacks

- System Owner Discovery
- Local Account Enumeration
- LSASS Credential Dumping
- SAM Hive Dump

Executed using Atomic Red Team to validate custom detections and end-to-end automation.

---

# Deployment

## Ubuntu Backend

- Ubuntu Server
- Native Wazuh
- Docker Compose
- Shuffle
- TheHive
- Cassandra
- OpenSearch

Configuration files are located under:

```
deployment/
wazuh/
```

---

## Windows Endpoint

- Windows 10/11
- Sysmon
- Wazuh Agent
- Atomic Red Team

Configuration files are located under:

```
windows-endpoint/
```

---

# Engineering Challenges

During implementation several real-world engineering challenges were encountered:

- Dockerized Wazuh SSL hostname mismatch
- OpenSearch storage exhaustion
- Windows JSON escaping issues
- Shuffle TheHive connector parsing bug

The implemented solutions are documented throughout the project.

---

# Documentation

Complete project documentation and presentation are available in the `docs/` directory.
