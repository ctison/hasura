FROM ctison/hasura-cli:v1.3.1@sha256:f22996f35ae690ebd54c3f1d4c5e78921d655b5d5ed3df0da8411c59c141fa18

USER root

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get install --no-install-recommends -y git ncat socat  \
  && rm -rf /var/lib/apt/lists/*

COPY /entrypoint.sh /
RUN chown hasura:hasura /entrypoint.sh
USER hasura
RUN chmod 500 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--address=0.0.0.0", "--no-browser"]