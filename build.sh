#!/bin/bash
echo "Building ISO"
sudo mkarchiso -v -w /etc/iso/work -o /etc/iso /etc/iso/archlive

echo "Publish ISO"
sudo cp ./*.iso /var/www/files/

echo "Cleaning up"
sudo rm ./*.iso
sudo rm -R /etc/iso/work/*
