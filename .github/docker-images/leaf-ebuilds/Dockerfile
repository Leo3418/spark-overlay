# This Dockerfile creates an image that can be used to run the leaf ebuild
# installation test case.  It completes tasks that are independent of each test
# case's configuration (e.g. install packages in ::gentoo which will not be
# affected by differences in those test cases' configurations) so the image can
# be shared across all tests and the runtime of test cases can be reduced.
#
# Notes on building the image from this Dockerfile:
# 1. Please make sure the context of the build (which should be the working
#    directory from which you invoke the command to build this image) is the
#    root of this Git repository.
# 2. This Dockerfile contains a lot of instructions, and as a result, the final
#    image will consist of many layers.  To reduce the number of layers, the
#    experimental '--squash' option for 'docker build' can be enabled.

FROM ghcr.io/leo3418/gentoo-stage3-amd64-java:latest

# The file containing the list of ebuilds to be tested
ENV LEAF_EBUILDS_LIST="/var/cache/spark-overlay/leaf-ebuilds.txt"

COPY . /var/db/repos/spark-overlay
COPY .github/docker-images/leaf-ebuilds/repos.conf /etc/portage/repos.conf
COPY .github/docker-images/leaf-ebuilds/scripts /tmp/scripts

# Install pkgcore, which contains pquery
RUN emerge-webrsync && emerge --color y --verbose --oneshot sys-apps/pkgcore

# Generate a list of leaf ebuilds to test
RUN mkdir -p $(dirname "${LEAF_EBUILDS_LIST}") && \
    /tmp/scripts/filter-eleaves.sh | tee "${LEAF_EBUILDS_LIST}"

# ebuild repositories will be bind mounted by the test scripts later, must
# remove them to make the mount point available
RUN rm -r /var/db/repos/* /etc/portage/repos.conf/* /tmp/scripts/*
