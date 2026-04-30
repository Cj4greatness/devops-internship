#!/bin/bash
# Simulates a CPU-intensive process
echo "Starting load simulation..."
echo "PID: $$"
echo "Run: kill $$ to stop it"

# Run for 60 seconds max
timeout 60 bash -c 'while true; do echo "working..." > /dev/null; done'
