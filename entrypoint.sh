#!/bin/ash

# Wait until hasura service is ready
until nc -z hasura:8080 ; do 
  echo >&2 'Hasura service not ready - will retry in 5 seconds'
  sleep 5
done

# Foward localhost:8080 to hasura:8080 in background
socat TCP-LISTEN:8080,reuseaddr,fork TCP:hasura:8080 &

# Then execute hasura console
hasura console $@