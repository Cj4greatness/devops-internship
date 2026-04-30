# Week 1 Task 1 — Linux User & Permission Management

## What I did
- Created 3 users: developer1, developer2, devops-admin
- Created 2 groups: developers, admins
- Assigned users to correct groups
- Created project folders with restricted permissions
- Automated everything with a shell script

## Commands learned
- useradd — create users
- groupadd — create groups
- usermod -aG — add user to group
- chown — change ownership
- chmod 770 — set permissions

## How to run
chmod +x user-setup.sh
./user-setup.sh
