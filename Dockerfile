# Dockerfile of the console service in docker-compose.yaml
FROM alpine:3.12.0

# Install hasura CLI
ARG HASURA_VERSION=v1.3.0
RUN wget -qO /usr/local/bin/hasura https://github.com/hasura/graphql-engine/releases/download/"$HASURA_VERSION"/cli-hasura-linux-amd64
RUN chmod 500 /usr/local/bin/hasura

# Install socat to fowarding localhost:8080 to hasura:8080
# hadolint ignore=DL3018
RUN apk add --no-cache socat git

COPY /entrypoint.sh /
RUN chmod 500 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--address=0.0.0.0", "--no-browser"]