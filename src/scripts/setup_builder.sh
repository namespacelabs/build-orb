#!/bin/bash
set -ex

# CircleCI runs out of us-east-1; lets be close.
export NSC_ENDPOINT=https://compute.iad.namespaceapis.com

CMD="nsc docker buildx setup --name namespace"

if [ "$BUILDER_USE_AS_DEFAULT" = "true" ] || [ "$BUILDER_USE_AS_DEFAULT" = 1 ]; then
    CMD="$CMD --use"
fi

if [ -n "$BUILDER_NAME" ]; then
    CMD="$CMD --tag $BUILDER_NAME"
fi

if [ -n "$BUILDER_EXPERIMENTAL" ]; then
    CMD="$CMD --experimental $BUILDER_EXPERIMENTAL"
fi

$CMD