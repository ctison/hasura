FROM hasura/graphql-engine:v1.3.1.cli-migrations-v2@sha256:501979431c2039bc5166629a1b70042176c4f31ccb51d479eaebb4d6e51fc481 as server

COPY /metadata/ /hasura/metadata/
COPY /migrations/ /hasura/migrations/

ENV HASURA_GRAPHQL_ENABLE_CONSOLE=false
ENV HASURA_GRAPHQL_ENABLE_TELEMETRY=false
ENV HASURA_GRAPHQL_MIGRATIONS_DIR=/hasura/migrations/
ENV HASURA_GRAPHQL_METADATA_DIR=/hasura/metadata/

FROM ctison/hasura-cli:v1.3.1@sha256:4dd7d78b8e92db5b491317dfda0162876c2b4bca58a740df7f6ffb755c08713d as console

USER root
RUN apt-install-no-cache git ncat socat

COPY /entrypoint.sh /
RUN chmod 500 /entrypoint.sh
RUN chown hasura:hasura /entrypoint.sh

USER hasura
ENV HASURA_GRAPHQL_ENABLE_TELEMETRY=false

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--address=0.0.0.0", "--no-browser"]