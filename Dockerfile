# :: Header
FROM alpine:3.23@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659
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