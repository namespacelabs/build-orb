#!/bin/bash

# CircleCI runs out of us-east-1; lets be close.
export NSC_ENDPOINT=https://compute.iad.namespaceapis.com

CMD="nsc docker buildx setup --name namespace"

if [ "<< parameters.use_as_default >>" = "true" ]; then
    CMD="$CMD --use"
fi

if [ -n "<< parameters.builder_name >>" ]; then
    CMD="$CMD --tag << parameters.builder_name >>"
fi

if [ -n "<< parameters.experimental >>" ]; then
    CMD="$CMD --experimental << parameters.experimental >>"
fi

$CMD