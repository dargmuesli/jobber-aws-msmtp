FROM dargmuesli/jobber:1.4.5-alpine@sha256:62690cc7060b9be355fa43171a8908d512d5f83f9e26c0fa35ea545c35e438dd

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