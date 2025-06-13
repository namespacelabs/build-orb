# build-orb

Acelerate Docker builds with Namespace's Remote Builders.

## Example

```yaml
  orbs:
    build: namespacelabs/build@0.0.1
 
  jobs:
    build:
      steps:
        - build/setup
        - run:
            name: Build Docker image
            command: |
              docker build .
```
