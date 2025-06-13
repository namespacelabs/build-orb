#!/bin/bash
curl -fsSL https://get.namespace.so/cloud/install.sh | NS_ROOT=/tmp/namespace sh
echo 'export PATH=/tmp/namespace/bin:"$PATH"' >> "$BASH_ENV"
source "$BASH_ENV"

nsc auth exchange-circleci-token