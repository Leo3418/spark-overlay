#!/usr/bin/env bash

DOCKER_IMAGE="ghcr.io/leo3418/spark-overlay-test-leaf-ebuilds"
EMERGE_OPTS="--color y --verbose --quiet-build"

run_test() {
    /var/db/repos/spark-overlay/tests/resources/leaf-ebuilds/emerge-leaves.sh
}
