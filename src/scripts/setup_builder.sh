#!/bin/bash

# CircleCI runs out of us-east-1; lets be close.
export NSC_ENDPOINT=https://compute.iad.namespaceapis.com

CMD="nsc docker buildx setup --name namespace"

if [ "<< parameters.use_as_default >>" = "true" ]; then
    CMD="$CMD --use"
fi

BUILDER_NAME="<< parameters.builder_name >>"
if [ -n "$BUILDER_NAME" ]; then
    CMD="$CMD --tag $BUILDER_NAME"
fi

BUILDER_EXPERIMENTAL="<< parameters.experimental >>"
if [ -n "$BUILDER_EXPERIMENTAL" ]; then
    CMD="$CMD --experimental $BUILDER_EXPERIMENTAL"
fi

$CMD