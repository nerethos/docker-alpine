# :: Header
FROM alpine:3.23@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375
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