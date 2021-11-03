FROM dargmuesli/jobber:1.4.5-alpine@sha256:749a44a275645ad379fa8e4f5b9407512ffb1bc903a6f050e8764b04f4280d9e

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