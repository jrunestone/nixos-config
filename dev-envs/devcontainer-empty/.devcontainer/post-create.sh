#!/usr/bin/env bash

# this is run on "postCreateCommand" in the container AFTER the container is CREATED for the first time
# https://containers.dev/implementors/json_reference/

# create an empty .env file if not already present
touch ./.devcontainer/.env

# set correct envs if we are running in codespace
#if [ "$CODESPACES" = true ]; then
#fi

# load the variables in the env file if any
cat ./.devcontainer/.env | xargs -I{} echo "export {}" >> ~/.bashrc

