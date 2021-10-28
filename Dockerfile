FROM dargmuesli/jobber:1.4.5@sha256:9189d2f5b0196d566f95200a304e94fd46a85cb88aa8fce2a1fff4eb00673385

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