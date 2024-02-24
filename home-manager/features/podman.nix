{ pkgs, lib, config, ... }: {
  # point podman directly to the persistant folder, permission denied when using the local dir directly
  xdg.configFile."containers/storage.conf".text = ''
    [storage]
    driver = "overlay"
    graphroot = "/nix/persist/home/${config.home.username}/${config.xdg.dataHome}/containers"
  '';
}
