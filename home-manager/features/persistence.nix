{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.persistence."/nix/persist/home" = {
    hideMounts = true;

    directories = [
      
    ];

    files = [
      
    ];
  };
}