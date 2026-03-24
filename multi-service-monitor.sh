#!/bin/bash

# List of services to monitor
SERVICES=("nginx" "apache2" "mysql")

echo "====================================="
echo "     Multi-Service Health Monitor"
echo "====================================="

for SERVICE in "${SERVICES[@]}"; do
    echo -e "\n>>> Checking service: $SERVICE"

    if ! systemctl is-active --quiet "$SERVICE"; then
        echo " - Status: DOWN"
        echo " - Action: Starting $SERVICE..."
        systemctl start "$SERVICE"
        sleep 2

        if systemctl is-active --quiet "$SERVICE"; then
            echo " - Result: $SERVICE started successfully ✅"
        else
            echo " - Result: Start failed. Retrying restart..."
            systemctl restart "$SERVICE"
            sleep 2

            if systemctl is-active --quiet "$SERVICE"; then
                echo " - Final Result: $SERVICE is running after restart ✅"
            else
                echo " - Final Result: ERROR ❌ $SERVICE could not be started!"
            fi
        fi
    else
        echo " - Status: RUNNING ✅"
    fi

    echo "-------------------------------------"
done

echo -e "\nAll services checked."
