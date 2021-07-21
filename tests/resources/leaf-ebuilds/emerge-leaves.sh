#!/usr/bin/env bash

FAILED_EBUILDS=()
for ebuild in $(cat "${LEAF_EBUILDS_LIST}"); do
    bash -xc "emerge =${ebuild}" || FAILED_EBUILDS+=( "${ebuild}" )
done

if [[ -n "${FAILED_EBUILDS[@]}" ]]; then
    echo "Failed ebuilds:"
    tr '[:blank:]' '\n' <<< "${FAILED_EBUILDS[@]}"
    exit 1
fi
