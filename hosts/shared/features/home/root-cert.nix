{ pkgs, inputs, config, ... }: {
  home.file."${config.xdg.dataHome}/mkcert/rootCA.pem" = {
    force = true;
    source = inputs.nixos-secrets.hosts.${config.host-options.hostname}.certs.root;
  };

  home.file."${config.xdg.dataHome}/mkcert/rootCA-key.pem" = {
    force = true;
    source = inputs.nixos-secrets.hosts.${config.host-options.hostname}.certs.root-key;
  };
}
