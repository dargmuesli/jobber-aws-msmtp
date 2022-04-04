FROM dargmuesli/jobber:1.4.7-alpine@sha256:0ec265379a6990e195f73745897db71f1f9e18b1384a6632e8961bd4d9532197

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