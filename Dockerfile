FROM ghcr.io/dargmuesli/jobber:1.4.9-alpine@sha256:10e79e8c7a1b4e39839a3468ceb0c312bfbf48db9c01eba503bd67d8bf569288

# Allow package installations.
USER root

RUN apk --no-cache add \
        ca-certificates \
        msmtp \
        py3-pip \
        curl \
    && rm -rf /var/cache/apk/* \
    && python3 -m venv .venv \
    && source .venv/bin/activate \
    && python3 -m pip install awscli \
    && python3 -m pip install awscli-plugin-endpoint \
    && ln -sf /usr/bin/msmtp /usr/sbin/sendmail

# Switch back to the original user.
USER jobberuser