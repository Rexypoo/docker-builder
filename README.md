# docker-builder
A builder image for use with gitea act runner
## Tools included
- node - this is the base image for runners
- docker - for building and pushing docker images with automated workflows
## Usage
When registering a runner, include a label for this image.
### With act_runner
When you register your runner, you will be prompted for your labels. Example:
```
INFO Enter the runner labels, leave blank to use the default labels (comma-separated, for example, ubuntu-20.04:docker://node:16-bullseye,ubuntu-18.04:docker://node:16-buster,linux_arm:host):
ubuntu-latest:docker://rexypoo/builder:latest,ubuntu-22.04:docker://rexypoo/builder:latest,ubuntu-20.04:docker://rexypoo/builder:latest,ubuntu-18.04:docker://node:16-buster
```
### With docker compose
In docker-compose.yml include the environment variable `GITEA_RUNNER_LABELS` as follows:
```yml
services:
  runner:
    image: gitea/act_runner
    environment:
      GITEA_RUNNER_LABELS: "ubuntu-latest:docker://rexypoo/builder:latest,ubuntu-22.04:docker://rexypoo/builder:latest,ubuntu-20.04:docker://rexypoo/builder:latest,ubuntu-18.04:docker://node:16-buster"
```
### With docker
Include the environment variable `GITEA_RUNNER_LABELS`
```bash
docker run [...] -e GITEA_RUNNER_LABELS="ubuntu-latest:docker://rexypoo/builder:latest,ubuntu-22.04:docker://rexypoo/builder:latest,ubuntu-20.04:docker://rexypoo/builder:latest,ubuntu-18.04:docker://node:16-buster" gitea/act_runner
```
## Why include ubuntu-18.04?
I've included the ubuntu-18.04 label so that my gitea instance can build the builder, even if no builder image exists. See .gitea/worflows/docker-publish.yml for specifics of this automated build.

