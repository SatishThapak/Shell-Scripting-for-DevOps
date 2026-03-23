#!/bin/bash

if docker ps | grep -q apache-server; then
echo "Container is running"
else
echo "Container is down"
fi