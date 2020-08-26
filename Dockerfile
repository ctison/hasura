FROM hasura/graphql-engine:v1.3.1.cli-migrations-v2@sha256:501979431c2039bc5166629a1b70042176c4f31ccb51d479eaebb4d6e51fc481 as server

COPY /metadata/ /hasura/metadata/
COPY /migrations/ /hasura/migrations/

ENV HASURA_GRAPHQL_ENABLE_CONSOLE=false
ENV HASURA_GRAPHQL_ENABLE_TELEMETRY=false
ENV HASURA_GRAPHQL_MIGRATIONS_DIR=/hasura/migrations/
ENV HASURA_GRAPHQL_METADATA_DIR=/hasura/metadata/

FROM ctison/hasura-cli:v1.3.1@sha256:b4014bdd08d6a6801c54a7848f70be993a9c04217970d8329643d5d1653da315 as console

USER root
RUN apt-install-no-cache git ncat socat

COPY /entrypoint.sh /
RUN chmod 500 /entrypoint.sh
RUN chown hasura:hasura /entrypoint.sh

USER hasura
ENV HASURA_GRAPHQL_ENABLE_TELEMETRY=false

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--address=0.0.0.0", "--no-browser"]