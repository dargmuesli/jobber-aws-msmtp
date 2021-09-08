FROM jobber:1.4.4-alpine3.11@sha256:652facc4ce8aa8669bc36de8a996361a34188e2a0b307d1d3be69e4963d41b26

# Allow package installations.
USER root

RUN apk --no-cache add \
        ca-certificates \
        msmtp \
        py3-pip \
    && rm -rf /var/cache/apk/* \
    && pip3 install awscli \
    && pip3 install awscli-plugin-endpoint \
    && ln -sf /usr/bin/msmtp /usr/sbin/sendmail

# Switch back to the original user.
USER jobberuser