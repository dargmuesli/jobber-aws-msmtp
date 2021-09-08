FROM jobber:1.4.4-alpine3.11@sha256:a85b68725beeb738e5d6e0f029dd01c4e0dd793aa4f1bfdf70c8d5f37586c3d5

# Allow package installations.
USER root

RUN apk --no-cache add \
        ca-certificates \
        msmtp \
        py3-pip \
    && rm -rf /var/cache/apk/* \
    && pip3 install awscli \
    && pip3 install awscli-plugin-endpoint \
    && ln -sf /usr/bin/msmtp /usr/sbin/sendmail \
    && rm -rf /var/cache/apk/*

# Switch back to the original user.
USER jobberuser