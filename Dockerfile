FROM ctison/hasura-cli:v1.3.1@sha256:94fc3241cde58ffa1f1dc60fe46c67b16fcad379f032b64645f8fea8fc8c9201

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