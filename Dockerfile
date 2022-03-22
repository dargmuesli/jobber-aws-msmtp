FROM dargmuesli/jobber:1.4.6-alpine@sha256:13a8f7dad8500c02739c9027e9a9265f0ff24ceb21d6ea8bacef0ed1c6c77975

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