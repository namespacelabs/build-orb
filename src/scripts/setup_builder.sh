#!/bin/bash

# CircleCI runs out of us-east-1; lets be close.
export NSC_ENDPOINT=https://compute.iad.namespaceapis.com

if [ "<< parameters.use_as_default >>" = "true" ]; then
    nsc docker buildx setup --name namespace --use
else
    nsc docker buildx setup --name namespace
fi
