#!/usr/bin/env bash

# this is run on "postCreateCommand" in the container AFTER the container is CREATED for the first time
# https://containers.dev/implementors/json_reference/

DEVC_DIR=./.devcontainer

# if the image doesn't load ip_tables modules dockerd will fail to launch (docker-in-docker)
# https://github.com/devcontainers/features/issues/1235
echo "Updating iptables"
sudo update-alternatives --set iptables /usr/sbin/iptables-nft

# create a dev https cert if a custom cert is not already present
if ! [ -f $DEVC_DIR/localhost.pfx ]; then
  echo "Creating default ASP.NET dev cert"
  dotnet dev-certs https --trust
  dotnet dev-certs https -ep $DEVC_DIR/localhost.pfx -p 'changeit'
fi

# do things if we are running in codespace
if [ "$CODESPACES" = true ]; then
  echo "Running in a Codespace"
fi

# create azure cli folder (to persist login tokens)
echo "Setting folder and volume permissions"
mkdir -p ./.az
sudo chown $USER:$USER ./.az

dotnet new install Aspire.ProjectTemplates
dotnet tool install -g Aspire.Cli --prerelease
