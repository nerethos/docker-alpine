# :: Header
FROM alpine:3.22@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
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