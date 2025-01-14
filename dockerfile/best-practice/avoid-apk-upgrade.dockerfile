FROM alpine:3.21.0

# ruleid: avoid-apk-upgrade
RUN apk update \
    && apk upgrade \
    && apk add foo=1.0 \
    && rm -rf /var/cache/apk/*

# ruleid: avoid-apk-upgrade
RUN apk upgrade

# ruleid: avoid-apk-upgrade
RUN apk upgrade -y

# ok: avoid-apk-upgrade
RUN apk --no-cache add foo=1.0
