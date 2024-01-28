  ARG OS_VERSION=3.19.1
# :: Header
  FROM alpine:${OS_VERSION}
  
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