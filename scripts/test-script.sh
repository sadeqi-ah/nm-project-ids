#!/usr/bin/env bash

# ===================================================================
# scripts/test_setup.sh
# Description: Prepares test environment for Snort IDS testing
# Usage: ./test_setup.sh [pcap_directory]
# ===================================================================

# Variables
target_dir=${1:-"./examples/pcaps"}
output_dir="./logs"

# Create directories
mkdir -p "$target_dir"
mkdir -p "$output_dir"

echo "[+] Test setup:"
echo "    PCAP directory: $target_dir"
echo "    Logs directory: $output_dir"

echo "[+] Downloading sample PCAPs..."
# Example: download from public corpus or copy from local repo (placeholder)
# wget -P "$target_dir" https://example.com/pcaps/sql_injection.pcap
# wget -P "$target_dir" https://example.com/pcaps/xss_attack.pcap
# wget -P "$target_dir" https://example.com/pcaps/port_scan.pcap
# wget -P "$target_dir" https://example.com/pcaps/ssh_bruteforce.pcap

echo "[+] Test environment is ready."

echo "Run Snort with: snort -c configs/snort.conf -r $target_dir/<pcapfile> -l $output_dir"

