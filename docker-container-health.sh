#!/bin/bash

if docker ps | grep -q my_container; then
echo "Container is running"
else
echo "Container is down"
fi