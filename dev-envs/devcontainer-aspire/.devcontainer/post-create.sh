#!/usr/bin/env bash

# this is run on "postCreateCommand" in the container AFTER the container is CREATED for the first time
# https://containers.dev/implementors/json_reference/

# if the image doesn't load ip_tables modules dockerd will fail to launch
# https://github.com/devcontainers/features/issues/1235
sudo update-alternatives --set iptables /usr/sbin/iptables-nft

# create a dev https cert if not already present
if ! [ -f ./.devcontainer/localhost.pfx ]; then
  dotnet dev-certs https --trust
  dotnet dev-certs https -ep ./.devcontainer/localhost.pfx -p 'changeit'
  chmod +w ./.devcontainer/localhost.pfx
fi

# copy the local CA key (if any) to the devcontainer trust store
# this will be propagated to child processes/containers by the app host
if [ -f ./.devcontainer/ca-key.crt ]; then
  sudo cp ./.devcontainer/ca-key.crt /usr/local/share/ca-certificates/
  sudo update-ca-certificates
fi

# set correct envs if we are running in codespace
#if [ "$CODESPACES" = true ]; then
#fi

# make azure cli volume writable (to persist login tokens)
mkdir -p $AZURE_CONFIG_DIR
sudo chown $USER:$USER $AZURE_CONFIG_DIR

dotnet new install Aspire.ProjectTemplates
dotnet tool install -g Aspire.Cli --prerelease
