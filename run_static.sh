#!/bin/bash
ssh-keygen -f id_container -t ed25519 -N ""
docker compose up
ansible-playbook -i ./inventory/test/hosts.ini ./playbook/os.yaml
