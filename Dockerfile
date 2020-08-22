FROM ctison/hasura-cli:v1.3.1@sha256:291c74b1919099af4794541ab13993b05dada9656fc14c2301b4be63ce2e527f

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