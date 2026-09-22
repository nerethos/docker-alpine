# :: Header
FROM alpine:3.24@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
# :: Run
USER root

# :: update image
RUN set -ex; \
  apk --no-cache add \
  curl \
  tzdata \
  shadow; \
  apk --no-cache upgrade;

# :: create user
RUN set -ex; \
  addgroup --gid 1000 -S appuser; \
  adduser --uid 1000 -D -S -h / -s /sbin/nologin -G appuser appuser;

USER appuser