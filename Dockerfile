FROM base

ARG S6_DOWNLOAD_URL="https://github.com/just-containers/s6-overlay/releases/download"
ARG S6_OVERLAY_VERSION="3.1.2.0"
ARG S6_ARCH="x86_64"
ADD ${S6_DOWNLOAD_URL}/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
ADD ${S6_DOWNLOAD_URL}/v${S6_OVERLAY_VERSION}/s6-overlay-${S6_ARCH}.tar.xz /tmp

ENTRYPOINT
