# build-orb

Acelerate Docker builds with Namespace's Remote Builders.

## Example

```yaml
  orbs:
    namespace: namespacelabs/build@0.2.3
 
  jobs:
    build:
      steps:
        - namespace/setup
        - run:
            name: Build Docker image
            command: |
              docker build .
```
