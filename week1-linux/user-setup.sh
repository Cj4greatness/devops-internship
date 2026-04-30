#!/bin/bash
echo "Creating users..."
sudo useradd -m -s /bin/bash developer1
sudo useradd -m -s /bin/bash developer2
sudo useradd -m -s /bin/bash devops-admin
echo "Creating groups..."
sudo groupadd developers
sudo groupadd admins
echo "Adding users to groups..."
sudo usermod -aG developers developer1
sudo usermod -aG developers developer2
sudo usermod -aG admins devops-admin
echo "Creating directories..."
sudo mkdir -p /projects/dev-team
sudo mkdir -p /projects/admin-only
echo "Setting permissions..."
sudo chown root:developers /projects/dev-team
sudo chmod 770 /projects/dev-team
sudo chown root:admins /projects/admin-only
sudo chmod 770 /projects/admin-only
echo "DONE!"
