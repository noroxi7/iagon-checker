# iagon-checker

Lightweight bash script to monitor and auto-restart an Iagon node service on Ubuntu Server, with cron scheduling and daily log rotation.

## Requirements

- Ubuntu Server
- Iagon node installed and configured
- `sudo` access

## Setup

### 1. Clone the repository

```bash
git clone https://github.com/noroxi7/iagon-checker.git
cd iagon-checker
```

### 2. Make the script executable

```bash
chmod +x iagon-checker.sh
```

### 3. Schedule with cron

Open your crontab:

```bash
crontab -e
```

Add the following line to run the check every 5 minutes with daily log files:

```
*/5 * * * * /path/to/iagon-checker.sh >> /path/to/logs/iagon_$(date +\%Y-\%m-\%d).log 2>&1
```

Replace `/path/to/` with the actual paths on your system.

### 4. Configure log rotation

Create a logrotate config:

```bash
sudo nano /etc/logrotate.d/iagon-checker
```

Paste the following:

```
/path/to/logs/*.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
```

This keeps 7 days of compressed logs and deletes older ones automatically.

## How it works

Every 5 minutes, the script checks the status of the Iagon node service. If it is stopped, it starts it automatically. All actions are logged with a UTC timestamp.

## License

MIT