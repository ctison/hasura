# Hasura

This repository contains a graphQL API built with Hasura.

The tools used to develop this application are:

- Docker
- Docker Compose
- Yarn

## Usage

Keep dependencies up to date by running `yarn install` on every pull.

Run `yarn run dev` to start the docker compose stack, which contains the following services:

| Name     | Ports                                       | Description                                                      |
| -------- | ------------------------------------------- | ---------------------------------------------------------------- |
| postgres | 5432->5432                                  | Postgres database on which Hasura engine connects                |
| hasura   | 8080->8080                                  | Hasura engine exposing its graphQL API                           |
| console  | 9695->9695 (web UI), 9693->9693 (websocket) | Hasura console is the web frontend to develop with Hasura engine |

Run `yarn run dev:logs` to attach to `console` service logs stream.

```
...
console_1   | {"level":"info","msg":"console running at: http://0.0.0.0:9695/","time":"2020-08-14T06:20:45Z"}
^C
```

Once `console` service is ready, you can browse to `localhost:9695` in your browser and start developing.

To delete the docker compose stack, run `yarn run dev:down`. It will remove all containers, volumes, and networks created for the stack.
