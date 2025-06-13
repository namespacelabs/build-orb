#!/bin/bash

if [ "<< parameters.use_as_default >>" = "true" ]; then
    nsc docker buildx setup --name namespace --use
else
    nsc docker buildx setup --name namespace
fi
