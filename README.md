# Sphinx

[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)
[![Release](https://github.com/CHPC-UofU/container-sphinx/actions/workflows/release.yml/badge.svg)](https://github.com/CHPC-UofU/container-sphinx/actions/workflows/release.yml)

Container image with the Sphinx static site generator.

## Image Tags

* `latest`: Latest stable version of the container currently based on Python 3.10.1 and Sphinx 6.2.1.

## How to Build

This image is built on GitHub automatically any time a commit is made or merged to the `main` branch and tagged. But if you need to build the image on your own locally, do the following:

1. Install [Podman](https://podman.io/getting-started/installation).
2. `cd` into the directory containing this repository.
3. Build the image:

   ```shell
   podman build --file Containerfile --tag container-sphinx:latest .
   ```

## How to Use

1. Install [Podman](https://podman.io/getting-started/installation).
2. Pull this image from GitHub (or use the image you built above `container-sphinx:latest`):

   ```shell
   podman pull ghcr.io/chpc-uofu/container-sphinx:latest
   ```
3. Run a container from the image:

   ```shell
   podman run \
     -it \
     --privileged \
     --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro \
     ghcr.io/chpc-uofu/container-sphinx:latest \
     bash
   ```

## How to Contribute

1. Submit a pull request against `main`.
2. Once the automated status checks pass, complete the pull request by squash-merging with `main`.
3. Apply a [semantic version](https://semver.org/) tag to the resulting commit (e.g. `v1.0.1`).
4. At this point the automatic image build on GitHub will trigger, tagging the new image with the semantic version and `latest`.

## Resources

* [Sphinx: Getting Started](https://www.sphinx-doc.org/en/master/usage/quickstart.html)
* [How to use Podman inside of a container](https://www.redhat.com/sysadmin/podman-inside-container)
* [Cannot set hostname when running in the host UTS namespace with podman in container #11969](https://github.com/containers/podman/issues/11969)
* [Image quay.io/podman/upstream fails on "podman build" when run as root (inside the container) on a RHEL 8.5: msg: modprobe: FATAL: Module ip_tables not found #13294](https://github.com/containers/podman/issues/13294)