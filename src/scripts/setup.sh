#!/bin/bash

MAX_RETRIES=5
RETRY_DELAY=3

for i in $(seq 1 $MAX_RETRIES); do
    if curl -fsSL https://get.namespace.so/cloud/install.sh | NS_ROOT=/tmp/namespace sh; then
        break
    fi
    if [ "$i" -eq "$MAX_RETRIES" ]; then
        echo "Failed to install Namespace binaries after $MAX_RETRIES attempts"
        exit 1
    fi
    echo "Installation attempt $i failed, retrying in ${RETRY_DELAY}s..."
    sleep $RETRY_DELAY
done
echo 'export PATH=/tmp/namespace/bin:"$PATH"' >> "$BASH_ENV"
source "$BASH_ENV"

nsc auth exchange-circleci-token