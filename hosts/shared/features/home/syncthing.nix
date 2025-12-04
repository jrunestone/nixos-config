{ pkgs, inputs, config, ... }: {
  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices = {
        "jr-windows" = {
          id = inputs.nixos-secrets.hosts.jr-windows.syncthing-id;
          name = "jr-windows";
        };
      };

      folders = {
        "shared" = {
          id = "shared";
          path = "/home/jr/Documents/shared";
          devices = [ "jr-windows" ];
        };
      };
    };
  };
}
