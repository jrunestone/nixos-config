{ pkgs, inputs, config, ... }: {
  home.file."${config.xdg.dataHome}/mkcert/localhost.pfx" = {
    force = true;
    source = inputs.nixos-secrets.hosts.${config.host-options.hostname}.certs.localhost-pfx;
  };
}
