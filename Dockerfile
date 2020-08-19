FROM ctison/hasura-cli:v1.3.0@sha256:09d52911fa874ad239f396f98b778de91a6cd8e147c5fb3ea2a5d24791df309b

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