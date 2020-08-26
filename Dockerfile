FROM ctison/hasura-cli:v1.3.1@sha256:b4014bdd08d6a6801c54a7848f70be993a9c04217970d8329643d5d1653da315

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