{ pkgs, inputs, config, ... }: {
  security.pki.certificateFiles = [inputs.nixos-secrets.hosts.${config.networking.hostName}.certs.root];
}
