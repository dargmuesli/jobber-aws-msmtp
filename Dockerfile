FROM dargmuesli/jobber:1.4.8-alpine@sha256:4ec0da9b79f7f4fe67177d6c371b3ef400e2fb0f67fcf0cba1b9272896ea7c75

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