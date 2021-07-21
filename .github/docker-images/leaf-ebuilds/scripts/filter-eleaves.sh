#!/usr/bin/env bash

EXCLUDED_EBUILDS=(
    # Kotlin ebuilds, covered by other test cases
    "dev-java/kotlin-stdlib-jdk8-1.4.32"
    "dev-java/kotlin-stdlib-jdk8-1.5.20"
    "dev-java/kotlin-test-js-1.4.32"
    "dev-java/kotlin-test-js-1.5.20"
    # Masked packages
    "java-virtuals/antlr-4.8"
)

: ${ELEAVES:=/tmp/scripts/eleaves.py}

LEAF_EBUILDS=$("${ELEAVES}" --algorithm rev-search spark-overlay || exit $?)
for excluded in "${EXCLUDED_EBUILDS[@]}"; do
    LEAF_EBUILDS=${LEAF_EBUILDS//"${excluded}"}
done
sed -r '/^\s*$/d' <<< "$LEAF_EBUILDS"
