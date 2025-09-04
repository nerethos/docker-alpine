# :: Header
FROM alpine:3.22@sha256:4bcff63911fcb4448bd4fdacec207030997caf25e9bea4045fa6c8c44de311d1
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