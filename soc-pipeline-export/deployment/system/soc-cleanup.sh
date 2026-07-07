#!/bin/bash
# SOC Nightly Maintenance Script

echo "Starting cleanup: $(date)" >> /var/log/soc-cleanup.log

# 1. Vacuum Ubuntu System Logs (keep only last 2 days)
journalctl --vacuum-time=2d

# 2. Prune unused Docker networks, dangling images, and build cache
docker system prune -af --filter "until=168h"

# 3. Clean up Wazuh old alert logs (Keep last 7 days to save space)
find /var/ossec/logs/alerts/ -type f -name "*.log" -mtime +7 -exec rm {} \;
find /var/ossec/logs/alerts/ -type f -name "*.json" -mtime +7 -exec rm {} \;
find /var/ossec/logs/archives/ -type f -mtime +7 -exec rm {} \;

# 4. Clean apt cache
apt-get clean

echo "Cleanup finished: $(date)" >> /var/log/soc-cleanup.log
