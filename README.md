# 🛡️ Snort IDS Project - Home Lab

## Project Overview
This project demonstrates the use of **Snort** as an Intrusion Detection System (IDS) to detect:
- **SQL Injection attacks**
- **Cross-Site Scripting (XSS) attacks** (including obfuscated forms)
- **Network mapping and scanning techniques** (SYN, FIN, NULL, XMAS scans)
- **Brute force login attempts** (SSH, FTP)

The rules are customized for a **home lab environment** with IP `192.168.116.129` (This is our IP address when configuring snort) as the protected host (hardened Linux machine).

---

## 📂 Repository Structure
```
.
├── configs/
│   ├── snort.conf           # Snort main configuration
│   └── local.rules          # Custom detection rules
├── examples/
│   └── pcaps/               # Example PCAP files (attacks for testing)
├── logs/                    # Output alert logs
├── scripts/
│   ├── test_setup.sh        # Environment setup script
│   └── analyze_alerts.sh    # Script to parse and summarize alerts
├── rules/                   # cofigured rules of the project
└── README.md

```

---

## ⚙️ Setup Instructions

### Install Snort
```bash
sudo apt update
sudo apt install snort -y
```
When prompted, set your **HOME_NET** to address of your own home ip address.

---

### Clone this repository
```bash
git clone https://github.com/sadeqi-ah/snort-ids-project.git
cd snort-ids-project
```

---

### Copy configuration and rules
Edit `configs/snort.conf`:
```conf
include $RULE_PATH/local.rules
```

Ensure `local.rules` contains the detection rules provided in this project.

---

### Prepare test environment
Run the helper script to set up directories and (optionally) fetch PCAPs:
```bash
chmod +x scripts/test_setup.sh
./scripts/test_setup.sh
```

---

##  Testing the Rules
You can test with provided PCAPs or your own captures:
```bash
sudo snort -c configs/snort.conf -r examples/pcaps/<attack.pcap> -l logs/
```

Check alerts:
```bash
cat logs/alert
```

---

##  Example Alerts ⚠️
Sample alert output:
```
[**] [1:1000001:2] SQL Injection Attempt - ' OR 1=1 [**]
[**] [1:1000004:2] XSS Attempt - <script> tag [**]
[**] [1:1000007:2] TCP FIN Scan [**]
[**] [1:1000011:2] SSH Brute-Force Attempt [**]
```

---

## Notes
- This setup is designed for **educational purposes** in a lab network.
- Threshold values are tuned for **home lab traffic**, not production or enterprise.
- Some patterns are simplified for demonstration and may generate false positives.

---

## 📜 License
This project is licensed under the MIT License.
