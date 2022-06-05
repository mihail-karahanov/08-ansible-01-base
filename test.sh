#!/bin/bash

set -eu

# Start docker containers
docker run -d --name ubuntu pycontribs/ubuntu:latest sleep 3600
docker run -d --name fedora pycontribs/fedora:latest sleep 3600
docker run -d --name centos7 pycontribs/centos:7 sleep 3600

# Run playbook
ansible-playbook -i ./inventory/prod.yml --ask-vault-pass ./site.yml

# Stop containers
docker stop ubuntu fedora centos7

# Remove containers
docker rm ubuntu fedora centos7